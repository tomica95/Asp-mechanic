using Application.DTO;
using DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Implementation.Validations
{
    public class CreateRepairValidation : AbstractValidator<RepairDTO>
    {
        private readonly Context context;

        public CreateRepairValidation(Context context)
        {
            this.context = context;

            RuleFor(r => r.Name)
                .NotEmpty()
                .MinimumLength(4)
                .MaximumLength(50);

            RuleFor(r => r.Description)
                .NotEmpty()
                .MaximumLength(500);

            RuleFor(r => r.Status)
                .IsInEnum();

            RuleFor(r => r.Priority)
                .IsInEnum();

            RuleFor(r => r.User)
                .NotEmpty()
                .WithMessage("Repair has to be assigned with user")
                .DependentRules(() =>
                {
                    RuleFor(r => r.User)
                    .Must(CheckWhetherUserExists)
                    .WithMessage(dto => $"User with id:{dto.User.Id} does not exist. Please try another user id");
                });
            RuleFor(r => r.Car)
                .NotEmpty()
                .WithMessage("Repair has to be assigned on car.")
                .DependentRules(() =>
                {
                    RuleFor(t => t.Car)
                    .Must(CheckWhetherCarExists)
                    .WithMessage(dto => $"Car with id:{dto.Car.Id} doesn't exist. Please, try another car id.");
                });
        }
        private bool CheckWhetherUserExists(RepairDTO dto, UserDTO user)
        {
            return context.Users.Any(u => u.Id == dto.User.Id);
        }
        private bool CheckWhetherCarExists(RepairDTO dto, CarDTO car)
        {
            return context.Cars.Any(u => u.Id == dto.Car.Id);
        }
    }
}
