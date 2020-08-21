using System;
using System.Collections.Generic;
using System.Text;
using Application.Commands.Role;
using Application;
using Application.Dto;
using System.Text.RegularExpressions;
using Domain.Entities;
using DataAccess;

namespace Implementation.Commands.RoleCommands
{
    public class EfCreateRoleCommand : ICreateRoleCommand
    {
        private readonly Context _context;
        public int Id => 1;

        public string Name => "Create new Role";

        public EfCreateRoleCommand(Context context) 
        {
            _context = context;
        }

        public void Execute(RoleDTO dto)
        {
            var role = new Role
            {
                Name = dto.Name
            };

            _context.Roles.Add(role);
            _context.SaveChanges();
        }
    }
}
