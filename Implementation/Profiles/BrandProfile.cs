using Application.DTO;
using AutoMapper;
using Domain.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Profiles
{
    public class BrandProfile : Profile
    {
        public BrandProfile()
        {
            CreateMap<Brand, BrandDto>();
            CreateMap<BrandDto, Brand>();
        }
    }
}
