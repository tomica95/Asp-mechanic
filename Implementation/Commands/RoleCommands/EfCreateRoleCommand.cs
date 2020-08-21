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

namespace Implementation.Commands.RoleCommands
{
    public class EfCreateRoleCommand :BaseCommand,ICreateRoleCommand
    {
        
        public int Id => 1;

        public string Name => "Create new Role";

        public EfCreateRoleCommand(Context context, IMapper mapper) : base(context,mapper)
        {
            
        }

        public void Execute(RoleDTO dto)
        {
            var role = Mapper.Map<Role>(dto);
            Context.Roles.Add(role);
            Context.SaveChanges();
        }
    }
}
