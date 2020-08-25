using Application.Commands.User;
using Application.DTO;
using Application.Exceptions;
using AutoMapper;
using DataAccess;
using FluentValidation;
using Implementation.Validations;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.UserCommands
{
    public class EfUpdateUserCommand : BaseCommand,IUpdateUserCommand
    {
        private readonly UpdateUserValidation _validation;

        public EfUpdateUserCommand(Context context, IMapper mapper, UpdateUserValidation validation) : base(context, mapper)
        {
            _validation = validation;
        }

        public int Id => 7;

        public string Name => "Update user";

        public void Execute(UserDTO request)
        {
            _validation.ValidateAndThrow(request);
           
            var user = Context.Users.Find(request.Id);

            if (user == null)
            {
                throw new EntityNotFoundException(request.Id);
            }

            Mapper.Map(request, user);

            //  prevent creating role
            user.Role = null;

            Context.SaveChanges();
        }
    }
}
