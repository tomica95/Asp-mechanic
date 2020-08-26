using Application.CommandHandler;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Commands.Brand
{
    public interface IDeleteBrandCommand : ICommand<int>
    {
    }
}
