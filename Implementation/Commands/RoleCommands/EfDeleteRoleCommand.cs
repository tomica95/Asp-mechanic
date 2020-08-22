using System;
using System.Collections.Generic;
using System.Text;
using Application.Commands.Role;
using Application.Exceptions;
using DataAccess;
using Domain.Entities;

namespace Implementation.Commands.RoleCommands
{
    public class EfDeleteRoleCommand : IDeleteRoleCommand
    {
        private readonly Context _context;

        public EfDeleteRoleCommand(Context context)
        {
            _context = context;
        }

        public int Id => 3;

        public string Name => "Delete Role";

        public void Execute(int id)
        {
            var role = _context.Roles.Find(id);

             if (role == null)
             {
                  throw new EntityNotFoundException(id,typeof(Role));
             }

                role.DeletedAt = DateTime.Now;

                _context.SaveChanges();
            }

        }
}
