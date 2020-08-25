using Application.CommandHandler;
using Application.DTO;
using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Input;

namespace Application.Commands.Repair
{
    public interface ICreateRepair : ICommand<RepairDTO>
    {
    }
}
