using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DATN_QLKS
{
    public partial class GiaoDienNhanVien : System.Web.UI.MasterPage
    {
        SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=DATN_QUANLYKHACHSAN;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            string tk = Session["tk"].ToString();


            string tennv = "";

            DataTable dt1 = new DataTable();
            SqlCommand cmd3 = new SqlCommand("select Hotennv from nhanvien where manv=@manv", con);
            cmd3.Parameters.AddWithValue("manv", tk.ToString());
            SqlDataAdapter adt1 = new SqlDataAdapter(cmd3);
            adt1.Fill(dt1);

            for (int i = 0; i < dt1.Rows.Count; i++)
            {
                tennv = dt1.Rows[i]["HoTenNV"].ToString();
            }


            QLL.Text = tennv;

            DataTable dt = new DataTable();
            string sql = "select * from NhanVien where MaNV=@MANV and QuyenTruyCap=N'Nhân Viên'";
            SqlCommand cmd = new SqlCommand(sql, con);

            cmd.Parameters.AddWithValue("MANV", tk.ToString());
            SqlDataAdapter adt = new SqlDataAdapter(cmd);
            adt.Fill(dt);
            if (dt.Rows.Count == 0)
            {

                Response.Redirect("SaiQuyenTruyCap.aspx");


            }


            Session["idnv"] = tk.ToString();
            con.Close();
        }
    }
}