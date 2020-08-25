using Application.Commands.Repair;
using Application.Exceptions;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.RepairCommands
{
    public class EfDeleteRepairCommand : IDeleteRepairCommand
    {
        private readonly Context context;

        public EfDeleteRepairCommand(Context context)
        {
            this.context = context;
        }
        public int Id => 18;

        public string Name => "Delete repair";

        public void Execute(int request)
        {
            var repair = context.Repairs.Find(request);

            if (repair == null)
            {
                throw new EntityNotFoundException(request);
            }

            repair.DeletedAt = DateTime.Now;

            context.SaveChanges();
        }
    }
}
