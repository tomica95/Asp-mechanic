using Application.DTO;
using DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Validations
{
    public class UpdateBrandValidation : AbstractValidator<BrandDto>
    {
        private readonly Context _context;
        public UpdateBrandValidation(Context context)
        {
            _context = context;

            RuleFor(dto => dto.BrandName)
               .NotEmpty()
               .Must(CheckBrandNameUniqueness)
               .WithMessage(dto => $"'{dto.BrandName}' brand name already exists in database. Please, try another brand name.");
        }

        /**
         * Check if Role name already exists in database
         */
        private bool CheckBrandNameUniqueness(BrandDto dto, string name)
        {
            return !_context.Brands.Any(b => b.BrandName == name && b.Id != dto.Id);
        }
    }
}
