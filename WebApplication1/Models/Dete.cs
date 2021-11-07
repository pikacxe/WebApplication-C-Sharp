using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace WebApplication1.Models
{
    public class Dete
    {
        [Display(Name ="ID")]
        public int ID { get; set; }
        [Display(Name = "Ime")]
        [Required(ErrorMessage ="Ime je obavezno!")]
        public string Ime { get; set; }
        [Display(Name = "Prezime")]
        [Required(ErrorMessage = "Prezime je obavezno!")]
        public string Prezime { get; set; }
        [Display(Name = "Pol")]
        [Required(ErrorMessage = "Pol je obavezan!")]
        public string Pol { get; set; }
        [Display(Name = "Datum Rodjenja")]
        [Required(ErrorMessage = "Datum rodjenja je obavezan!")]
        public DateTime datumRodjenja { get; set; }
        [Display(Name = "Ime Oca")]
        [Required(ErrorMessage = "Ime oca je obavezno!")]
        public string imeOca { get; set; }
        [Display(Name = "Ime Majke")]
        [Required(ErrorMessage = "Ime majke je obavezno!")]
        public string imeMajke { get; set; }
        [Display(Name = "Slika")]
        public string Slika { get; set; }

        public Dete(int id, string ime, string prezime, string pol, DateTime datumrodjenja, string imeoca, string imemajke, string slika)
        {
            ID = id;
            Ime = ime;
            Prezime = prezime;
            Pol = pol;
            datumRodjenja = datumrodjenja;
            imeOca = imeoca;
            imeMajke = imemajke;
            Slika = slika;
        }
        public Dete()
        {
            ID = 0;
            Ime = null;
            Prezime = null;
            Pol = null;
            datumRodjenja = new DateTime();
            imeOca = null;
            imeMajke = null;
            Slika = null;
        }
    }
}