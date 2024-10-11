using System.Collections.Generic;

#nullable disable

namespace WebAPI_BDNOTAS2020.Models
{
    public partial class Especialidad
    {
        public Especialidad()
        {
            Alumnos = new HashSet<Alumno>();
        }

        public string Codesp { get; set; }
        public string Nomesp { get; set; }
        public int Costo { get; set; }
        public string Eliminado { get; set; }

        public virtual ICollection<Alumno> Alumnos { get; set; }
    }
}
