using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application;
using Application.Commands.Repair;
using Application.DTO;
using Application.Queries;
using Application.Searches;
using Domain.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Mechanic.Controllers
{
    [Authorize]
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
        public IActionResult Get([FromQuery] SearchRepairDto dto, [FromServices] IGetAllRepairs query)
        {
            return Ok(executor.ExecuteQuery(query, dto));
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
        public IActionResult Delete(int id,
            [FromServices] IDeleteRepairCommand command)
        {
            executor.ExecuteCommand(command, id);

            return NoContent();
        }
    }
}
