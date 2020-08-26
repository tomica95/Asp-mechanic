using Application.DTO;
using DataAccess;
using FluentValidation;
using Implementation.Profiles;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Validations
{
    public class CreateBrandValidation : AbstractValidator<BrandDto>
    {
        private readonly Context _context;

        public CreateBrandValidation(Context context)
        {
            _context = context;

            RuleFor(dto => dto.BrandName)
                .NotEmpty()
                .Must(CheckBrandNameUniqueness)
                .WithMessage(dto => $"{dto.BrandName} already exists in in database. Please, try another role name.");
        }

        // Checking if role name already exists in database
        private bool CheckBrandNameUniqueness(string name)
        {
            return !_context.Brands.Any(b => b.BrandName == name);
        }

    }
}
