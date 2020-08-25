using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Searches
{
    public class SearchCarDto : PagedSearch
    {
        public string Name { get; set; }
        public string User { get; set; }
    }
}
