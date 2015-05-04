using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace parser
{
    static class Helper
    {
        public static string ExtractBetween(string text, string start, string end)
        {
// ReSharper disable once StringIndexOfIsCultureSpecific.1
            int iStart = text.IndexOf(start);
            iStart = (iStart == -1) ? 0 : iStart + start.Length;
// ReSharper disable once StringIndexOfIsCultureSpecific.2
            int iEnd = text.IndexOf(end, iStart);
            if (iEnd == -1)
            {
                iEnd = (iStart==0) ? 0 :text.Length;
            }
            int len = iEnd - iStart;

            return text.Substring(iStart, len);
        }
    }
}
