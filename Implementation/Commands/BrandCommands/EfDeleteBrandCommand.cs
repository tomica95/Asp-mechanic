using Application.Commands.Brand;
using Application.Exceptions;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.BrandCommands
{
    public class EfDeleteBrandCommand : IDeleteBrandCommand
    {

        private readonly Context context;

        public EfDeleteBrandCommand(Context context)
        {
            this.context = context;
        }

        public int Id => 23;

        public string Name => "Delete brand";

        public void Execute(int id)
        {
            var brand = context.Brands.Find(id);

            if (brand == null)
            {
                throw new EntityNotFoundException(id);
            }

            brand.DeletedAt = DateTime.Now;

            context.SaveChanges();
        }
    }
}
