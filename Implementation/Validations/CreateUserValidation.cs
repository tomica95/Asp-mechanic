using Application.Dto;
using Application.DTO;
using DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Validations
{
    public class CreateUserValidation : AbstractValidator<UserDTO>
    {
        private readonly Context _context;

        public CreateUserValidation(Context context)
        {
            _context = context;

            RuleFor(u => u.FullName)
                .NotEmpty()
                .MinimumLength(4)
                .MaximumLength(50);

            RuleFor(u => u.Username)
                .NotEmpty()
                .MinimumLength(4)
                .MaximumLength(50)
                .Must(CheckUsernameUnique)
                .WithMessage(dto => $"'{dto.Username}' already exists. Try another");

            RuleFor(u => u.Password)
                .NotEmpty()
                .MinimumLength(4)
                .MaximumLength(50);

            RuleFor(u => u.Email)
                .NotEmpty()
                .EmailAddress();

            RuleFor(u => u.Role)
                .NotEmpty()
                .WithMessage("You need to put role on user.")
                .DependentRules(() => {
                    RuleFor(u => u.Role)
                        .Must(CheckRoleExistence)
                        .WithMessage((dto) => $"Role with id:{dto.Role.Id} doesn't exist.");
                });

        }
        private bool CheckUsernameUnique(string username)
        {
            return !_context.Users.Any(r => r.Username == username);
        }
        private bool CheckRoleExistence(UserDTO dto, RoleDTO role)
        {
            return _context.Roles.Any(r => r.Id == dto.Role.Id);
        }

    }
}
