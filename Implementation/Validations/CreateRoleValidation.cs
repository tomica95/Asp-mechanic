using Application.Dto;
using DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Validations
{
    public class CreateRoleValidation : AbstractValidator<RoleDTO>
    {
        private readonly Context _context;

        public CreateRoleValidation(Context context)
        {
            _context = context;

            RuleFor(dto => dto.Name)
                .NotEmpty()
                .Must(uniqueName)
                .WithMessage(dto => $"{dto.Name} already exists in in database. Please, try another name");
        }

        private bool uniqueName(string name)
        {
            return !_context.Roles.Any(r => r.Name == name);
        }
    }
}
