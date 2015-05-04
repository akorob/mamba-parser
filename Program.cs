using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net.Mime;
using System.Security.Policy;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Threading.Tasks;
using Awesomium.Core;
using parser.helper;
using parser.models;

namespace parser
{
    class Program
    {
        private static Entities2 db_;
        public static Entities2 Db
        {
            get
            {
                if (db_ == null)
                {
                    db_=new Entities2();
                }
                return db_;
            }
        }

        static void CurrentDomain_ProcessExit(object sender, EventArgs e)
        {
            Console.WriteLine("exit");
            Console.ReadKey();
        }

        static void Main(string[] args)
        {
            // "M", "F"
            const string mySex = "M"; //1
            // "M", "F"
            const string fSex = "F"; //2
            const int fromAge = 23; //3
            const int toAge = 32; //4
            //all Crimea:"3159_10227_0_0", Sevastopol:"3159_10227_10251_0",Simferopol:"3159_10227_10252_0" or goto www.mamba.ru 
            const string geoLocation = "3159_10227_0_0"; //5
            // a- all time, d - day, w - week, m - month, o - online
            const string newUser = "a"; //6

            AppDomain.CurrentDomain.ProcessExit += CurrentDomain_ProcessExit;
              

            var appSettingsPath = System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "app.config");
            var settings = Serializer.DeserializeObject<Settings>(appSettingsPath);

            Settings.Instance.NumColumns = 55;
            Console.WriteLine(Settings.Instance.ToString());
            Serializer.SerializeObject(appSettingsPath, Settings.Instance);

 

            WebCore.Initialize(new WebConfig() { });
            var str =
                "http://www.mamba.ru/ru/search.phtml?ia={1}&lf={2}&af={3}&at={4}&s_c={5}&wp=1&geo=0&t={6}&offset={0}";

            Console.WriteLine("Press esc to skip pre serch, press any other key to continue");
            var key = Console.ReadKey();
            if (key.Key != ConsoleKey.Escape )
            {
                Console.WriteLine("Parsing starts. " + DateTime.Now);
                var list = Db.infos.Where(c => c.Enable == true);
                foreach (var item in list)
                {
                    item.Enable = false;
                }
                Db.SaveChanges();
                var i = 0;
                while (true)
                {
                    var url = String.Format(str, i * 10, mySex, fSex, fromAge, toAge, geoLocation, newUser).ToUri();
                    i++;
                    Log("Parse "+url);
                    if (!NavigateAndTakeInfo(url)) break;

                }
                Log("Found " + Db.infos.Count(c => c.Enable==true)+" items. " + DateTime.Now);
            }
           

            Console.WriteLine("Detailed parsing starts " + DateTime.Now);
            string[] stoplist =
            {
                "Россия, Севастополь", "Россия, Симферополь", "Россия, Керчь", "Россия, Красноперекопск",
                "Россия, Ялта", "Россия, Евпатория", "Россия, Феодосия", "Россия, Армянск", "Россия, Алушта",
                "Россия, Черноморское", "Россия, Джанкой",
                "Россия, Саки", "Россия, Белогорск", "Россия, Судак"
            };
            var urlList = Db.infos.Where(c => c.Enable == true && !stoplist.Contains(c.Location)).Select(c => c.Link).ToList();
            var size = urlList.Count;
            for (int i = 0; i < size; i++)
            {
                Log("OK Parsing page " + i + " from "+size);
                var start = DateTime.Now;
                NavigateAndTakeDetailedInfo(urlList[i].ToUri());
                var t = DateTime.Now - start;
                Console.WriteLine(t.TotalSeconds);
            }
               

            Console.WriteLine("Press any key to end");
            Console.ReadKey();
        }

