using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application;
using Application.Commands.User;
using Application.DTO;
using Application.Queries;
using Application.Searches;
using Domain.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Mechanic.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly CommandExecutor executor;

        public UsersController(CommandExecutor executor)
        {
            this.executor = executor;
        }

        // GET: api/<UsersController>
        [HttpGet]
        public IActionResult Get([FromQuery] SearchUserDTO dto, [FromServices] IGetUserQuery query)
        {
            return Ok(executor.ExecuteQuery(query, dto));
        }

        // GET api/<UsersController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id, [FromServices] IGetOneUserQuery query)
        {
            return Ok(executor.ExecuteQuery(query, id));
        }

        // POST api/<UsersController>
        [HttpPost]
        public IActionResult Post([FromBody] UserDTO dto,[FromServices] ICreateUserCommand command)
        {
            executor.ExecuteCommand(command,dto);
            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT api/<UsersController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<UsersController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
