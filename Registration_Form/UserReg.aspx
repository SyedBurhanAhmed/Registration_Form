<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserReg.aspx.cs" Inherits="Registration_Form.UserReg" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LAC Registration Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <style>
        .error {
            border-color: red;
            background-color: #fdd;
        }
        .error-message {
            color: red;
            font-size: 0.9em;
        }
        .is-invalid {
            border-color: #dc3545; /* Red border to indicate an error */
            background-color: #f8d7da; /* Light red background */
        }
        .is-invalid::placeholder {
            color: #dc3545; /* Red color for placeholder text */
        }
        .form-label {
            color: white; /* Makes label text white */
        }

        .form-control,
        .form-select {
            background-color: rgba(255, 255, 255, 0.3); /* Light, semi-transparent background */
            border: 1px solid #ccc; /* Light border */
            color: black; /* Text color */
        }

        .form-control::placeholder,
        .form-select::placeholder {
            color: #000000; /* Darker placeholder text */
            opacity: 1; /* Ensures the placeholder color is not translucent */
        }

        .form-background {
            position: relative; /* Required for positioning the overlay */
            padding: 20px; /* Adds some padding inside the form */
            border-radius: 5px; /* Rounded corners */
        }

        .background-image {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url('https://i.imgur.com/96NNkBs.jpeg');
            background-size: cover;
            background-position: center;
            filter: blur(4px); /* Adjust blur intensity as needed */
            z-index: -1; /* Ensures it stays behind the content */
        }

        .header-background {
            color: white;
        }
        .btn-danger {
        background-color: red;
        border-color: red;
        color: white;
    }

        .form-container {
            position: relative;
            z-index: 1; /* Ensures the form content stays above the background */
            background-color: rgba(255, 255, 255, 0.1); /* Semi-transparent white background */
            padding: 20px;
            border-radius: 5px;
        }
    </style>

<script>
    function validateField(field) {
        var value = field.value.trim();
        var errorField = document.getElementById(field.id + "_error");

        if (value === "") {
            field.classList.add("is-invalid");
            if (errorField) {
                errorField.innerHTML = "This field is required.";
            }
        } else {
            field.classList.remove("is-invalid");
            if (errorField) {
                errorField.innerHTML = "";
            }
        }
    }

    function validateForm() {
        var fields = document.querySelectorAll(".form-control, .form-select");
        var allValid = true;

        fields.forEach(function (field) {
            var value = field.value.trim();
            if (value === "") {
                field.classList.add("is-invalid");
                allValid = false;
            } else {
                field.classList.remove("is-invalid");
            }
        });

        // Disable submit button if form is invalid
        document.getElementById("btnRegister").disabled = !allValid;

        return allValid;
    }

    document.addEventListener('DOMContentLoaded', function () {
        var form = document.querySelector('form');
        var fields = form.querySelectorAll(".form-control, .form-select");
        var dobField = document.getElementById("txtDOB"); // Replace with the actual ID of the DOB field
        var btnRegister = document.getElementById("btnRegister");

        // Validate field on blur only after DOB field
        dobField.addEventListener('blur', function () {
            fields.forEach(function (field) {
                field.addEventListener('blur', function () {
                    validateField(field);
                });
            });
            validateForm();
        });

        // Validate form on submit
        form.addEventListener('submit', function (e) {
            if (!validateForm()) {
                e.preventDefault(); // Prevent form submission if invalid
            }
        });

        // Initially disable the submit button
        btnRegister.disabled = true;
    });
</script>