        private static void NavigateAndTakeDetailedInfo(Uri url)
        {
            using (WebSession session = WebCore.CreateWebSession(new WebPreferences()))
            {
                using (WebView view = WebCore.CreateWebView(1100, 600, session))
                {
                    var finishedLoading = false;
                    view.Source = url;

                    view.DocumentReady += (s, e) =>
                    {
                        if (e.ReadyState == DocumentReadyState.Loaded)
                        {
                            try
                            {
                           /*     String cStr = view.ExecuteJavascriptWithResult(
                                    "document.getElementsByTagName('html')[0].innerHTML");*/
                    
                                                                String cStr = view.ExecuteJavascriptWithResult(
                                                                    "document.getElementsByClassName('infoMisc')[0].innerText");
                                                                if (cStr == "undefined")
                                                                {
                                                                    Log("ERROR infoMisc==undefined " + url);
                                                                    finishedLoading = true;
                                                                    return;
                                                                }
                                                                var match = Regex.Match(cStr, @"^[0-9]{2}");
                                                                var ageStr = match.Value;
                                                                match = Regex.Match(cStr, @"^[0-9]{2}\s[а-яА-Я]{3,4},\s([а-яА-я]+).\s");
                                                                var horo = match.Groups[1].ToString();
                                                                int? age = (ageStr == "") ? (int?) null : int.Parse(ageStr);
                                                                String message = view.ExecuteJavascriptWithResult(
                                                                    "document.getElementsByClassName('fMessage js-value-greeting-rejected')[0].innerText");
                                                                String offStr = view.ExecuteJavascriptWithResult(
                                                                    "document.getElementsByClassName('offline-status')[0].innerText");
                                                                String goal = view.ExecuteJavascriptWithResult(
                                                                    "document.getElementsByClassName('b-anketa_field-content var-other js-value-lookfor-rejected')[0].innerText");
                                                                dynamic block = (JSObject) view.ExecuteJavascriptWithResult(
                                                                    "document.getElementsByClassName('b-anketa_inset-form clearfix')[1]");
                                                                if (block.ToString() == "undefined")
                                                                {
                                                                    Log("EROROR b-anketa_inset-form==undefined " + url);
                                                                    finishedLoading = true;
                                                                    return;
                                                                }
                                                                var leftBlock = block.children[0].innerText.ToString();
                                                                var heightStr = Helper.ExtractBetween(leftBlock, "Рост: ", " см");
                                                                int? height = (heightStr == "") ? null : int.Parse(heightStr);
                                                                var weightStr = Helper.ExtractBetween(leftBlock, "Вес: ", " кг");
                                                                int? weight = (weightStr == "") ? null : int.Parse(weightStr);

                                                                dynamic items = block.getElementsByClassName("b-anketa_field");
                                                                var length = (int) items.length;
                                                                var map = new Dictionary<string, string>();
                                                                for (var i = 0; i < length; i++)
                                                                {
                                                                    if (items[i].getAttribute("class").ToString() ==
                                                                        "b-anketa_field b-anketa_field-params")
                                                                        continue;
                                                                    var key = items[i].children[0].innerText;
                                                                    var value = items[i].children[1].innerText;
                                                                    map.Add(key.ToString(), value.ToString());
                                                                }
                                                                var userId = Helper.ExtractBetween(url.ToString(), "www.mamba.ru/ru/", "?");
                                                                var info = Db.infos.First(c => c.UserId == userId);
                                                                var detInf = new detailedinfo()
                                                                {
                                                                    Actual = true,
                                                                    Horscop = horo,
                                                                    Date = DateTime.Now,
                                                                    Goal = goal,
                                                                    Offline = offStr,
                                                                    Age = age,
                                                                    Height = height,
                                                                    Weight = weight,
                                                                    Message = message,
                                                                    Name = info.Name,
                                                                    SearchFor = info.SearchFor,
                                                                    SfStartAge = info.SfStartAge,
                                                                    SfEndAge = info.SfEndAge,
                                                                    Location = info.Location,
                                                                    LinkMamba = url.ToString(),
                                                                    LinkMail = "http://love.mail.ru/" + info.UserId,
                                                                    Accomodation =
                                                                        map.Where(m => m.Key == "Проживание:").Select(m => m.Value).FirstOrDefault(),
                                                                    Drink =
                                                                        map.Where(m => m.Key == "Отношение к алкоголю:")
                                                                            .Select(m => m.Value)
                                                                            .FirstOrDefault(),
                                                                    Relationship =
                                                                        map.Where(m => m.Key == "Отношения:").Select(m => m.Value).FirstOrDefault(),
                                                                    Education =
                                                                        map.Where(m => m.Key == "Образование:").Select(m => m.Value).FirstOrDefault(),
                                                                    SexOrient =
                                                                        map.Where(m => m.Key == "Ориентация:").Select(m => m.Value).FirstOrDefault(),
                                                                    Smoker =
                                                                        map.Where(m => m.Key == "Отношение к курению:")
                                                                            .Select(m => m.Value)
                                                                            .FirstOrDefault(),
                                                                    Kids = map.Where(m => m.Key == "Дети:").Select(m => m.Value).FirstOrDefault(),
                                                                    Build =
                                                                        map.Where(m => m.Key == "Телосложение:").Select(m => m.Value).FirstOrDefault(),
                                                                    Ethnity =
                                                                        map.Where(m => m.Key == "Внешность:").Select(m => m.Value).FirstOrDefault(),
                                                                    Income =
                                                                        map.Where(m => m.Key == "Материальное положение:")
                                                                            .Select(m => m.Value)
                                                                            .FirstOrDefault(),
                                                                    info = info
                                                                };
                                                                SaveDetailedInfoToDb(detInf);
                                                                Log("OK " + url);
                                finishedLoading = true;
                            }
                            catch(Exception ex)
                            {
                                finishedLoading = true;
                                Log("EXCEPTION :" + ex.StackTrace + "\n" + ex.Message);
                                ErrorLog("EXCEPTION :" + ex.StackTrace +"\n"+ex.Message);
                            }
                           
                        }
                    };
                    while (!finishedLoading)
                    {
                        Thread.Sleep(100);
                        WebCore.Update();
                    }
                }
            }
        }


