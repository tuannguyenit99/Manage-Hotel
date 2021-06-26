<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="DATN_QLKS.DangNhap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>
       Đăng Nhập 
    </title>
     <style>
         body{
              background-image:url("Picture/bia4.jpg");
            
              background-repeat:no-repeat;
           
         }
        .dn{
            text-align:center;
             width:600px;
             height:500px;
             background-color:none;
             margin-left:400px;
             margin-top:100px;
             margin-bottom:200px;
        }
        h1{
            color:#0094ff;
        }

            </style>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
ipt>
   
</head>
<body>
    <form id="form1" runat="server">
        <div class="dn">
            <br />
            <h1>Đăng Nhập</h1>
            <br />

             Tài Khoản &nbsp;&nbsp;  <asp:TextBox ID="Txttaikhoan" runat="server" ></asp:TextBox>
            <br />
            <br />
             Mât Khẩu &nbsp;&nbsp;<asp:TextBox ID="Txtpass" runat="server" TextMode="Password" ></asp:TextBox>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <input id="Checkbox1" type="checkbox" onchange="document.getElementById('Txtpass').type=this.checked ?'Text' :'Password'" /> Hiển thị mật khẩu
            <br />
            <br />
               <asp:Button ID="BtDangnhap" runat="server" Text="Đăng nhập" BackColor="#3366FF" ForeColor="White" OnClick="Check_CheckedChanged" CssClass="btn btn-succees" />  
            <br />
    
           
            <br />
            <br />
            <asp:Label ID="Tb" runat="server" Text="" ForeColor="Red"></asp:Label>
    
           
        </div>
    </form>
</body>
</html>

