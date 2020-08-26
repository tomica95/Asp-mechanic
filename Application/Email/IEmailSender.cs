using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Email
{
    public interface IEmailSender
    {
        void Send(SendEmail dto);
    }

    public class SendEmail 
    {
        public string Subject { get; set; }

        public string Content { get; set; }

        public string SendTo { get; set; }
    }
}
