<%@ Page Title="" Language="C#" MasterPageFile="~/GiaoDienNhanVien.Master" AutoEventWireup="true" CodeBehind="ThongTinKhachChoNhanVien.aspx.cs" Inherits="DATN_QLKS.ThongTinKhachChoNhanVien" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body{
            text-align:center;
            margin:auto;

        }
        .kh{
            text-align:center;
             margin:auto;
        }
        .haha{
            text-decoration:none;
            font-size:20px;
           
            color:#2411cc;
            
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
  <h3> <b>Hoàn Thành Thông Tin Khách Hàng</b></h3> 
    <br />
    <br />
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="MaKH" DataSourceID="SqlDataSource1" DefaultMode="Insert" CssClass="kh" Width="489px">
        <EditItemTemplate>
            MaKH:
            <asp:Label ID="MaKHLabel1" runat="server" Text='<%# Eval("MaKH") %>' />
            <br />
            HoTen:
            <asp:TextBox ID="HoTenTextBox" runat="server" Text='<%# Bind("HoTen") %>' />
            <br />
            GioiTinh:
            <asp:TextBox ID="GioiTinhTextBox" runat="server" Text='<%# Bind("GioiTinh") %>' />
            <br />
            DiaChi:
            <asp:TextBox ID="DiaChiTextBox" runat="server" Text='<%# Bind("DiaChi") %>' />
            <br />
            CMND:
            <asp:TextBox ID="CMNDTextBox" runat="server" Text='<%# Bind("CMND") %>' />
            <br />
            DienThoai:
            <asp:TextBox ID="DienThoaiTextBox" runat="server" Text='<%# Bind("DienThoai") %>' />
            <br />
            QuocTich:
            <asp:TextBox ID="QuocTichTextBox" runat="server" Text='<%# Bind("QuocTich") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            Tên Khách Hàng&nbsp;
            <asp:TextBox ID="HoTenTextBox" runat="server" Text='<%# Bind("HoTen") %>' placeholder="Nhập Họ Tên" />
            <br />
            <br />
            Giới Tính:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="GioiTinhTextBox" runat="server" Text='<%# Bind("GioiTinh") %>' placeholder="Nhập giới tính" />
            <br />
            <br />
            Địa Chỉ:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="DiaChiTextBox" runat="server" Text='<%# Bind("DiaChi") %>'  placeholder="Nhập địa chỉ"/>
            <br />
            <br />
            CMND:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
            <asp:TextBox ID="CMNDTextBox" runat="server" Text='<%# Bind("CMND") %>' placeholder="Nhập số CMND" />
            <br />
            <br />
            Điện Thoại:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="DienThoaiTextBox" runat="server" Text='<%# Bind("DienThoai") %>' placeholder="Nhập số ĐT" />
            <br />
            <br />
            Quốc Tịch:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
            <asp:TextBox ID="QuocTichTextBox" runat="server" Text='<%# Bind("QuocTich") %>' AutoPostBack="true"  placeholder="Nhập Quốc Tịch"/>
            <br />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" Text="Hoàn Tất" CssClass="haha" OnClick="InsertButton_Click" Visible="false" />
        </InsertItemTemplate>
        <ItemTemplate>
            MaKH:
            <asp:Label ID="MaKHLabel" runat="server" Text='<%# Eval("MaKH") %>' />
            <br />
            HoTen:
            <asp:Label ID="HoTenLabel" runat="server" Text='<%# Bind("HoTen") %>' />
            <br />
            GioiTinh:
            <asp:Label ID="GioiTinhLabel" runat="server" Text='<%# Bind("GioiTinh") %>' />
            <br />
            DiaChi:
            <asp:Label ID="DiaChiLabel" runat="server" Text='<%# Bind("DiaChi") %>' />
            <br />
            CMND:
            <asp:Label ID="CMNDLabel" runat="server" Text='<%# Bind("CMND") %>' />
            <br />
            DienThoai:
            <asp:Label ID="DienThoaiLabel" runat="server" Text='<%# Bind("DienThoai") %>' />
            <br />
            QuocTich:
            <asp:Label ID="QuocTichLabel" runat="server" Text='<%# Bind("QuocTich") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>

    </asp:FormView>
  
    

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DATN_QUANLYKHACHSANConnectionString %>" DeleteCommand="DELETE FROM [KhachHang] WHERE [MaKH] = @original_MaKH AND (([HoTen] = @original_HoTen) OR ([HoTen] IS NULL AND @original_HoTen IS NULL)) AND (([GioiTinh] = @original_GioiTinh) OR ([GioiTinh] IS NULL AND @original_GioiTinh IS NULL)) AND (([DiaChi] = @original_DiaChi) OR ([DiaChi] IS NULL AND @original_DiaChi IS NULL)) AND (([CMND] = @original_CMND) OR ([CMND] IS NULL AND @original_CMND IS NULL)) AND (([DienThoai] = @original_DienThoai) OR ([DienThoai] IS NULL AND @original_DienThoai IS NULL)) AND (([QuocTich] = @original_QuocTich) OR ([QuocTich] IS NULL AND @original_QuocTich IS NULL))" InsertCommand="INSERT INTO [KhachHang] ([HoTen], [GioiTinh], [DiaChi], [CMND], [DienThoai], [QuocTich]) VALUES (@HoTen, @GioiTinh, @DiaChi, @CMND, @DienThoai, @QuocTich)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [KhachHang]" UpdateCommand="UPDATE [KhachHang] SET [HoTen] = @HoTen, [GioiTinh] = @GioiTinh, [DiaChi] = @DiaChi, [CMND] = @CMND, [DienThoai] = @DienThoai, [QuocTich] = @QuocTich WHERE [MaKH] = @original_MaKH AND (([HoTen] = @original_HoTen) OR ([HoTen] IS NULL AND @original_HoTen IS NULL)) AND (([GioiTinh] = @original_GioiTinh) OR ([GioiTinh] IS NULL AND @original_GioiTinh IS NULL)) AND (([DiaChi] = @original_DiaChi) OR ([DiaChi] IS NULL AND @original_DiaChi IS NULL)) AND (([CMND] = @original_CMND) OR ([CMND] IS NULL AND @original_CMND IS NULL)) AND (([DienThoai] = @original_DienThoai) OR ([DienThoai] IS NULL AND @original_DienThoai IS NULL)) AND (([QuocTich] = @original_QuocTich) OR ([QuocTich] IS NULL AND @original_QuocTich IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_MaKH" Type="Int32" />
            <asp:Parameter Name="original_HoTen" Type="String" />
            <asp:Parameter Name="original_GioiTinh" Type="String" />
            <asp:Parameter Name="original_DiaChi" Type="String" />
            <asp:Parameter Name="original_CMND" Type="String" />
            <asp:Parameter Name="original_DienThoai" Type="String" />
            <asp:Parameter Name="original_QuocTich" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="HoTen" Type="String" />
            <asp:Parameter Name="GioiTinh" Type="String" />
            <asp:Parameter Name="DiaChi" Type="String" />
            <asp:Parameter Name="CMND" Type="String" />
            <asp:Parameter Name="DienThoai" Type="String" />
            <asp:Parameter Name="QuocTich" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="HoTen" Type="String" />
            <asp:Parameter Name="GioiTinh" Type="String" />
            <asp:Parameter Name="DiaChi" Type="String" />
            <asp:Parameter Name="CMND" Type="String" />
            <asp:Parameter Name="DienThoai" Type="String" />
            <asp:Parameter Name="QuocTich" Type="String" />
            <asp:Parameter Name="original_MaKH" Type="Int32" />
            <asp:Parameter Name="original_HoTen" Type="String" />
            <asp:Parameter Name="original_GioiTinh" Type="String" />
            <asp:Parameter Name="original_DiaChi" Type="String" />
            <asp:Parameter Name="original_CMND" Type="String" />
            <asp:Parameter Name="original_DienThoai" Type="String" />
            <asp:Parameter Name="original_QuocTich" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>


       <br />
    <br />
    

</asp:Content>
