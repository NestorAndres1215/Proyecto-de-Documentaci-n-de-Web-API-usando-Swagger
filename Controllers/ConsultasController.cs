using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using WebAPI_BDNOTAS2020.Models;

namespace WebAPI_BDNOTAS2020.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ConsultasController : ControllerBase
    {
        BDNOTAS2020okContext bd = new BDNOTAS2020okContext();


        [HttpGet("{semestre1}/{semestre2}")]
        public List<PA_ALUMNOS_CANTIDAD_PAGOS> Lista_Alumnos_Pagos(string semestre1,
                                                                   string semestre2)
        {
            var listado = bd.PA_ALUMNOS_CANTIDAD_PAGOS
                            .FromSqlRaw<PA_ALUMNOS_CANTIDAD_PAGOS>(
                                  "PA_ALUMNOS_CANTIDAD_PAGOS {0}, {1}",
                                  semestre1, semestre2)
                            .ToList();
            return listado;
        }

    }
}
