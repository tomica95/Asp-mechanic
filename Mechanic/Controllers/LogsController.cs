using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application;
using Application.Queries;
using Application.Searches;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Mechanic.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LogsController : ControllerBase
    {
        private readonly CommandExecutor _executor;

        public LogsController(CommandExecutor executor)
        {
            _executor = executor;
        }
        // GET: api/<LogsController>
        [HttpGet]
        public IActionResult Get([FromQuery] SearchLogDto dto, [FromServices] IGetLogsQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, dto));
        }
    }
}
