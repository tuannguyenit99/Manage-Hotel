<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="INHD.aspx.cs" Inherits="DATN_QLKS.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Khách Sạn Minh Anh</title>
    <style>
        body{
            text-align:center;
            margin:auto;
        }
    </style>
    <script type="text/javascript">


        function haha() {
            document.getElementById('cc').style.display = "none";
            window.print();
           
        }

    </script>

   
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Hóa Đơn Thanh Toán</h1>
            <input type="button" value="IN HĐ" onclick="haha();" id="cc" /> 
        </div>
    </form>
</body>
</html>
