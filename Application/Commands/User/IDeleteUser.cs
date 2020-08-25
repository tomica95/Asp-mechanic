using Application.CommandHandler;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Commands.User
{
    public interface IDeleteUser : ICommand<int>
    {
    }
}
