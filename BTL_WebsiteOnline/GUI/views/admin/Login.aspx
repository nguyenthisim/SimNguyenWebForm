<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="GUI.views.admin.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../contents/admincss/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../contents/admincss/fonts/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../../contents/admincss/fonts/Linearicons-Free-v1.0.0/icon-font.min.css" rel="stylesheet" />
    <link href="../../contents/admincss/vendor/animate/animate.css" rel="stylesheet" />
    <link href="../../contents/admincss/vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" />
    <link href="../../contents/admincss/vendor/animsition/css/animsition.min.css" rel="stylesheet" />
    <link href="../../contents/admincss/vendor/select2/select2.min.css" rel="stylesheet" />
    <link href="../../contents/admincss/vendor/daterangepicker/daterangepicker.css" rel="stylesheet" />
    <link href="../../contents/admincss/css/util.css" rel="stylesheet" />
    <link href="../../contents/admincss/css/main.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="limiter">
		<div class="container-login100" style="background-image: url('../../contents/admincss/images/bg-01.jpg');">
            
			<div class="wrap-login100 p-t-30 p-b-50">
				<span class="login100-form-title p-b-41">
					Admin Login
				</span>
                <fieldset class="login100-form validate-form p-b-33 p-t-5">
                     <asp:Label ID="lblMsgError" runat="server" Text=""></asp:Label>
					<div class="wrap-input100 validate-input" data-validate = "Enter username">
                        <asp:TextBox ID="txtUserName" runat="server" class="input100"></asp:TextBox>
						
						<span class="focus-input100" data-placeholder="&#xe82a;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
                        <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" class="input100"></asp:TextBox>
						
						<span class="focus-input100" data-placeholder="&#xe80f;"></span>
					</div>

					<div class="container-login100-form-btn m-t-32">
                        <asp:Button ID="btnLogin" runat="server" Text="Đăng nhập" class="login100-form-btn"  OnClick="btnLogin_Click" />
						
					</div>

                </fieldset>
				
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
        </div>
    </form>
    
</body>
</html>
