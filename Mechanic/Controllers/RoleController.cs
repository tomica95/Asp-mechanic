using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application;
using Application.Commands.Role;
using Application.Dto;
using Application.Searches;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Mechanic.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RoleController : ControllerBase
    {
        private readonly IApplicationActor actor;
        private readonly CommandExecutor executor;

        public RoleController(IApplicationActor actor,CommandExecutor executor)
        {
            this.actor = actor;
            this.executor = executor;
        }
        // GET: api/<RoleController>
        [HttpGet]
        public IActionResult Get(
            [FromQuery]RoleSearch search,
            [FromServices]IGetRoleQuery query)
        {
            return Ok(executor.ExecuteQuery(query,search));
        }

        // GET api/<RoleController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<RoleController>
        [HttpPost]
        public IActionResult Post([FromBody] RoleDTO dto,
            [FromServices] ICreateRoleCommand command)
        {
            executor.ExecuteCommand(command, dto);
            return NoContent();
        }

        // PUT api/<RoleController>/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody]RoleDTO dto,[FromServices]IUpdateRoleCommand command)
        {
            dto.Id = id;
            executor.ExecuteCommand(command, dto);
            return NoContent();
        }

        // DELETE api/<RoleController>/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id,[FromServices]IDeleteRoleCommand command)
        {
            executor.ExecuteCommand(command,id);
            return NoContent();
        }
    }
}
