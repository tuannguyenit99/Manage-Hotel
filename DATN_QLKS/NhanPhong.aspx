<%@ Page Title="Nhận Phòng" Language="C#" MasterPageFile="~/GiaoDienNhanVien.Master" AutoEventWireup="true" CodeBehind="NhanPhong.aspx.cs" Inherits="DATN_QLKS.NhanPhong" %>
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
    <h2>Nhận Phòng</h2>


    <br />
   
   
     <b>Số CMND: </b>
    <asp:TextBox ID="cmnd" runat="server" placeholder="Số CMND"> 

    </asp:TextBox>
    &nbsp; <asp:Button ID="Button1" runat="server" Text="Tra" CssClass="tim" Width="47px" OnClick="Button1_Click"  />

    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" CssClass="hihi" Height="150px" Width="889px" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
             <asp:TemplateField HeaderText="Mã HD" SortExpression="MaHD">
                 <EditItemTemplate>
                     <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("MaHD") %>'></asp:TextBox>
                 </EditItemTemplate>
                 <ItemTemplate>
                     <asp:Label ID="Label2" runat="server" Text='<%# Bind("MaHD") %>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>
            <asp:BoundField DataField="HoTen" HeaderText="Họ Và Tên" SortExpression="HoTen" />
            <asp:BoundField DataField="DiaChi" HeaderText="Địa Chỉ" SortExpression="DiaChi" />
            <asp:BoundField DataField="CMND" HeaderText="CMND" SortExpression="CMND" />
            <asp:BoundField DataField="DienThoai" HeaderText="Số ĐT" SortExpression="DienThoai" />
            <asp:TemplateField HeaderText="Số Phòng" SortExpression="MaPhong">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("MaPhong") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("MaPhong") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="NgayThue" HeaderText="Ngày Thuê" SortExpression="NgayThue" />
            <asp:BoundField DataField="NgayTra" HeaderText="Ngày Trả" SortExpression="NgayTra" />
            <asp:TemplateField HeaderText="Nhận Phòng">
                <EditItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Hủy Phòng">
                <EditItemTemplate>
                    <asp:CheckBox ID="CheckBox2" runat="server" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox2" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>

    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DATN_QUANLYKHACHSANConnectionString %>" SelectCommand="SELECT HDPhong.MaHD, KhachHang.HoTen, KhachHang.DiaChi, KhachHang.CMND, KhachHang.DienThoai, HDPhong.MaPhong, ThuePhong.NgayThue, ThuePhong.NgayTra FROM KhachHang INNER JOIN ChiTietThuePhong ON KhachHang.MaKH = ChiTietThuePhong.MaKH INNER JOIN ThuePhong ON ChiTietThuePhong.SoHDThuePhong = ThuePhong.SoHDThuePhong INNER JOIN HDPhong ON HDPhong.MaHD = ChiTietThuePhong.SoHDThuePhong WHERE (KhachHang.CMND = @cmnd) and HDPhong.TrangThai=1">
        <SelectParameters>
            <asp:ControlParameter ControlID="cmnd" Name="cmnd" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Button ID="Button2" runat="server" Text="Nhận/Hủy Phòng" CssClass="tim" OnClick="Button2_Click"  Visible="false" OnClientClick="return confirm('Bạn có muốn Nhận hoặc Hủy Phòng?')"/>




 
    <hr />

</asp:Content>
