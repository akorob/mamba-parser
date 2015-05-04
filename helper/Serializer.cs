using System;
using System.IO;
using System.Xml.Serialization;

namespace parser.helper
{

    public class Serializer
    {
        public static T DeserializeObject<T>(string serializeFileName)
            where T : class
        {
            try
            {
                var ser = new XmlSerializer(typeof(T));
                var fi = new FileInfo(serializeFileName);
                if (fi.Exists)
                {
                    using (var fileStream = fi.OpenRead())
                    {
                        var res = (T)ser.Deserialize(fileStream);
                        return res;
                    }
                }
                else
                {
                    Console.WriteLine("Файл настроек отсутствует. Ожидаемый файл с настройками: " + serializeFileName);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Ошибка загрузки настроек. " + ex.ToString());
            }
            return null;
        }


        public static void SerializeObject<T>(string serializeFileName, T obj)
        {
            try
            {
                var mySerializer = new XmlSerializer(typeof(T));
                using (var myWriter = new StreamWriter(serializeFileName, false))
                {
                    mySerializer.Serialize(myWriter, obj);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Ошибка сохранения настроек. " + ex.ToString());   
            }
        }

    }
}