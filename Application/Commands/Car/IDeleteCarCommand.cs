using Application.CommandHandler;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Commands.Car
{
    public interface IDeleteCarCommand : ICommand<int>
    {
    }
}
