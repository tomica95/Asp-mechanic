using System;
using System.Collections.Generic;
using System.Text;
using Application.Commands.User;
using Application.DTO;
using Application.Email;
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
        private readonly IEmailSender _sender;
        public EfCreateUserCommand(Context context, IMapper mapper, CreateUserValidation validation,IEmailSender sender) : base(context, mapper)
        {
            _validation = validation;
            _sender = sender;
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

            _sender.Send(new SendEmail
            {

                Content = "<h1>Successfull created user</h1>",
                SendTo = request.Email,
                Subject = "Registration of new user"
            });

        }
    }
}
