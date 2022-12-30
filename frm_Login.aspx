<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_Login.aspx.cs" Inherits="PROJECT_KHELKABADDI.frm_Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>MHKBD LIVE</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="../../assets_admin/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="../../assets_admin/vendors/css/vendor.bundle.base.css">

    <link rel="stylesheet" href="../../assets_admin/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="../../assets_admin/images/favicon.ico" />

</head>
<body>
    <div class="container-scroller">
        <div class="container-fluid page-body-wrapper full-page-wrapper">
            <div class="content-wrapper d-flex align-items-center auth">
                <div class="row flex-grow">
                    <div class="col-lg-4 mx-auto">
                        <div class="auth-form-light text-left p-5">
                            <div class="brand-logo">
                                <img src="../../assets_admin/images/logo.jpeg">
                            </div>
                            <h4>Hello! let's get started Matches</h4>
                            <h6 class="font-weight-light">Sign in to continue.</h6>
                            <form id="form1" runat="server" class="pt-3">
                                <div class="form-group">
                                    <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control form-control-lg" placeholder="Username"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="txtUserName"
                                        CssClass="failureNotification" ForeColor="Red" ErrorMessage="User Name is required." ToolTip="User Name is required."
                                        ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>

                                </div>
                                <div class="form-group">


                                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control form-control-lg" TextMode="Password" placeholder="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="txtPassword"
                                        CssClass="failureNotification" ForeColor="Red" ErrorMessage="Password is required." ToolTip="Password is required."
                                        ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>

                                </div>
                                <div class="mt-3">

                                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="SIGN IN" CssClass="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn"
                                        ValidationGroup="LoginUserValidationGroup" OnClick="LoginButton_Click" />
                                </div>
                                <div class="my-2 d-flex justify-content-between align-items-center">
                                    <div class="form-check">
                                        <label class="form-check-label text-muted">
                                            <input type="checkbox" class="form-check-input">
                                            Keep me signed in
                                        </label>
                                    </div>
                                   <%-- <a href="ResetPassword.aspx" class="auth-link text-black">Reset password?</a>--%>
                                </div>

                                <div class="text-center mt-4 font-weight-light">
                                    Don't have an account? <a href="Registration.aspx" 
                                        class="text-primary">Create</a>
                                </div>
                                <div>
                                    <br />
                                    <asp:Label ID="lblError" Style="text-align:center" ForeColor="Red" runat="server" Visible="false"></asp:Label>

                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- content-wrapper ends -->
        </div>
        <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="../../assets_admin/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="../../assets_admin/js/off-canvas.js"></script>
    <script src="../../assets_admin/js/hoverable-collapse.js"></script>
    <script src="../../assets_admin/js/misc.js"></script>
    <!-- endinject -->
</body>

</html>