</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="form-background">
                <div class="background-image"></div>
                <form class="row g-3 form-container" runat="server" onsubmit="return validateForm();">
                    <div class="col-12 header-background p-4 rounded mb-3 mt-3">
                        <h1 class="text-center">LAC Registration Form</h1>
                    </div>

                <div class="col-md-6">
                    <label for="txtName" class="form-label">Name</label>
                    <asp:TextBox ID="txtName" CssClass="form-control" runat="server" onblur="validateField(this)"></asp:TextBox>
                    <span id="txtName_error" class="error-message"></span>
                </div>
                <div class="col-md-6">
                    <label for="txtFatherName" class="form-label">Father's Name</label>
                    <asp:TextBox ID="txtFatherName" CssClass="form-control" runat="server" onblur="validateField(this)"></asp:TextBox>
                    <span id="txtFatherName_error" class="error-message"></span>
                </div>
                <div class="col-md-6">
                    <label for="txtEmail" class="form-label">Email</label>
                    <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" TextMode="Email" onblur="validateField(this)"></asp:TextBox>
                    <span id="txtEmail_error" class="error-message"></span>
                </div>
                <div class="col-md-6">
                    <label for="DropDownList1" class="form-label">Gender</label>
                    <asp:DropDownList ID="DropDownList1" CssClass="form-control form-select" runat="server" onblur="validateField(this)">
                        <asp:ListItem Value="">Select Gender</asp:ListItem>
                        <asp:ListItem Value="Male">Male</asp:ListItem>
                        <asp:ListItem Value="Female">Female</asp:ListItem>
                        <asp:ListItem Value="Others">Others</asp:ListItem>
                    </asp:DropDownList>
                    <span id="DropDownList1_error" class="error-message"></span>
                </div>
                <div class="col-md-6">
                    <label for="txtPhone" class="form-label">Phone</label>
                    <asp:TextBox ID="txtPhone" CssClass="form-control" runat="server" TextMode="Phone" onblur="validateField(this)"></asp:TextBox>
                    <span id="txtPhone_error" class="error-message"></span>
                </div>
                <div class="col-md-6">
                    <label for="ddlCategory" class="form-label">Category</label>
                    <asp:DropDownList ID="ddlCategory" CssClass="form-control form-select" runat="server" onblur="validateField(this)">
                        <asp:ListItem Value="">Select Category</asp:ListItem>
                        <asp:ListItem Value="Performing Arts">Performing Arts</asp:ListItem>
                        <asp:ListItem Value="Visual Arts">Visual Arts</asp:ListItem>
                        <asp:ListItem Value="Literature">Literature</asp:ListItem>
                        <asp:ListItem Value="Culture">Culture</asp:ListItem>
                    </asp:DropDownList>
                    <span id="ddlCategory_error" class="error-message"></span>
                </div>
                <div class="col-12">
                    <label for="txtAddress" class="form-label">Address</label>
                    <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server" onblur="validateField(this)"></asp:TextBox>
                    <span id="txtAddress_error" class="error-message"></span>
                </div>
                <div class="col-md-6">
                <label for="ddlCity" class="form-label">City</label>
                <asp:DropDownList ID="ddlCity" CssClass="form-select" runat="server">
                    <asp:ListItem Value="Lahore">Lahore</asp:ListItem>
                    <asp:ListItem Value="Karachi">Karachi</asp:ListItem>
                    <asp:ListItem Value="Islamabad">Islamabad</asp:ListItem>
                    <asp:ListItem Value="Rawalpindi">Rawalpindi</asp:ListItem>
                    <asp:ListItem Value="Faisalabad">Faisalabad</asp:ListItem>
                    <asp:ListItem Value="Multan">Multan</asp:ListItem>
                    <asp:ListItem Value="Peshawar">Peshawar</asp:ListItem>
                    <asp:ListItem Value="Quetta">Quetta</asp:ListItem>
                    <asp:ListItem Value="Sialkot">Sialkot</asp:ListItem>
                    <asp:ListItem Value="Hyderabad">Hyderabad</asp:ListItem>
                    <asp:ListItem Value="Gujranwala">Gujranwala</asp:ListItem>
                    <asp:ListItem Value="Sargodha">Sargodha</asp:ListItem>
                    <asp:ListItem Value="Bahawalpur">Bahawalpur</asp:ListItem>
                    <asp:ListItem Value="Sukkur">Sukkur</asp:ListItem>
                    <asp:ListItem Value="Larkana">Larkana</asp:ListItem>
                    <asp:ListItem Value="Sheikhupura">Sheikhupura</asp:ListItem>
                    <asp:ListItem Value="Jhang">Jhang</asp:ListItem>
                    <asp:ListItem Value="Gujrat">Gujrat</asp:ListItem>
                    <asp:ListItem Value="Mardan">Mardan</asp:ListItem>
                    <asp:ListItem Value="Kasur">Kasur</asp:ListItem>
                    <asp:ListItem Value="Dera Ghazi Khan">Dera Ghazi Khan</asp:ListItem>
                    <asp:ListItem Value="Okara">Okara</asp:ListItem>
                    <asp:ListItem Value="Nawabshah">Nawabshah</asp:ListItem>
                    <asp:ListItem Value="Mingora">Mingora</asp:ListItem>
                    <asp:ListItem Value="Mirpur Khas">Mirpur Khas</asp:ListItem>
                    <asp:ListItem Value="Chiniot">Chiniot</asp:ListItem>
                    <asp:ListItem Value="Sadiqabad">Sadiqabad</asp:ListItem>
                    <asp:ListItem Value="Turbat">Turbat</asp:ListItem>
                    <asp:ListItem Value="Shikarpur">Shikarpur</asp:ListItem>
                    <asp:ListItem Value="Jhelum">Jhelum</asp:ListItem>
                    <asp:ListItem Value="Mandi Bahauddin">Mandi Bahauddin</asp:ListItem>
                    <asp:ListItem Value="Mianwali">Mianwali</asp:ListItem>
                    <asp:ListItem Value="Kot Adu">Kot Adu</asp:ListItem>
                    <asp:ListItem Value="Kohat">Kohat</asp:ListItem>
                    <asp:ListItem Value="Hafizabad">Hafizabad</asp:ListItem>
                    <asp:ListItem Value="Khanpur">Khanpur</asp:ListItem>
                    <asp:ListItem Value="Rahim Yar Khan">Rahim Yar Khan</asp:ListItem>
                    <asp:ListItem Value="Gojra">Gojra</asp:ListItem>
                    <asp:ListItem Value="Bahawalnagar">Bahawalnagar</asp:ListItem>
                    <asp:ListItem Value="Muridke">Muridke</asp:ListItem>
                    <asp:ListItem Value="Chishtian">Chishtian</asp:ListItem>
                    <asp:ListItem Value="Abbottabad">Abbottabad</asp:ListItem>
                    <asp:ListItem Value="Daska">Daska</asp:ListItem>
                    <asp:ListItem Value="Tando Allahyar">Tando Allahyar</asp:ListItem>
                    <asp:ListItem Value="Vihari">Vihari</asp:ListItem>
                    <asp:ListItem Value="Jaranwala">Jaranwala</asp:ListItem>
                    <asp:ListItem Value="Kamalia">Kamalia</asp:ListItem>
                    <asp:ListItem Value="Kotri">Kotri</asp:ListItem>
                    <asp:ListItem Value="Kabirwala">Kabirwala</asp:ListItem>
                    <asp:ListItem Value="Khanewal">Khanewal</asp:ListItem>
                    <asp:ListItem Value="Chakwal">Chakwal</asp:ListItem>
                    <asp:ListItem Value="Gujrat">Gujrat</asp:ListItem>
                    <asp:ListItem Value="Khuzdar">Khuzdar</asp:ListItem>
                    <asp:ListItem Value="Bannu">Bannu</asp:ListItem>
                    <asp:ListItem Value="Dera Ismail Khan">Dera Ismail Khan</asp:ListItem>
                    <asp:ListItem Value="Charsadda">Charsadda</asp:ListItem>
                    <asp:ListItem Value="Vehari">Vehari</asp:ListItem>
                    <asp:ListItem Value="Swabi">Swabi</asp:ListItem>
                    <asp:ListItem Value="Muzaffargarh">Muzaffargarh</asp:ListItem>
                    <asp:ListItem Value="Ghotki">Ghotki</asp:ListItem>
                    <asp:ListItem Value="Kambar">Kambar</asp:ListItem>
                    <asp:ListItem Value="Khairpur">Khairpur</asp:ListItem>
                    <asp:ListItem Value="Kotli">Kotli</asp:ListItem>
                    <asp:ListItem Value="Jamshoro">Jamshoro</asp:ListItem>
                    <asp:ListItem Value="Jatoi">Jatoi</asp:ListItem>
                    <asp:ListItem Value="Haripur">Haripur</asp:ListItem>
                    <asp:ListItem Value="Shahdadkot">Shahdadkot</asp:ListItem>
                    <asp:ListItem Value="Chaman">Chaman</asp:ListItem>
                    <asp:ListItem Value="Hangu">Hangu</asp:ListItem>
                    <asp:ListItem Value="Hub">Hub</asp:ListItem>
                    <asp:ListItem Value="Kamoke">Kamoke</asp:ListItem>
                    <asp:ListItem Value="Muridke">Muridke</asp:ListItem>
                    <asp:ListItem Value="Kandhkot">Kandhkot</asp:ListItem>
                    <asp:ListItem Value="Pano Aqil">Pano Aqil</asp:ListItem>
                    <asp:ListItem Value="Nowshera">Nowshera</asp:ListItem>
                    <asp:ListItem Value="Dera Allah Yar">Dera Allah Yar</asp:ListItem>
                    <asp:ListItem Value="Tank">Tank</asp:ListItem>
                    <asp:ListItem Value="Lodhran">Lodhran</asp:ListItem>
                    <asp:ListItem Value="Matiari">Matiari</asp:ListItem>
                    <asp:ListItem Value="Tando Muhammad Khan">Tando Muhammad Khan</asp:ListItem>
                    </asp:DropDownList>
                    <span id="ddlCity_error" class="error-message"></span>
                </div>
                <div class="col-md-2">
                    <label for="txtDOB" class="form-label">Date of Birth</label>
                    <asp:TextBox ID="txtDOB" CssClass="form-control" runat="server" TextMode="Date" onblur="validateField(this)"></asp:TextBox>
                    <span id="txtDOB_error" class="error-message"></span>
                </div>
                <div class="col-12 mb-3">
                <asp:Button ID="btnRegister" CssClass="btn btn-danger" runat="server" Text="Register" OnClick="btnRegister_Click" Enabled="false"/>
            </div>
            </form>
        </div>
    </div>
</body>
</html>
            
