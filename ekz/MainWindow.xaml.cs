using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Xml;

namespace ekz
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public static Data.ekz_lysanovEntities db = new Data.ekz_lysanovEntities();
        public MainWindow()
        {
            InitializeComponent();
            DataContext = this;

            XmlDocument xDoc = new XmlDocument();
            //List<Main> main = new List<Main>();
            //MainDataGrid.ItemsSource = main.ToList();
            xDoc.Load("XMLFile.xml");

            XmlElement xRoot = xDoc.DocumentElement;
            XmlNodeList rabNodes = xRoot.SelectNodes("ЗЛ");
            Data.RABOTNIKI rabotniki = new Data.RABOTNIKI();

            if (rabNodes != null) {
                foreach (XmlNode node in rabNodes) {
                    rabotniki.rab_fio = node.SelectSingleNode("ФИО").Value;
                    rabotniki.rab_bdate = DateTime.Parse(node.SelectSingleNode("ДатаРождения").Value);
                    rabotniki.rab_snils = node.SelectSingleNode("СНИЛС").Value;
                }
            }


            foreach (XmlElement item in xDoc.DocumentElement)
            {
                Main prog = new Main();
                for (int i = 0; i < item.ChildNodes.Count; i++)
                {
                    var value = item.ChildNodes.Item(i).LocalName;
                    var buf = item.ChildNodes.Item(i);
                    switch (value)
                    {
                        case "prname":
                            prog.name_prog = buf.InnerText;
                            break;
                        case "prstart":
                            int.TryParse(buf.InnerText, out int val);
                            prog.startYear = val;
                            break;
                        case "prend":
                            prog.finishYear = Convert.ToInt32(buf.InnerText);
                            break;
                            //case "prmainexe":
                            //    prog.Departure.name_dep = buf.InnerText;
                            //    break;
                    }
                }
                main.Add(prog);
                MainDataGrid.ItemsSource = main.ToList();
            }
            db.Main.AddRange(main);
            db.SaveChanges();
            MainDataGrid.ItemsSource = main;
        }
    }
}
}
