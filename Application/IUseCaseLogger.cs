using Application.CommandHandler;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application
{
    public interface IUseCaseLogger
    {
        void Log(IUseCase userCase, IApplicationActor actor,object useCaseData);
    }
}
