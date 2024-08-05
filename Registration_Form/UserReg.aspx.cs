using System;
using System.Data.SqlClient;
using System.Globalization;
using System.Text.RegularExpressions;
using System.Web.UI;

namespace Registration_Form
{
    public partial class UserReg : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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

            if (!IsValidPhoneNumber(phone))
            {
                Response.Write("<script>alert('Invalid phone number format. Please use 0123-4567890 format.');</script>");
                return;
            }

            bool isInserted = InsertData(name, fatherName, email, gender, phone, category, address, city, formattedDOB);

            if (isInserted)
            {
                Response.Write("<script>alert('Registration successful!');</script>");
            }
            else
            {
                Response.Write("<script>alert('Registration failed. Please try again.');</script>");
            }
        }

        private bool IsValidPhoneNumber(string phone)
        {
            string pattern = @"^\d{4}-\d{7}$";
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
