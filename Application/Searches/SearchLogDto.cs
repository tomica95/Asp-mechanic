using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Searches
{
    public class SearchLogDto : PagedSearch
    {
        public string Actor { get; set; }
        public string UseCase { get; set; }
        public DateTime? DateFrom { get; set; }
        public DateTime? DateTo { get; set; }
    }
}
