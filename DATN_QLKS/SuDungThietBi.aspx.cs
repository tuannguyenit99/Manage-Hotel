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
    public partial class SuDungThietBi : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=DATN_QUANLYKHACHSAN;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {


            HienThi();


        }
        private void HienThi()
        {
            con.Open();
            var SOHD = DropDownList1.SelectedValue;

            string Tenkh = "";
            String Socmnd = "";

            DataTable dt1 = new DataTable();
            SqlCommand cmd3 = new SqlCommand("select KhachHang.HoTen from KhachHang inner join ChiTietThuePhong on KhachHang.MaKH =ChiTietThuePhong.MaKH inner join ThuePhong on ThuePhong.SoHDThuePhong = ChiTietThuePhong.SoHDThuePhong  inner join SuDungDV on ThuePhong.SoHDThuePhong=SuDungDV.SoHDThuePhong  where SuDungDV.SoHDThuePhong=@SoHD  group by KhachHang.HoTen ", con);
            cmd3.Parameters.AddWithValue("SoHD", SOHD.ToString());
            SqlDataAdapter adt1 = new SqlDataAdapter(cmd3);
            adt1.Fill(dt1);

            for (int i = 0; i < dt1.Rows.Count; i++)
            {
                Tenkh = dt1.Rows[i]["HoTen"].ToString();
            }
            tenkh.Text = Tenkh.ToString();




            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("select KhachHang.CMND from KhachHang inner join ChiTietThuePhong on KhachHang.MaKH =ChiTietThuePhong.MaKH inner join ThuePhong on ThuePhong.SoHDThuePhong = ChiTietThuePhong.SoHDThuePhong  inner join SuDungDV on ThuePhong.SoHDThuePhong=SuDungDV.SoHDThuePhong  where SuDungDV.SoHDThuePhong=@SoHD  group by KhachHang.CMND", con);
            cmd.Parameters.AddWithValue("SoHD", SOHD.ToString());
            SqlDataAdapter adt = new SqlDataAdapter(cmd);
            adt.Fill(dt);

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Socmnd = dt.Rows[i]["CMND"].ToString();
            }
            cmnd.Text = Socmnd.ToString();



            con.Close();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            con.Open();
            var SoHD = DropDownList1.SelectedValue;
            var MaTB = DropDownList2.SelectedValue;
            var SoLuong = sl.Value;
            var idnv = Session["idnv"].ToString();

            DataTable dt1 = new DataTable();
            string sql = "select * from SuDungDV where SoHDThuePhong=@SoHD and MaThietBi=@MaThietBi";
            SqlCommand cmd1 = new SqlCommand(sql, con);
            cmd1.Parameters.AddWithValue("SoHD", SoHD.ToString());
            cmd1.Parameters.AddWithValue("MaThietBi", MaTB.ToString());
            SqlDataAdapter adt = new SqlDataAdapter(cmd1);
            adt.Fill(dt1);
            if (dt1.Rows.Count == 1)
            {
                string slc = "";
                int c = 0;
                DataTable dt = new DataTable();
                SqlCommand cmd = new SqlCommand("select soluong from SuDungDV where SoHDThuePhong=@SoHD and MaThietBi=@MaTB ", con);
                cmd.Parameters.AddWithValue("SoHD", SoHD.ToString());
                cmd.Parameters.AddWithValue("MaTB", MaTB.ToString());
                SqlDataAdapter adt5 = new SqlDataAdapter(cmd);
                adt5.Fill(dt);

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    slc = dt.Rows[i]["soluong"].ToString();
                }
                c = Int32.Parse(slc);
                int d = Int32.Parse(SoLuong);
                int SoLuong1 = c + d;

                SqlCommand cmd4 = new SqlCommand("update SuDungDV set SoLuong=@SoLuong1 where SoHDThuePhong=@SoHD and MaThietBi=@MaThietBi", con);
                cmd4.Parameters.AddWithValue("SoHD", SoHD.ToString());
                cmd4.Parameters.AddWithValue("MaThietBi", MaTB.ToString());
                cmd4.Parameters.AddWithValue("SoLuong1", SoLuong1.ToString());
                cmd4.Parameters.AddWithValue("slc", slc.ToString());
                cmd4.ExecuteNonQuery();
               

            }


            else
            {

                SqlCommand cmd = new SqlCommand("insert into SuDungDV values(@SoHDThuePhong,@MaThietBi,@SoLuong,@MaNV)", con);
                cmd.Parameters.AddWithValue("SoHDThuePhong", SoHD.ToString());
                cmd.Parameters.AddWithValue("MaThietBi", MaTB.ToString());
                cmd.Parameters.AddWithValue("SoLuong", SoLuong.ToString());
                cmd.Parameters.AddWithValue("MaNV", idnv.ToString());
                cmd.ExecuteNonQuery();
               
            }


            con.Close();


            HienThi();
            Response.Redirect(Request.Url.AbsoluteUri);
        }
    }
}