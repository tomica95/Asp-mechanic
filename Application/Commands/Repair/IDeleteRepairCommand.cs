using Application.CommandHandler;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Commands.Repair
{
    public interface IDeleteRepairCommand : ICommand<int> 
    {
    }
}
