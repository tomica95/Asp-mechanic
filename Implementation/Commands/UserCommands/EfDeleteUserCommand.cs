using Application.Commands.User;
using Application.Exceptions;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.UserCommands
{
    public class EfDeleteUserCommand : IDeleteUser
    {
        private readonly Context context;

        public EfDeleteUserCommand(Context context)
        {
            this.context = context;
        }


        public int Id => 8;

        public string Name => "Delete User";

        public void Execute(int request)
        {
            var user = context.Users.Find(request);

            if (user == null)
            {
                throw new EntityNotFoundException(request);
            }

            user.DeletedAt = DateTime.Now;

            context.SaveChanges();
        }
    }
}
