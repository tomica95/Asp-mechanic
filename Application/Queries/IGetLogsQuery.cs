﻿using Application.CommandHandler;
using Application.DTO;
using Application.DTO.Pagination;
using Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries
{
    public interface IGetLogsQuery : IQuery<SearchLogDto,PagedResponse<LogDTO>>
    {
    }
}
