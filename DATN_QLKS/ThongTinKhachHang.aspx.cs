using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
namespace DATN_QLKS
{
    public partial class ThongTinKhachHang : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=DATN_QUANLYKHACHSAN;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            //string ngay = Session["Dat"].ToString();
            //string ngay1 = Session["Dat1"].ToString();

            TextBox HoTenTextBox = (TextBox)FormView1.FindControl("HoTenTextBox") as TextBox;
            TextBox GioiTinhTextBox = (TextBox)FormView1.FindControl("GioiTinhTextBox") as TextBox;
            TextBox DiaChiTextBox = (TextBox)FormView1.FindControl("DiaChiTextBox") as TextBox;
            TextBox CMNDTextBox = (TextBox)FormView1.FindControl("CMNDTextBox") as TextBox;
            TextBox DienThoaiTextBox = (TextBox)FormView1.FindControl("DienThoaiTextBox") as TextBox;
            TextBox QuocTichTextBox = (TextBox)FormView1.FindControl("QuocTichTextBox") as TextBox;


            LinkButton InsertButton=(LinkButton)FormView1.FindControl("InsertButton") as LinkButton;
            if (HoTenTextBox.Text != "" && GioiTinhTextBox.Text != "" && DiaChiTextBox.Text != "" && CMNDTextBox.Text != "" && DienThoaiTextBox.Text != "" && QuocTichTextBox.Text != "")
            {

                InsertButton.Visible = true;
                

            }
            else
            {
                InsertButton.Visible = false;
            }    



        }
      

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            //Thêm Khach Hàng
            con.Open();
            string ngay = Session["Dat"].ToString();
            string ngay1 = Session["Dat1"].ToString();
            string ngayy = ngay.Replace("T", " ");
            string ngayy1= ngay1.Replace("T", " ");
           



            SqlCommand cmd3 = new SqlCommand("insert into ThuePhong values(@MaNV,@NgayThue,@NgayTra)", con);
            cmd3.Parameters.AddWithValue("MaNV","2");
            cmd3.Parameters.AddWithValue("NgayThue", ngayy.ToString());
            cmd3.Parameters.AddWithValue("NgayTra", ngayy1.ToString());
            cmd3.ExecuteNonQuery();



            TextBox HoTenTextBox = (TextBox)FormView1.FindControl("HoTenTextBox") as TextBox;
            TextBox GioiTinhTextBox = (TextBox)FormView1.FindControl("GioiTinhTextBox") as TextBox;
            TextBox DiaChiTextBox = (TextBox)FormView1.FindControl("DiaChiTextBox") as TextBox;
            TextBox CMNDTextBox = (TextBox)FormView1.FindControl("CMNDTextBox") as TextBox;
            TextBox DienThoaiTextBox = (TextBox)FormView1.FindControl("DienThoaiTextBox") as TextBox;
            TextBox QuocTichTextBox = (TextBox)FormView1.FindControl("QuocTichTextBox") as TextBox;

            SqlCommand cmd11 = new SqlCommand("insert into KhachHang values(@HoTenTextBox,@GioiTinhTextBox,@DiaChiTextBox,@CMNDTextBox,@DienThoaiTextBox,@QuocTichTextBox)", con);
            cmd11.Parameters.AddWithValue("HoTenTextBox", HoTenTextBox.Text);
            cmd11.Parameters.AddWithValue("GioiTinhTextBox", GioiTinhTextBox.Text);
            cmd11.Parameters.AddWithValue("DiaChiTextBox", DiaChiTextBox.Text);
            cmd11.Parameters.AddWithValue("CMNDTextBox", CMNDTextBox.Text);
            cmd11.Parameters.AddWithValue("DienThoaiTextBox", DienThoaiTextBox.Text);
            cmd11.Parameters.AddWithValue("QuocTichTextBox", QuocTichTextBox.Text);
            cmd11.ExecuteNonQuery();


            //Lay thong tin khach hang
            DataTable dt = new DataTable();
            string chuoi = "";

            int chuoi2 = 0;

            SqlCommand cmd4 = new SqlCommand("select*from KhachHang", con);

            dt.Load(cmd4.ExecuteReader());
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                chuoi = dt.Rows[i]["MaKH"].ToString();
            }


            chuoi2 = Convert.ToInt32(chuoi);

            //Lay so hoa đơn thuê phòng.

            string sohd = "";

            int sohd1 = 0;
            DataTable dt1 = new DataTable();
            SqlCommand cmd7 = new SqlCommand("select*from ThuePhong", con);

            dt1.Load(cmd7.ExecuteReader());
            for (int i = 0; i < dt1.Rows.Count; i++)
            {
                sohd = dt1.Rows[i]["SoHDThuePhong"].ToString();
            }

            sohd1 = Convert.ToInt32(sohd);

            SqlCommand cmd8 = new SqlCommand("insert into chitietthuephong values(@SoHDThuePhong,@MaKH,@PhuongThuc)", con);

            cmd8.Parameters.AddWithValue("SoHDThuePhong",sohd1.ToString());
            cmd8.Parameters.AddWithValue("MaKH",chuoi2.ToString());
            cmd8.Parameters.AddWithValue("PhuongThuc","Trực Tuyến");
            cmd8.ExecuteNonQuery();

            //Xử Lý Dặt Phòng Đã Chọn
            List<string> ds = new List<string>();
            ds = (List<string>)Session["kt"];
            string s = string.Empty;
            foreach (var item in ds)
            {
                s += item.ToString();

                SqlCommand cmd5 = new SqlCommand("update DanhMucPhong Set TinhTrang=1 where MaPhong=@MaPhong", con);
                cmd5.Parameters.AddWithValue("MaPhong", s.ToString());
                cmd5.ExecuteNonQuery();


                SqlCommand cmd9 = new SqlCommand("insert into HDPhong values(@MaHD,@MaPhong,@TrangThai)", con);
                cmd9.Parameters.AddWithValue("MaHD", sohd1.ToString());
                cmd9.Parameters.AddWithValue("MaPhong", s.ToString());
                cmd9.Parameters.AddWithValue("TrangThai", "1");
                cmd9.ExecuteNonQuery();

                s = "";

            }



            QuocTichTextBox.Text = "";
                DienThoaiTextBox.Text = "";
            CMNDTextBox.Text = "";
            DiaChiTextBox.Text = "";
            GioiTinhTextBox.Text = "";
            HoTenTextBox.Text = "";


            
            Response.Write("<script>alert('Bạn đã đặt Phòng Thành Công')</script>");
           
            con.Close();


        }
    }
}