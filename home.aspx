<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="college.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <link href="css/style.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
        <script src="Scripts/bootstrap.min.js"></script>
        <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    
        <div>
             <nav>
      <div class="logo"><i class="fa fa-graduation-cap" aria-hidden="true"></i><strong>E</strong>Notes</div>
      <label for="click" class="menu-btn">
        <i class="fas fa-bars"></i>
      </label>
      <ul>
        <li><a class="active" href="#"><i class="fa fa-home" aria-hidden="true"></i>Home</a></li>
        <li><a href="login.aspx"><i class="fa fa-user-circle" aria-hidden="true"></i>Login</a></li>
        <li><a href="register.aspx"><i class="fa fa-user-plus" aria-hidden="true"></i>Register</a></li>
      </ul>
    </nav>
        </div>
    
</body>
</html>
