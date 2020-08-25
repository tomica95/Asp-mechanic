using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application;
using Application.Commands.Repair;
using Application.DTO;
using Domain.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Mechanic.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RepairsController : ControllerBase
    {

        private readonly CommandExecutor executor;

        public RepairsController(CommandExecutor executor)
        {
            this.executor = executor;
        }


        // GET: api/<RepairsController>
        [HttpGet]
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/<RepairsController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<RepairsController>
        [HttpPost]
        public IActionResult Post(
            [FromBody] RepairDTO dto,
            [FromServices] ICreateRepair command)
        {
            executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT api/<RepairsController>/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, 
            [FromBody] RepairDTO dto,
            [FromServices] IUpdateRepairCommand command)
        {
            dto.Id = id;

            executor.ExecuteCommand(command, dto);

            return StatusCode(StatusCodes.Status202Accepted);
        }

        // DELETE api/<RepairsController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
