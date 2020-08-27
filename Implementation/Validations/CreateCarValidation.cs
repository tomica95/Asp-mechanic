using Application.DTO;
using DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Validations
{
    public class CreateCarValidation : AbstractValidator<CarDTO>
    {
        private readonly Context context;

        public CreateCarValidation(Context context)
        {
            this.context = context;
            RuleFor(c => c.Name)
                .NotEmpty()
                .MinimumLength(2)
                .MaximumLength(40)
                .Must(CheckCarNameUnique)
                .WithMessage(dto => $"'{dto.Name}'already exists in database. Try again");

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

        private bool CheckCarNameUnique(string Name)
        {
            return !context.Cars.Any(c => c.Name == Name);
        }

        private bool CheckaCarRegPlateUnique(string regPlate)
        {
            return !context.Cars.Any(c => c.RegPlate == regPlate);
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
