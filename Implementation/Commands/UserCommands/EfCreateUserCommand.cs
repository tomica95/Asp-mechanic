using System;
using System.Collections.Generic;
using System.Text;
using Application.Commands.User;
using Application.DTO;
using AutoMapper;
using DataAccess;
using Domain.Entities;
using FluentValidation;
using Implementation.Validations;

namespace Implementation.Commands.UserCommands
{
    public class EfCreateUserCommand : BaseCommand, ICreateUserCommand
    {
        private readonly CreateUserValidation _validation;

        public EfCreateUserCommand(Context context, IMapper mapper, CreateUserValidation validation) : base(context, mapper)
        {
            _validation = validation;
        }
        public int Id => 6;

        public string Name => "Create User";

        public void Execute(UserDTO request)
        {
            _validation.ValidateAndThrow(request);

            var user = Mapper.Map<User>(request);

            //must be null because in other case it will create it
            user.Role = null;
            user.RoleId = request.Role.Id;

            Context.Users.Add(user);

            Context.SaveChanges();
        }
    }
}
