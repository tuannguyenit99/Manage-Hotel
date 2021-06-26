<%@ Page Title="Trả Phòng" Language="C#" MasterPageFile="~/GiaoDienNhanVien.Master" AutoEventWireup="true" CodeBehind="TraPhong.aspx.cs" Inherits="DATN_QLKS.TraPhong" %>
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
    <h2>Trả Phòng</h2>
     <b>Chọn Phòng :</b>&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="MaPhong" DataValueField="MaHD" AutoPostBack="True">

    </asp:DropDownList>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DATN_QUANLYKHACHSANConnectionString %>" SelectCommand="SELECT * FROM [HDPhong] WHERE ([TrangThai] = @TrangThai)">
    <SelectParameters>
        <asp:Parameter DefaultValue="2" Name="TrangThai" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
&nbsp;&nbsp;&nbsp;&nbsp;
    <br />

    <br />
    <br />
    <div style="text-align:center; margin-left:-250px">
    <b>Tên Khách Hàng: </b>&nbsp;  <b><asp:Label ID="tenkh" runat="server" Text=""></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;</b>&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <b>Số CMND: </b>&nbsp;   <b><asp:Label ID="cmnd" runat="server" Text=""></asp:Label></b> 
        </div>
    <div style="text-align:center">
        <br />
        <br />
        <br />
    <b>Số Hóa Đơn: </b>&nbsp;  <b><asp:Label ID="SHD" runat="server" Text=""></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;</b>&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <b>Ngày Thanh Toán : </b>&nbsp;   <b><asp:Label ID="ngay" runat="server" Text=""></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <b>Tiền Phòng : </b>&nbsp;   <b><asp:Label ID="TienPhong" runat="server" Text=""></asp:Label>
        <br />
        <br />
        </b> 
    <br />

        </div>
    <hr />
    <br />
     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" Height="194px" Width="991px" PageSize="15">
        <Columns>
           
            <asp:BoundField DataField="TenThietBi" HeaderText="Tên Thiết Bị Dịch Vụ" SortExpression="TenThietBi" />
            <asp:BoundField DataField="SoLuong" HeaderText="Số Lượng" SortExpression="SoLuong" />
            <asp:BoundField DataField="Gia" HeaderText="Đơn Giá" SortExpression="Gia" />
            <asp:TemplateField HeaderText="Tiền" SortExpression="Expr1">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Expr1") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Expr1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>

    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DATN_QUANLYKHACHSANConnectionString %>" SelectCommand="SELECT ThietBi.TenThietBi, SuDungDV.SoLuong, ThietBi.Gia, ThietBi.Gia * SuDungDV.SoLuong AS Expr1 FROM ThietBi INNER JOIN SuDungDV ON ThietBi.MaThietBi = SuDungDV.MaThietBi INNER JOIN ThuePhong ON ThuePhong.SoHDThuePhong = SuDungDV.SoHDThuePhong WHERE (SuDungDV.SoHDThuePhong = @SoHDThue)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="SoHDThue" PropertyName="SelectedValue" />
        </SelectParameters>
</asp:SqlDataSource>
    <br />

    <hr />
    <br />
    <h3 style="text-align:right;margin-right:50px;color:#d72ee4">Tổng Tiền DV :&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="TienDV" runat="server" Text=""></asp:Label> VND </h3>

    <h3 style="text-align:right;margin-right:40px;color:#d72ee4">Tổng Tiền :&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="TongTien" runat="server" Text=""></asp:Label> VND </h3>

    <br />
    <div style="text-align:right;margin-right:10px;">
    <i >Tiền bằng chữ: &nbsp;&nbsp; <asp:Label ID="tienchu" runat="server" Text=""></asp:Label></i>
        </div>
    <br />
    <br />
    <hr />
    


<br />

        <asp:Button ID="ThanhToan" runat="server" Text="Thanh Toán" CssClass="tim" OnClick="ThanhToan_Click"  OnClientClick="return confirm('Bạn có chắc chắc thanh toán')" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="INHD" runat="server" Text="IN HD" CssClass="tim"   />



    


  



    


    </b>



    


  



    


</asp:Content>
