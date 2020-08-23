using Application.CommandHandler;
using Application.Exceptions;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;

namespace Application
{
    public class CommandExecutor
    {
        private readonly IApplicationActor actor;
        private readonly IUseCaseLogger logger;

        public CommandExecutor(IApplicationActor actor,IUseCaseLogger logger) 
        {
            this.actor = actor;
            this.logger = logger;
        }
        public TResult ExecuteQuery<TSearch, TResult>
            (IQuery<TSearch, TResult> query, TSearch search)
        {
            logger.Log(query, actor, search);

            if (!actor.AllowedCommands.Contains(query.Id))
            {
                throw new UnauthorizedCommandException(query, actor);
            }
            return query.Execute(search);
        }

        public void ExecuteCommand<TRequest>(
            ICommand<TRequest> command,
            TRequest request) 
        {
            logger.Log(command, actor, request);

            if (!actor.AllowedCommands.Contains(command.Id))
            {
                throw new UnauthorizedCommandException(command,actor);
            }
            command.Execute(request);
        }
    }
}
