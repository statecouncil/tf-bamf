using System;
using System.Collections.Generic;
using System.IO;
using System.Text.RegularExpressions;

namespace RadShadowMan
{
    class Program
    {
        static string radfile = "forcetextureshadow.rad";
        static string kvpattern = "[\"']model[\"']?(?<path>[\"'].+[\"'])";
        static string radData = "";

        static void ProcessFile(string file)
        {
            string fileContents = File.ReadAllText(file);
            Regex rx = new Regex(kvpattern, RegexOptions.IgnoreCase | RegexOptions.Multiline | RegexOptions.IgnorePatternWhitespace);
            MatchCollection matches = rx.Matches(fileContents);

            List<string> models = new List<string>();

            if (matches.Count == 0)
                return;

            radData += "\n\n" + file + "\n-------------------------------------\n";

            string radList = "";
            foreach (Match match in matches)
            {
                GroupCollection groups = match.Groups;
                string path = groups["path"].Value?.Replace("\"", "")?.Replace("'", "")?.Replace("models/", "")?.Trim();
                if (string.IsNullOrWhiteSpace(path))
                    continue;

                if (models.Contains(path))
                    continue;

                models.Add(path);
  
                radData += $"forcetextureshadow {path}\n";
                radList += $"forcetextureshadow {path}\n";
            }

            string radFile = Path.GetDirectoryName(file) + "/" + Path.GetFileNameWithoutExtension(file) + ".rad";
            File.WriteAllText(radFile, radList);
            Console.WriteLine($"Creating unique rad file: {radFile}");
        }

        static void RecurseCheck(string path)
        {
            foreach (string fn in Directory.GetFiles(path))
                if (fn.Substring(fn.Length - 3) == "vmf")
                    ProcessFile(fn);

            foreach (string dir in Directory.GetDirectories(path))
                RecurseCheck(dir);
        }

        static void Main(string[] args)
        {
            if (args == null || args.Length == 0)
            {
                Console.WriteLine("No argument given. Drag files or folders on this exe. or pass file/folder paths as arguments");
                return;
            }

            foreach (string path in args)
            {
                string p = path.Replace("\"", "").Trim();
                if (p.Substring(p.Length - 3) == "vmf")
                    ProcessFile(p);
                else if(File.Exists(p + ".vmf"))
                    ProcessFile(p + ".vmf");
                else
                    RecurseCheck(p);
            }

            File.WriteAllText(AppDomain.CurrentDomain.BaseDirectory + "/" + radfile, radData);
            Console.WriteLine("Rad files completed");
        }
    }
}