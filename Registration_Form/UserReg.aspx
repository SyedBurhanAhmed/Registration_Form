<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserReg.aspx.cs" Inherits="Registration_Form.UserReg" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LAC Registration Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
    <div class="container">
        <form class="row g-3 bg-light" runat="server">
            <div class="bg-primary p-4 rounded mb-3 mt-3">
                <h1 class="text-center text-light">LAC Registration Form</h1>
            </div>
            <div class="col-md-6">
                <label for="txtName" class="form-label">Name</label>
                <asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <label for="txtFatherName" class="form-label">Father's Name</label>
                <asp:TextBox ID="txtFatherName" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <label for="txtEmail" class="form-label">Email</label>
                <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <label for="DropDownList1" class="form-label">Gender</label>
                <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server">
                    <asp:ListItem Value="male">Male</asp:ListItem>
                    <asp:ListItem Value="female">Female</asp:ListItem>
                    <asp:ListItem Value="others">Others</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-md-6">
                <label for="txtPhone" class="form-label">Phone</label>
                <asp:TextBox ID="txtPhone" CssClass="form-control" runat="server" TextMode="Phone" placeholder="0123-4567890"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <label for="ddlCategory" class="form-label">Category</label>
                <asp:DropDownList ID="ddlCategory" CssClass="form-select" runat="server">
                    <asp:ListItem Value="Performing Arts">Performing Arts</asp:ListItem>
                    <asp:ListItem Value="Visual Arts">Visual Arts</asp:ListItem>
                    <asp:ListItem Value="Literature">Literature</asp:ListItem>
                    <asp:ListItem Value="Culture">Culture</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-12">
                <label for="txtAddress" class="form-label">Address</label>
                <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server" placeholder="12 Mall Road Lahore"></asp:TextBox>
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
            </div>
            <div class="col-md-2">
                <label for="inputDOB" class="form-label">Date of Birth</label>
                <asp:TextBox ID="txtDOB" CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox>
            </div>
            <div class="col-12 mb-3">
                <asp:Button ID="btnRegister" CssClass="btn btn-primary" runat="server" Text="Register" OnClick="btnRegister_Click" />
            </div>
        </form>
    </div>
</body>
</html>


