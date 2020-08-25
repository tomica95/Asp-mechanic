using Application.Commands.Car;
using Application.Exceptions;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.CarCommands
{
    public class EfDeleteCarCommand : IDeleteCarCommand
    {
        private readonly Context context;

        public EfDeleteCarCommand(Context context)
        {
            this.context = context;
        }
        public int Id => 13;

        public string Name => "Delete car";

        public void Execute(int request)
        {
            var car = context.Cars.Find(request);

            if (car == null)
            {
                throw new EntityNotFoundException(request);
            }

            car.DeletedAt = DateTime.Now;

            context.SaveChanges();
        }
    }
}
