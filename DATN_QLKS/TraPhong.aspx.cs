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
    public partial class TraPhong : System.Web.UI.Page
    {
        public static List<string> ds = new List<string>();

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

            ngay.Text = DateTime.Now.ToString();
            SHD.Text = SOHD.ToString();




            DataTable dt6 = new DataTable();
            SqlCommand cmd6 = new SqlCommand("select Sum(LoaiPhong.GiaTien) tien from LoaiPhong inner join DanhMucPhong on LoaiPhong.MaLoaiPhong = DanhMucPhong.MaLoaiPhong inner join HDPhong on HDPhong.MaPhong = DanhMucPhong.MaPhong where HDPhong.MaHD = @MAHD ", con);
            cmd6.Parameters.AddWithValue("MAHD", SOHD.ToString());
            SqlDataAdapter adt6 = new SqlDataAdapter(cmd6);
            adt6.Fill(dt6);

            string t1 = "";
            string t2 = "";
            for (int i = 0; i < dt6.Rows.Count; i++)
            {
                t1 = dt6.Rows[i]["tien"].ToString();
            }
            TienPhong.Text = t1.ToString();




            DataTable dt9 = new DataTable();
            SqlCommand cmd9 = new SqlCommand("SELECT Sum(ThietBi.Gia * SuDungDV.SoLuong) AS Co FROM ThietBi INNER JOIN SuDungDV ON ThietBi.MaThietBi = SuDungDV.MaThietBi INNER JOIN ThuePhong ON ThuePhong.SoHDThuePhong = SuDungDV.SoHDThuePhong WHERE SuDungDV.SoHDThuePhong = @MAHD", con);
            cmd9.Parameters.AddWithValue("MaHD", SOHD.ToString());
            SqlDataAdapter adt9 = new SqlDataAdapter(cmd9);
            adt9.Fill(dt9);

            for (int i = 0; i < dt9.Rows.Count; i++)
            {
               t2 = dt9.Rows[i]["Co"].ToString();
            }
            TienDV.Text = t2.ToString();

            if(TienDV.Text!=""&&TienPhong.Text!="")
            {
                float a = 0;
                float b = 0;
                a = float.Parse(TienDV.Text);
                b = float.Parse(TienPhong.Text);
                float c = a + b;
                TongTien.Text = c.ToString();


               tienchu.Text= ChuyenSoSangChuoi(c);



            }    
           



            con.Close();




            //Đọc tiền thành số 







        }

         string [] mNumText = "không;một;hai;ba;bốn;năm;sáu;bảy;tám;chín".Split(';');
        //Viết hàm chuyển số hàng chục, giá trị truyền vào là số cần chuyển và một biến đọc phần lẻ hay không ví dụ 101 => một trăm lẻ một
        private string DocHangChuc(double so,bool daydu)
        {
            string chuoi = "";
            //Hàm để lấy số hàng chục ví dụ 21/10 = 2
            Int64 chuc = Convert.ToInt64(Math.Floor((double)(so / 10)));
            //Lấy số hàng đơn vị bằng phép chia 21 % 10 = 1
            Int64 donvi = (Int64)so%10;
            //Nếu số hàng chục tồn tại tức >=20
            if (chuc>1) {
                chuoi = " " + mNumText[chuc] + " mươi";
                if (donvi==1) {
                    chuoi += " mốt";
                }
            } else if (chuc==1) {//Số hàng chục từ 10-19
                chuoi = " mười";
                if (donvi==1) {
                    chuoi += " một";
                }
            } else if (daydu && donvi>0) {//Nếu hàng đơn vị khác 0 và có các số hàng trăm ví dụ 101 => thì biến daydu = true => và sẽ đọc một trăm lẻ một
                    chuoi = " lẻ";
            }
            if (donvi==5 && chuc>=1) {//Nếu đơn vị là số 5 và có hàng chục thì chuỗi sẽ là " lăm" chứ không phải là " năm"
                chuoi += " lăm";
            } else if (donvi>1||(donvi==1&&chuc==0)) {
                chuoi += " " + mNumText[ donvi ];
            }
            return chuoi;
        }
        private string DocHangTram(double so,bool daydu)
        {
            string chuoi = "";
            //Lấy số hàng trăm ví du 434 / 100 = 4 (hàm Floor sẽ làm tròn số nguyên bé nhất)
            Int64 tram = Convert.ToInt64(Math.Floor((double)so/100));
            //Lấy phần còn lại của hàng trăm 434 % 100 = 34 (dư 34)
            so = so%100;
            if (daydu || tram>0) {
                chuoi = " " + mNumText[tram] + " trăm";
                chuoi += DocHangChuc(so,true);
            } else {
                chuoi = DocHangChuc(so,false);
            }
            return chuoi;
        }
        private string DocHangTrieu(double so,bool daydu)
        {
            string chuoi = "";
            //Lấy số hàng triệu
            Int64 trieu = Convert.ToInt64(Math.Floor((double)so/1000000));
            //Lấy phần dư sau số hàng triệu ví dụ 2,123,000 => so = 123,000
            so = so%1000000;
            if (trieu>0) {
                chuoi = DocHangTram(trieu,daydu) + " triệu";
                daydu = true;
            }
            //Lấy số hàng nghìn
            Int64 nghin = Convert.ToInt64(Math.Floor((double)so / 1000));
            //Lấy phần dư sau số hàng nghin 
            so = so%1000;
            if (nghin>0) {
                chuoi += DocHangTram(nghin,daydu) + " nghìn";
                daydu = true;
            }
            if (so>0) {
                chuoi += DocHangTram(so,daydu);
            }
            return chuoi;
       }
        public string ChuyenSoSangChuoi(double so)
        {
            if (so == 0)
                return mNumText[0];
            string chuoi = "", hauto = "";
            Int64 ty;
            do
            {
                //Lấy số hàng tỷ
                ty = Convert.ToInt64(Math.Floor((double)so / 1000000000));
                //Lấy phần dư sau số hàng tỷ
                so = so % 1000000000;
                if (ty > 0)
                {
                    chuoi = DocHangTrieu(so, true) + hauto + chuoi;
                }
                else
                {
                    chuoi = DocHangTrieu(so, false) + hauto + chuoi;
                }
                hauto = " tỷ";
            } while (ty > 0);
            return chuoi + " đồng";
        }

        protected void ThanhToan_Click(object sender, EventArgs e)
        {
            con.Open();

            var SOHD = DropDownList1.SelectedValue;

            var idnv = Session["idnv"].ToString();

            SqlCommand cmd = new SqlCommand("insert into HDThanhToan values (@SoHD,@Manv,@ngay,@tienphong)", con);
            cmd.Parameters.AddWithValue("SoHD", SOHD.ToString());
            cmd.Parameters.AddWithValue("Manv", idnv.ToString());
            cmd.Parameters.AddWithValue("ngay", DateTime.Now.ToString("yyyy-MM-dd h:m:s"));
            cmd.Parameters.AddWithValue("tienphong", TongTien.Text);
            cmd.ExecuteNonQuery();


            SqlCommand cmd1 = new SqlCommand("update HDPhong set TrangThai=3 where MaHD=@MaHD", con);
            cmd1.Parameters.AddWithValue("MaHD", SOHD.ToString());
            cmd1.ExecuteNonQuery();





            
            DataTable dt9 = new DataTable();
            SqlCommand cmd9 = new SqlCommand("select MaPhong from HDPhong where MaHD=@MaHD", con);
            cmd9.Parameters.AddWithValue("MaHD", SOHD.ToString());
            SqlDataAdapter adt9 = new SqlDataAdapter(cmd9);
            adt9.Fill(dt9);
            for (int i = 0; i < dt9.Rows.Count; i++)
            {
               var  Maphong = dt9.Rows[i]["MaPhong"].ToString();

                SqlCommand cmd10 = new SqlCommand("update DanhMucPhong set TinhTrang=NULL where MaPhong=@MaPhong", con);
                cmd10.Parameters.AddWithValue("MaPhong", Maphong.ToString());
                cmd10.ExecuteNonQuery();


            }





            con.Close();


        }
    }


}