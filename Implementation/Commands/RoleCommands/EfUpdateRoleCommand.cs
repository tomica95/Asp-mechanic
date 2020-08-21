using Application.Commands.Role;
using Application.Dto;
using AutoMapper;
using DataAccess;
using FluentValidation;
using Implementation.Validations;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.RoleCommands
{
    public class EfUpdateRoleCommand : BaseCommand,IUpdateRoleCommand
    {
        private readonly UpdateRoleValidation _validation;

        public EfUpdateRoleCommand(Context context, IMapper mapper, UpdateRoleValidation validation) : base(context, mapper)
        {
            _validation = validation;
        }

        public int Id => 4;

        public string Name => "Update Role";

        public void Execute(RoleDTO request)
        {
            _validation.ValidateAndThrow(request);

            var role = Context.Roles.Find(request.Id);

            Mapper.Map(request, role);

            Context.SaveChanges();

        }
    }
}
