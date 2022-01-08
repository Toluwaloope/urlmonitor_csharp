using System;
using System.Collections.Generic;
using System.Text.Json;
using System.Net;
using System.Linq;
using Newtonsoft.Json;
using System.IO;
using System.Threading.Tasks;

namespace urlmonitor.Models
{
    public class JsonUrl
    {
        public string name { get; set; }
        public string url { get; set; }
        public string logpath { get; set; }

    }
  
    public class Tested
    {
        public string urlLists { get; set; }
        public string[] urls { get; set; }

        //public List<Monitor> testedUrls = new List<Monitor>();

        public string testedurlname { get; set; }
        public string testedurllink { get; set; }
        public string urlstatus { get; set; }
        public HttpStatusCode statuscode { get; set; }
        public byte[] jsonUrl { get; set; }

        private string path { get; set; }
    }

}
