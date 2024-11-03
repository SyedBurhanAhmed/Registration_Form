using System;
using System.Data.SqlClient;
using System.Globalization;
using System.Net.Mail;
using System.Net;
using System.Text.RegularExpressions;
using System.Web.UI;
using OfficeOpenXml;
using System.IO;
using System.Data.SqlTypes;
using System.Net.NetworkInformation;

namespace Registration_Form
{
    public partial class UserReg : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;

        }



        public void SendWhatsappLinkEmail(string recipientEmail)
        {
            string whatsappLink = "https://chat.whatsapp.com/BBe8nqcdI5c7K33vYZZpKD";
            var fromAddress = new MailAddress("ogloo950@gmail.com", "Syed Burhan Ahmed");
            var toAddress = new MailAddress(recipientEmail);
            const string fromPassword = "mxtuitogabgdcduo";
            const string subject = "Join Our WhatsApp Channel";
            string body = $"Thank you for registering with Lahore Arts Council! Join our WhatsApp channel using this link: {whatsappLink}";

            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
            };
            using (var message = new MailMessage(fromAddress, toAddress)
            {
                Subject = subject,
                Body = body
            })
            {
                smtp.Send(message);
            }
        }

        public void SendExcelFileEmail()
        {
            var fromAddress = new MailAddress("ogloo950@gmail.com", "Syed Burhan Ahmed");
            var toAddress = new MailAddress("sbahmed515@gmail.com"); // Replace with the admin email address
            const string fromPassword = "mxtuitogabgdcduo"; // Update this with your app password
            const string subject = "Updated Registrations File";
            string body = "Attached is the updated registrations file.";

            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
            };

            using (var message = new MailMessage(fromAddress, toAddress)
            {
                Subject = subject,
                Body = body
            })
            {
                // Add attachment
                string filePath = Server.MapPath("~/App_Data/Registrations.xlsx");
                if (File.Exists(filePath))
                {
                    Attachment attachment = new Attachment(filePath);
                    message.Attachments.Add(attachment);
                }

                smtp.Send(message);
            }
        }
        private bool ValidateFields(out string errorMessage)
        {
            errorMessage = "";

            string name = txtName.Text.Trim();
            string fatherName = txtFatherName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string phone = txtPhone.Text.Trim();
            string address = txtAddress.Text.Trim();
            string dob = txtDOB.Text.Trim();

            if (string.IsNullOrEmpty(name))
            {
                errorMessage = "Name is required.";
                return false;
            }
            if (string.IsNullOrEmpty(fatherName))
            {
                errorMessage = "Father's Name is required.";
                return false;
            }
            if (string.IsNullOrEmpty(email))
            {
                errorMessage = "Email is required.";
                return false;
            }
            if (!IsValidEmail(email))
            {
                errorMessage = "Invalid email format.";
                return false;
            }
            if (string.IsNullOrEmpty(phone))
            {
                errorMessage = "Phone number is required.";
                return false;
            }
            if (!IsValidPhoneNumber(phone))
            {
                errorMessage = "Invalid phone number format. Please use 01234567890 format.";
                return false;
            }
            if (string.IsNullOrEmpty(address))
            {
                errorMessage = "Address is required.";
                return false;
            }
            if (string.IsNullOrEmpty(dob))
            {
                errorMessage = "Date of Birth is required.";
                return false;
            }

            return true;
        }

        private void SaveToExcel(string name, string fatherName, string email, string gender, string phone, string category, string address, string city, string dob)
        {
            string filePath = Server.MapPath("~/App_Data/Registrations.xlsx");
            FileInfo fileInfo = new FileInfo(filePath);

            using (ExcelPackage package = new ExcelPackage(fileInfo))
            {
                ExcelWorksheet worksheet = package.Workbook.Worksheets["Registrations"];
                if (worksheet == null)
                {
                    worksheet = package.Workbook.Worksheets.Add("Registrations");
                    worksheet.Cells[1, 1].Value = "Name";
                    worksheet.Cells[1, 2].Value = "Father's Name";
                    worksheet.Cells[1, 3].Value = "Email";
                    worksheet.Cells[1, 4].Value = "Gender";
                    worksheet.Cells[1, 5].Value = "Phone";
                    worksheet.Cells[1, 6].Value = "Category";
                    worksheet.Cells[1, 7].Value = "Address";
                    worksheet.Cells[1, 8].Value = "City";
                    worksheet.Cells[1, 9].Value = "Date of Birth";
                }
                worksheet.Cells[1, 1, 1, 9].Style.Font.Bold = true;
                int rowCount = worksheet.Dimension?.Rows ?? 0;
                worksheet.Cells[rowCount + 1, 1].Value = name;
                worksheet.Cells[rowCount + 1, 2].Value = fatherName;
                worksheet.Cells[rowCount + 1, 3].Value = email;
                worksheet.Cells[rowCount + 1, 4].Value = gender;
                worksheet.Cells[rowCount + 1, 5].Value = phone;
                worksheet.Cells[rowCount + 1, 6].Value = category;
                worksheet.Cells[rowCount + 1, 7].Value = address;
                worksheet.Cells[rowCount + 1, 8].Value = city;
                worksheet.Cells[rowCount + 1, 9].Value = dob;

                package.Save();
            }
        }
        private bool IsValidEmail(string email)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;
            }
            catch
            {
                return false;
            }
        }
       
        protected void btnRegister_Click(object sender, EventArgs e)
        {

            string name = txtName.Text;
            string fatherName = txtFatherName.Text;
            string email = txtEmail.Text;
            string gender = DropDownList1.SelectedValue;
            string phone = txtPhone.Text;
            string category = ddlCategory.SelectedValue;
            string address = txtAddress.Text;
            string city = ddlCity.SelectedValue;
            string dob = txtDOB.Text;
            DateTime dateOfBirth = txtDOB.Text != "" ? Convert.ToDateTime(txtDOB.Text) : DateTime.MinValue;

            // Convert the DateTime to dd-MM-yyyy format
            string formattedDOB = dateOfBirth.ToString("dd-MM-yyyy");

            if (!ValidateFields(out string errorMessage))
            {
                Response.Write($"<script>alert('{errorMessage}');</script>");
                return;
            }
            SendWhatsappLinkEmail(email);
            SaveToExcel(name, fatherName, email, gender, phone, category, address, city, formattedDOB);
            SendExcelFileEmail();
            bool isInserted = InsertData(name, fatherName, email, gender, phone, category, address, city, formattedDOB);

            if (isInserted)
            {
                Response.Redirect("success.aspx");
            }
            else
            {
                Response.Write("<script>alert('Registration failed. Please try again.');</script>");
            }
        }

        private bool IsValidPhoneNumber(string phone)
        {
            string pattern = @"^\d{11}$";
            return Regex.IsMatch(phone, pattern);
        }

        private bool IsValidDateOfBirth(string dob)
        {
            string pattern = @"^\d{2}/\d{2}/\d{4}$";
            return Regex.IsMatch(dob, pattern);
        }

        private bool InsertData(string name, string fatherName, string email, string gender, string phone, string category, string address, string city, string dob)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["LACConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO LACuserreg (name, father_name, email, gender, phone, category, address, city, date_of_birth) VALUES (@Name, @FatherName, @Email, @Gender, @Phone, @Category, @Address, @City, @DOB)";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Name", name);
                    command.Parameters.AddWithValue("@FatherName", fatherName);
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@Gender", gender);
                    command.Parameters.AddWithValue("@Phone", phone);
                    command.Parameters.AddWithValue("@Category", category);
                    command.Parameters.AddWithValue("@Address", address);
                    command.Parameters.AddWithValue("@City", city);
                    command.Parameters.AddWithValue("@DOB", dob);

                    connection.Open();
                    int result = command.ExecuteNonQuery();
                    if (result > 0)
                    {
                    return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
        }
    }
}
