using Application.DTO;
using DataAccess;
using FluentValidation;
using Microsoft.EntityFrameworkCore.Internal;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Implementation.Validations
{
    public class UpdateRepairValidation : AbstractValidator<RepairDTO>
    {
        private readonly Context context;

        public UpdateRepairValidation(Context context)
        {
            this.context = context;

            RuleFor(r => r.Name)
                .NotEmpty()
                .DependentRules(()=> {
                    RuleFor(r => r.Name)
                        .MinimumLength(4)
                        .MaximumLength(50);
                });
            RuleFor(r => r.Description)
                .NotEmpty()
                .MaximumLength(200);
            RuleFor(r => r.Status)
                .IsInEnum();
            RuleFor(r => r.Priority)
                .IsInEnum();

            RuleFor(r => r.User)
                .NotEmpty()
                .WithMessage("Repair has to be connected with user")
                .DependentRules(()=> 
                {
                    RuleFor(r => r.User)
                    .Must(CheckWhetherUserExists)
                    .WithMessage(dto => $"User with id:{dto.User.Id}does not exist. You must try with another Id");
                });
            RuleFor(r => r.Car)
                .NotEmpty()
                .WithMessage("Repair has to be assigned to car")
                .DependentRules(()=> {
                    RuleFor(r => r.Car)
                    .Must(CheckWhetherCarExists)
                    .WithMessage(dto => $"Car with id:{dto.Car.Id} does not exist. You must try another car Id");
                });
        }
        private bool CheckWhetherUserExists(RepairDTO dto, UserDTO user)
        {
            return context.Users.Any(u => u.Id == dto.User.Id);
        }

        private bool CheckWhetherCarExists(RepairDTO repair, CarDTO car)
        {
            return context.Cars.Any(u => u.Id == repair.Car.Id);
        }

    }
}
