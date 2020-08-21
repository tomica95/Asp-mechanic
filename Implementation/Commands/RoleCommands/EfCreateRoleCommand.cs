using System;
using System.Collections.Generic;
using System.Text;
using Application.Commands.Role;
using Application;
using Application.Dto;
using System.Text.RegularExpressions;
using Domain.Entities;
using DataAccess;
using AutoMapper;
using Implementation.Validations;
using FluentValidation;

namespace Implementation.Commands.RoleCommands
{
    public class EfCreateRoleCommand :BaseCommand,ICreateRoleCommand
    {
        private readonly CreateRoleValidation _validator;
        public int Id => 1;

        public string Name => "Create new Role";

        public EfCreateRoleCommand(Context context, IMapper mapper,CreateRoleValidation validator) : base(context,mapper)
        {
            _validator = validator;
        }

        public void Execute(RoleDTO dto)
        {
            _validator.ValidateAndThrow(dto);
            var role = Mapper.Map<Role>(dto);
            Context.Roles.Add(role);
            Context.SaveChanges();
        }
    }
}
