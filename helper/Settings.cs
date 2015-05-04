using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace parser.helper
{
    using System;
    using System.IO;

    using System.Xml.Serialization;


        [Serializable]
        public class Settings
        {

            private static Settings _instance = new Settings();

            public static Settings Instance
            {
                get { return _instance; }
            }
            private Settings() { }

            [XmlElement]
            public int NumColumns { get; set; }


            /// <summary>
            /// ddddddddddddddddd
            /// </summary>
            [XmlElement]
            public int NumRows { get; set; }


            [XmlElement]
            public string Path { get; set; }


        }
}
