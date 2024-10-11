using System.ComponentModel.DataAnnotations;

namespace WebAPI_BDNOTAS2020.Models
{
    public class PA_ALUMNOS_CANTIDAD_PAGOS
    {
        [Key]
        public string clave { get; set; }
        public string codalumno { get; set; }
        public string semestre { get; set; }
        public string nomcompleto { get; set; }
        public string nomesp { get; set; }
        public int cantidad_pago { get; set; }
        public int total { get; set; }
    }
}
