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
 
    public class MonitorUtil
    {
        
        public List<JsonUrl> GetUrlDetails()
        {
            
                List<JsonUrl> urldetails = new List<JsonUrl>();
                string filePath = @"~\urls.json";
            try
            {
                urldetails = JsonConvert.DeserializeObject<List<JsonUrl>>(System.IO.File.ReadAllText(filePath));
           
            }
            catch (Exception e)
            {
                Console.WriteLine("Unable to read urls from file");
                Console.WriteLine(e);
            }

          
            //while (calendardeatils) { }
            return urldetails;

        }

        public List<Tested> TestUrls() {

            List<Tested> testedUrls = new List<Tested>();

            List<JsonUrl> Urls = GetUrlDetails();
           

            foreach (var url in Urls)
            {
                var newtest = new Tested();
                
                     // Creates an HttpWebRequest for the specified URL.

                    HttpWebRequest myHttpWebRequest = (HttpWebRequest)WebRequest.Create(url.url);
                    myHttpWebRequest.Timeout = 5000;
                    newtest.testedurllink = url.url;
                    newtest.testedurlname = url.name;
                // Sends the HttpWebRequest and waits for a response.
                try
                {   

                    HttpWebResponse myHttpWebResponse = (HttpWebResponse)myHttpWebRequest.GetResponse();
                    if (myHttpWebResponse.StatusCode == HttpStatusCode.OK)
                    {
                        newtest.urlstatus = "Url is available and ok";
                        newtest.statuscode = myHttpWebResponse.StatusCode;
                        //myHttpWebResponse.StatusDescription;
                    }
                    else if (myHttpWebResponse.StatusCode != HttpStatusCode.OK)
                    {
                        newtest.urlstatus = "Url is available but not ok";
                        newtest.statuscode = myHttpWebResponse.StatusCode;

                    }
                    else if (myHttpWebResponse.StatusDescription == null) {

                        newtest.urlstatus = "Url did not respond";
                        //newtest.statuscode = myHttpWebResponse.StatusCode;

                    }
                    // Releases the resources of the response.
                    myHttpWebResponse.Close();
                }
                catch (WebException e)
                {

                }
                    
                    
                try
                {
                    testedUrls.Add(newtest);

                }
                catch (WebException e)
                {
                    //Console.WriteLine("\r\nWebException Raised. The following error occurred : {0}", e.Status);
                }
                catch (Exception e)
                {
                    //Console.WriteLine("\nThe following Exception was raised : {0}", e.Message);
                }


            }


            return testedUrls;
        }
        
       
    }
}