        static bool NavigateAndTakeInfo(Uri url)
        {
            var isExist = false;
            using (WebSession session = WebCore.CreateWebSession(new WebPreferences()))
            {
                using (WebView view = WebCore.CreateWebView(1100, 600, session))
                {
                    var finishedLoading = false;
                    view.Source = url;
                    view.DocumentReady += (s, e) =>
                    {
                        if (e.ReadyState == DocumentReadyState.Loaded)
                        {
                         dynamic elements =
                           (JSObject)view.ExecuteJavascriptWithResult("document.getElementsByClassName('SAInfo')");
                            if (elements.ToString() == "undefined")
                            {
                                finishedLoading = true;
                                isExist = false;
                                return;
                            }
                        var length = (int)elements.length;
                        using (elements)
                        {
                            for (int i = 0; i < length; i++)
                            {
                                dynamic div = elements[i];
                                dynamic div2 = div.children[0];
                                var name = div2.children[0].innerHTML.ToString();
                                var link = div2.children[0].getAttribute("href").ToString();
                                var userId = Helper.ExtractBetween(link, "www.mamba.ru/ru/", "?");
                                var ageStr = div2.children[1].innerHTML.ToString();
                                int age;
                                Int32.TryParse(ageStr, out age);
                                var addrStr = div.children[1].innerHTML.ToString();
                                var location = addrStr.Split('&')[0];
                                String searchForStr;
                                if (div.children[2].getAttribute("class").ToString() == "s-param")
                                {
                                    searchForStr = div.children[2].innerHTML.ToString();
                                }
                                else
                                {
                                    searchForStr = div.children[3].innerHTML.ToString();
                                }
                                var searchFor = Helper.ExtractBetween(searchForStr, "Ищу ", ",");
                                var fromStr = Helper.ExtractBetween(searchForStr, ", ", "-");
                                int from;
                                Int32.TryParse(fromStr, out from);
                                var toStr = Helper.ExtractBetween(searchForStr, "-", " лет");
                                int to ;
                                Int32.TryParse(toStr, out to);

                                Console.WriteLine( name+ ", " + age +", " + location+ ", "+userId);
                                var info = new info()
                                {
                                    Age = age,
                                    UserId = userId,
                                    Link = link,
                                    Location = location,
                                    Name = name,
                                    SearchFor = searchFor,
                                    SfStartAge = from,
                                    SfEndAge = to,
                                    Enable = true,
                                    Date = DateTime.Now
                                };
                                isExist = true;
                                SaveInfoToDb(info);
                            }
                        }
                        
                        finishedLoading = true;
                       }
                    };
                    while (!finishedLoading)
                    {
                        Thread.Sleep(100);
                        WebCore.Update();
                    }
                } 
            }
            return isExist;
        }

        static void Log(string str)
        {
            File.AppendAllText(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "log.txt"), DateTime.Now + ": " + str + "\n");
            Console.WriteLine(str);
        }

        static void ErrorLog(string str)
        {
            File.AppendAllText(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "errorlog.txt"), DateTime.Now + ": " + str + "\n");
           // Console.WriteLine(str);
        }

        static void SaveInfoToDb(info info)
        {
            var item = Db.infos.FirstOrDefault(c => c.UserId == info.UserId);
            if (item != null)
            {
                Db.infos.Remove(item);
                Db.infos.Add(info);
            }
            else
            {
                Db.infos.Add(info);
            }
            Db.SaveChanges();
        }

        static void SaveDetailedInfoToDb(detailedinfo dinfo)
        {

            var max = (Db.detailedinfos.Any()) ?Db.detailedinfos.Select(c => c.Id).Max() : 0;
            var oldList = Db.detailedinfos.Where(c => c.info.UserId == dinfo.info.UserId).ToList();
            foreach (var entry in oldList)
            {
                entry.Actual = false;
            }
            dinfo.Id = max + 1; 
            Db.detailedinfos.Add(dinfo);
            Db.SaveChanges();
        }
    }
}
