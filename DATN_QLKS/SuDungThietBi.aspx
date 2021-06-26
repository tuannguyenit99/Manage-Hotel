<%@ Page Title="Sử Dụng Thiết Bị" Language="C#" MasterPageFile="~/GiaoDienNhanVien.Master" AutoEventWireup="true" CodeBehind="SuDungThietBi.aspx.cs" Inherits="DATN_QLKS.SuDungThietBi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body{
            text-align:center;
            margin:auto;
        }
         .tim{
           background:#ffd800;font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; 
           font-weight: bold;
       }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Thêm Thiết Bị Dịch Vụ</h2>
    <br />
    <hr />
    <b>Chọn Phòng :</b>&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="MaPhong" DataValueField="MaHD" AutoPostBack="True">

    </asp:DropDownList>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DATN_QUANLYKHACHSANConnectionString %>" SelectCommand="SELECT * FROM [HDPhong] WHERE ([TrangThai] = @TrangThai)">
    <SelectParameters>
        <asp:Parameter DefaultValue="2" Name="TrangThai" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
&nbsp;&nbsp;&nbsp;&nbsp;
    <b>Tên Thiết Bị :  </b>&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="TenThietBi" DataValueField="MaThietBi">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DATN_QUANLYKHACHSANConnectionString %>" SelectCommand="SELECT * FROM [ThietBi]"></asp:SqlDataSource>
    &nbsp;&nbsp;&nbsp;&nbsp; 
     <b>Số Lượng :  </b>&nbsp;&nbsp;&nbsp;&nbsp; <input type="number" runat="server" id="sl" min="1" max="1000" value="1" />
       &nbsp;&nbsp;&nbsp;&nbsp; 
     <asp:Button ID="Button1" runat="server" Text="Thêm" CssClass="tim" OnClick="Button1_Click" OnClientClick="return confirm('Bạn có muốn thêm dịch vụ')" />
     <br />
    <br />
    <hr />
    <br />
    <br />
    <div style="text-align:left">
    <b>Tên Khách Hàng: </b>&nbsp;  <b><asp:Label ID="tenkh" runat="server" Text=""></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;</b>&nbsp;&nbsp;&nbsp;&nbsp; ||&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <b>Số CMND: </b>&nbsp;   <b><asp:Label ID="cmnd" runat="server" Text=""></asp:Label></b> 
    <br />

        </div>
    <br />
    <br />

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" Height="194px" Width="991px" PageSize="15">
        <Columns>
           
            <asp:BoundField DataField="TenThietBi" HeaderText="Tên Thiết Bị Dịch Vụ" SortExpression="TenThietBi" />
            <asp:BoundField DataField="SoLuong" HeaderText="Số Lượng" SortExpression="SoLuong" />
            <asp:BoundField DataField="Expr1" HeaderText="Tiền" ReadOnly="True" SortExpression="Expr1" />
        </Columns>

    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DATN_QUANLYKHACHSANConnectionString %>" SelectCommand="SELECT ThietBi.TenThietBi, SuDungDV.SoLuong, ThietBi.Gia * SuDungDV.SoLuong AS Expr1 FROM ThietBi INNER JOIN SuDungDV ON ThietBi.MaThietBi = SuDungDV.MaThietBi INNER JOIN ThuePhong ON ThuePhong.SoHDThuePhong = SuDungDV.SoHDThuePhong WHERE (SuDungDV.SoHDThuePhong = @SoHDThue)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="SoHDThue" PropertyName="SelectedValue" />
        </SelectParameters>
</asp:SqlDataSource>
    <br />
    <br />
</asp:Content>
