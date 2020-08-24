using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Searches
{
    public class SearchUserDTO : PagedSearch
    {
        public string Username { get; set; }
        public string FullName { get; set; }
        public string Role { get; set; }
        public string Car { get; set; }

    }
}
