using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace WebApplication1.Models
{
    public class CRUDclass
    {
        public SqlConnection k;
        public void connection()
        {
            string conn = ConfigurationManager.ConnectionStrings["Deca"].ToString();
            k = new SqlConnection(conn);
        }

        public List<Dete> Select()
        {
            connection();
            List<Dete> list = new List<Dete>();
            SqlDataAdapter adp = new SqlDataAdapter("select * from Dete", k);
            DataTable dt = new DataTable();
            k.Open();
            adp.Fill(dt);
            k.Close();
            foreach(DataRow x in dt.Rows)
            {
                list.Add(new Dete
                {
                    ID = Convert.ToInt32(x["ID"]),
                    Ime = Convert.ToString(x["Ime"]),
                    Prezime = Convert.ToString(x["Prezime"]),
                    Pol = Convert.ToString(x["Pol"]),
                    datumRodjenja = Convert.ToDateTime(x["DatumRodjenja"]),
                    imeOca = Convert.ToString(x["ImeOca"]),
                    imeMajke = Convert.ToString(x["ImeMajke"]),
                    Slika = Convert.ToString(x["Slika"]),
                });
            }

            return list;
        }
        public bool Delete(int i)
        {
            connection();
            SqlCommand com = new SqlCommand("delete from Dete where ID=@ID", k);
            com.Parameters.AddWithValue("@ID", i);
            k.Open();
            int x = com.ExecuteNonQuery();
            k.Close();

            if (x >= 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public  bool Insert(Dete x)
        {
            connection();
            SqlCommand com = new SqlCommand("insert into Dete (Ime,Prezime,Pol,DatumRodjenja,ImeOca,ImeMajke,Slika) values (@Ime,@Prezime,@Pol,@DatumRodjenja,@ImeOca,@ImeMajke,@Slika)", k);
            com.Parameters.AddWithValue("@Ime", x.Ime);
            com.Parameters.AddWithValue("@Prezime", x.Prezime);
            com.Parameters.AddWithValue("@Pol", x.Pol);
            com.Parameters.AddWithValue("@DatumRodjenja", x.datumRodjenja.ToShortDateString());
            com.Parameters.AddWithValue("@ImeOca", x.imeOca);
            com.Parameters.AddWithValue("@ImeMajke", x.imeMajke);
            if (!string.IsNullOrEmpty(x.Slika))
                com.Parameters.AddWithValue("@Slika", x.Slika);
            else
                com.Parameters.AddWithValue("@Slika", "Nema slike");
            k.Open();
            int i = com.ExecuteNonQuery();
            k.Close();
            if (i >= 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public bool Update(Dete x)
        {
            connection();
            SqlCommand com = new SqlCommand("update Dete set Ime=@Ime,Prezime=@Prezime,Pol=@Pol,DatumRodjenja=@DatumRodjenja,ImeOca=@ImeOca,ImeMajke=@ImeMajke,Slika=@Slika where ID=@ID", k);
            com.Parameters.AddWithValue("@ID", x.ID);
            com.Parameters.AddWithValue("@Ime", x.Ime);
            com.Parameters.AddWithValue("@Prezime", x.Prezime);
            com.Parameters.AddWithValue("@Pol", x.Pol);
            com.Parameters.AddWithValue("@DatumRodjenja", x.datumRodjenja.ToShortDateString());
            com.Parameters.AddWithValue("@ImeOca", x.imeOca);
            com.Parameters.AddWithValue("@ImeMajke", x.imeMajke);
            if (!string.IsNullOrEmpty(x.Slika))
                com.Parameters.AddWithValue("@Slika", x.Slika);
            else
                com.Parameters.AddWithValue("@Slika", "Nema slike");
            k.Open();
            int i = com.ExecuteNonQuery();
            k.Close();
            if (i >= 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }   

    }
}
