using Application;
using Application.CommandHandler;
using DataAccess;
using DataAccess.Migrations;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Logging
{
    public class DataBaseUseCaseLogger : IUseCaseLogger
    {
        private readonly Context context;

        public DataBaseUseCaseLogger(Context context)
        {
            this.context = context;
        }

        public void Log(IUseCase useCase, IApplicationActor actor, object useCaseData)
        {
            context.UseCaseLogs.Add(new Domain.Entities.UseCaseLog
            {
                Actor = actor.Identity,
                UseCaseName = useCase.Name,
                Date = DateTime.UtcNow
            });

            context.SaveChanges();

        }
    }
}
