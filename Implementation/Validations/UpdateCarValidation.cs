using Application.DTO;
using DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Validations
{
    public class UpdateCarValidation : AbstractValidator<CarDTO>
    {
        private readonly Context context;

        public UpdateCarValidation(Context context)
        {
            this.context = context;

            RuleFor(c => c.Name)
                .NotEmpty()
                .MinimumLength(2)
                .MaximumLength(40)
                .Must(CheckCarNameUnique)
                .WithMessage(dto => $"'{dto.Name}' car name already exists in database. Please, try another car name.");

            RuleFor(c => c.Description)
                .NotEmpty()
                .MaximumLength(200);

            RuleFor(c => c.RegPlate)
                .NotEmpty()
                .MaximumLength(30)
                .Must(CheckaCarRegPlateUnique)
                .WithMessage(dto => $"'{dto.RegPlate}'already exists in database. Try again");

            RuleFor(p => p.Users)
                .NotEmpty()
                .WithMessage("At least one user must work on car.")
                .DependentRules(() =>
                    RuleForEach(u => u.Users)
                        .Must(CheckAssignedUserExistance)
                        .WithMessage("User that you are trying to assign on car repair doesn't exist.")
                    )
                .Must(CheckAssignedUsersDuplicates)
                .WithMessage("Not allowed to have duplicated users");
        }

        private bool CheckCarNameUnique(CarDTO dto,string name)
        {
            return !context.Cars.Any(u => u.Name == name && u.Id != dto.Id);
        }

        private bool CheckaCarRegPlateUnique(CarDTO dto,string regPlate)
        {
            return !context.Cars.Any(u => u.RegPlate == regPlate && u.Id != dto.Id);
        }

        private bool CheckAssignedUserExistance(UserDTO dto)
        {
            return context.Users.Any(c => c.Id == dto.Id);
        }
        private bool CheckAssignedUsersDuplicates(IEnumerable<UserDTO> dto)
        {
            return dto.Select(x => x.Id).Distinct().Count() == dto.Count();
        }
    }
    
}
