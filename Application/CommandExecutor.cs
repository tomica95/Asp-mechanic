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

        public CommandExecutor(IApplicationActor actor) 
        {
            this.actor = actor;
        }
        public TResult ExecuteQuery<TSearch, TResult>
            (IQuery<TSearch, TResult> query, TSearch search)
        {

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
          
            if (!actor.AllowedCommands.Contains(command.Id))
            {
                throw new UnauthorizedCommandException(command,actor);
            }
            command.Execute(request);
        }
    }
}
