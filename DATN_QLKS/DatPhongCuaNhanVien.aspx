<%@ Page Title="Đặt Phòng Nhân Viên" Language="C#" MasterPageFile="~/GiaoDienNhanVien.Master" AutoEventWireup="true" CodeBehind="DatPhongCuaNhanVien.aspx.cs" Inherits="DATN_QLKS.DatPhongCuaNhanVien" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            margin: auto;
            width: 1000px;
            height: auto;
            background: #ffffff;
            text-align:center;
             }
       .tim{
           background:#ffd800;font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; 
           font-weight: bold;
       }
        .timkiem {
            margin:auto;
            width:1000px;
        }
        .cc{
            font-size:22px;
            color:#2658e2;
        }
       

        .thumbnail img {
    width: 100%; 
    height: 100%;  
    transition-duration: 0.8s;
        /* Safari & Google Chrome */
        -webkit-transition-duration: 0.8s; 
        /* Mozilla Firefox */
        -moz-transition-duration: 0.8s; 
        /* Opera */
        -o-transition-duration: 0.8s;
        /* IE 9 */
        /*-ms-transition-duration: 0.8s;*/
}
         
/* Hover chuột vào thumbnail */
.thumbnail img:hover {
    transform: scale(1.2);
        /* Safari & Google Chrome */
        -webkit-transform: scale(1.2);
        /* Mozilla Firefox */
        -moz-transform: scale(1.2); 
        /* Opera */
        -o-transform: scale(1.2);
        /* IE 9 */
        -ms-transform: scale(1.2);
    cursor: pointer; 
}





    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <hr />
    <br />
    <h1>  Đặt Phòng Trực Tiếp</h1>
   <br />
   <b>
         Ngày Đến: 
    <input type="datetime-local" runat="server" id="ngayden"  />
       </b>
    <b>
    Ngày Trả:
    <input type="datetime-local" runat="server" id="ngaydi"  />
      </b>
    <b>
    Loại Phòng
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="LoaiPhong" DataValueField="MaLoaiPhong">
            <asp:ListItem>Chọn Loại Phòng</asp:ListItem>

        </asp:DropDownList>
  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DATN_QUANLYKHACHSANConnectionString %>" SelectCommand="SELECT * FROM [LoaiPhong]"></asp:SqlDataSource>
        <asp:Button ID="Button1" runat="server" Text="Tìm Phòng" CssClass="tim" OnClick="Button1_Click" />
      
    <br />
      
  </b>
    <br />
    <asp:Label ID="chuanhien" runat="server" Text="Thông Tin Tìm Kiếm" CssClass="cc" Visible="false">
        
    </asp:Label>
    <br />
      <br />
    

      
  
  <asp:GridView ID="GridView1" runat="server" CssClass="timkiem" AutoGenerateColumns="False" DataKeyNames="MaPhong" DataSourceID="SqlDataSource2" Height="225px" Width="1000px">
        <Columns>
            <asp:TemplateField HeaderText="Số Phòng" InsertVisible="False" SortExpression="MaPhong">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("MaPhong") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("MaPhong") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Ảnh" SortExpression="Anh">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Anh") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>

                    <div class="thumbnail">
                        <asp:Image ID="Anh" runat="server" ImageUrl='<%#"~/Picture/"+Eval("anh") %>' Width="300px" Height="200px" />
                                </div>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="GioiThieu" HeaderText="Thông Tin Phòng" SortExpression="GioiThieu" />

            <asp:BoundField DataField="GiaTien" HeaderText="Giá Tiền" SortExpression="GiaTien" /> 


            <asp:TemplateField HeaderText="Chọn">
                <EditItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server"  />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DATN_QUANLYKHACHSANConnectionString %>" SelectCommand="SELECT DanhMucPhong.MaPhong, DanhMucPhong.Anh, DanhMucPhong.GioiThieu, LoaiPhong.GiaTien FROM DanhMucPhong INNER JOIN LoaiPhong ON LoaiPhong.MaLoaiPhong = DanhMucPhong.MaLoaiPhong WHERE (DanhMucPhong.MaLoaiPhong = @MaLoaiPhong) AND (DanhMucPhong.TinhTrang IS NULL)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="MaLoaiPhong" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    

      
  
  <br />
      <asp:Button ID="Button2" runat="server" Text="Đặt Phòng" CssClass="tim" OnClick="Button2_Click"  Visible="false"/>
    

    <br />
    <br />
      <hr />
     <br />
</asp:Content>
