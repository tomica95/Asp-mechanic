using Application.Commands.Car;
using Application.DTO;
using AutoMapper;
using DataAccess;
using Domain.Entities;
using FluentValidation;
using Implementation.Validations;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.CarCommands
{
    public class EfCreateCarCommand : BaseCommand, ICreateCarCommand
    {
        private readonly CreateCarValidation _validation;
        public EfCreateCarCommand(Context context, IMapper mapper, CreateCarValidation validation) : base(context, mapper)
        {
            _validation = validation;
        }

        public int Id => 1;

        public string Name => "Create car";

        public void Execute(CarDTO request)
        {
            _validation.ValidateAndThrow(request);

            var car = Mapper.Map<Car>(request);

            car.Leader = null;
            car.UserId = request.Leader.Id;

            Context.Cars.Add(car);
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
