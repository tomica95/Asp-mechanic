﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application;
using Application.Commands.Brand;
using Application.DTO;
using Application.Queries;
using Application.Searches;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Mechanic.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BrandsController : ControllerBase
    {

        private readonly CommandExecutor executor;

        public BrandsController(CommandExecutor executor)
        {
            this.executor = executor;
        }

        // GET: api/<BrandsController>
        [HttpGet]
        public IActionResult Get([FromQuery] SearchBrandDto search, [FromServices] IGetAllBrands query)
        {
            return Ok(executor.ExecuteQuery(query, search));
        }

        // GET api/<BrandsController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id,
            [FromServices] IGetOneBrand query)
        {
            return Ok(executor.ExecuteQuery(query, id));
        }

        // POST api/<BrandsController>
        [HttpPost]
        public IActionResult Post([FromBody] BrandDto dto, [FromServices] ICreateBrandCommand command)
        {
            executor.ExecuteCommand(command, dto);

            return NoContent();
        }

        // PUT api/<BrandsController>/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] BrandDto dto, [FromServices] IUpdateBrandCommand command)
        {
            dto.Id = id;

            executor.ExecuteCommand(command, dto);

            return NoContent();

        }

        // DELETE api/<BrandsController>/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteBrandCommand command)
        {
            executor.ExecuteCommand(command, id);

            return NoContent();
        }
    }
}
