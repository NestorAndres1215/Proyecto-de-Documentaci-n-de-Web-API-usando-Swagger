using System;

#nullable disable

namespace WebAPI_BDNOTAS2020.Models
{
    public partial class Pago
    {
        public int Codpago { get; set; }
        public string Codalumno { get; set; }
        public string Semestre { get; set; }
        public int Ncuota { get; set; }
        public int Monto { get; set; }
        public DateTime? Fecha { get; set; }
        public string Pagado { get; set; }
        public DateTime? FechaPago { get; set; }

        public virtual Alumno CodalumnoNavigation { get; set; }
    }
}
