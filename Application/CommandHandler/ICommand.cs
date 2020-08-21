using System;
using System.Collections.Generic;
using System.Text;

namespace Application.CommandHandler
{
    public interface ICommand<TRequest> : IUseCase
    {
        void Execute(TRequest request);
    }
}
