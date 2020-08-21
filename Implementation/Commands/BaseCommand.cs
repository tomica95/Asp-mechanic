using AutoMapper;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands
{
    public abstract class BaseCommand
    {
        private readonly Context _context;
        private readonly IMapper _mapper;

        protected BaseCommand(Context context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public Context Context => _context;

        public IMapper Mapper => _mapper;
    }
}
