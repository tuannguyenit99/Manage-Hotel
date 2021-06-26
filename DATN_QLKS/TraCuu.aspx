<%@ Page Title="Tra Cứu Phòng" Language="C#" MasterPageFile="~/TrangChu.Master" AutoEventWireup="true" CodeBehind="TraCuu.aspx.cs" Inherits="DATN_QLKS.TraCuu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body{
            margin:auto;
            text-align:center;

        }
         .tim{
           background:#ffd800;font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; 
           font-weight: bold;
       }
         .hihi{
             margin:auto;
             text-align:center;
         }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <hr />
    <h2>Tra Cứu Phòng</h2>
    <br />
     <b>Nhập số CMND: </b>
    <asp:TextBox ID="cmnd" runat="server" placeholder="Nhập số CMND"> 

    </asp:TextBox>
    &nbsp; <asp:Button ID="Button1" runat="server" Text="Tra Cứu" CssClass="tim"  />

    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" CssClass="hihi" Height="150px" Width="889px" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="HoTen" HeaderText="Họ Và Tên" SortExpression="HoTen" />
            <asp:BoundField DataField="DiaChi" HeaderText="Địa Chỉ" SortExpression="DiaChi" />
            <asp:BoundField DataField="CMND" HeaderText="CMND" SortExpression="CMND" />
            <asp:BoundField DataField="DienThoai" HeaderText="Số ĐT" SortExpression="DienThoai" />
            <asp:BoundField DataField="MaPhong" HeaderText="Số Phòng" SortExpression="MaPhong" />
            <asp:BoundField DataField="NgayThue" HeaderText="Ngày Thuê" SortExpression="NgayThue" />
            <asp:BoundField DataField="NgayTra" HeaderText="Ngày Trả" SortExpression="NgayTra" />
        </Columns>

    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DATN_QUANLYKHACHSANConnectionString %>" SelectCommand="SELECT KhachHang.HoTen, KhachHang.DiaChi, KhachHang.CMND, KhachHang.DienThoai, HDPhong.MaPhong, ThuePhong.NgayThue, ThuePhong.NgayTra FROM KhachHang INNER JOIN ChiTietThuePhong ON KhachHang.MaKH = ChiTietThuePhong.MaKH INNER JOIN ThuePhong ON ChiTietThuePhong.SoHDThuePhong = ThuePhong.SoHDThuePhong INNER JOIN HDPhong ON HDPhong.MaHD = ChiTietThuePhong.SoHDThuePhong WHERE (KhachHang.CMND = @cmnd) and HDPhong.TrangThai=1">
        <SelectParameters>
            <asp:ControlParameter ControlID="cmnd" Name="cmnd" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <hr />
</asp:Content>
