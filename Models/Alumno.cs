using System.Collections.Generic;

#nullable disable

namespace WebAPI_BDNOTAS2020.Models
{
    public partial class Alumno
    {
        public Alumno()
        {
            Nota = new HashSet<Nota>();
            Pagos = new HashSet<Pago>();
        }

        public string Codalumno { get; set; }
        public string Apealumno { get; set; }
        public string Nomalumno { get; set; }
        public string Codesp { get; set; }
        public string Colegio { get; set; }
        public string Eliminado { get; set; }

        public virtual Especialidad CodespNavigation { get; set; }
        public virtual ICollection<Nota> Nota { get; set; }
        public virtual ICollection<Pago> Pagos { get; set; }
    }
}
