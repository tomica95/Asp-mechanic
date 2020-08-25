using Application.CommandHandler;
using Application.DTO;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Commands.Car
{
    public interface ICreateCarCommand : ICommand<CarDTO>
    {
    }
}
