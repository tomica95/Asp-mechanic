using Application.Dto;
using DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Validations
{
    public class UpdateRoleValidation : AbstractValidator<RoleDTO>
    {
        private readonly Context _context;

        public UpdateRoleValidation(Context context)
        {
            _context = context;

            RuleFor(dto => dto.Name)
               .NotEmpty()
               .Must(CheckRoleUniqueness)
               .WithMessage(dto => $"'{dto.Name}' role name already exists in database. Please, try another role name.");
        }
        private bool CheckRoleUniqueness(RoleDTO dto, string name)
        {
            return !_context.Roles.Any(r => r.Name == name && r.Id != dto.Id);
        }
    }
}
