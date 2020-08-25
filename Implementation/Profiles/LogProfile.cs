using Application.DTO;
using AutoMapper;
using Domain.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Profiles
{
    public class LogProfile : Profile
    {
        public LogProfile()
        {
            CreateMap<UseCaseLog, LogDTO>();
            CreateMap<LogDTO, UseCaseLog>();
        }
    }
}
