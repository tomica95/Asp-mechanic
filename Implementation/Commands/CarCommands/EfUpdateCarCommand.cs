using Application.Commands.Car;
using Application.DTO;
using Application.Exceptions;
using AutoMapper;
using DataAccess;
using Domain.Entities;
using FluentValidation;
using Implementation.Validations;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Commands.CarCommands
{
    public class EfUpdateCarCommand : BaseCommand,IUpdateCarCommand
    {
        private readonly UpdateCarValidation validation;

        public EfUpdateCarCommand(Context context, IMapper mapper, UpdateCarValidation validation) : base(context, mapper)
        {
            this.validation = validation;
        }

        public int Id => 12;

        public string Name => "Update car";

        public void Execute(CarDTO request)
        {
            validation.ValidateAndThrow(request);

            var car = Context.Cars
                .Include(c => c.CarUsers)
                .FirstOrDefault(c => c.Id == request.Id);

            //if car with that id does not exist in database
            if (car == null)
            {
                throw new EntityNotFoundException(request.Id);
            }
            Mapper.Map(request, car);

            car.CarUsers.Where(uc => uc.CarId == car.Id)
                .ToList()
                .ForEach(x => car.CarUsers.Remove(x));
            car.Brand = null;
            foreach (var one in request.Users)
            {
                car.CarUsers.Add(new CarUser { 
                    CarId = car.Id,
                    UserId = one.Id
                });
            }
            Context.SaveChanges();
        }
    }
}
