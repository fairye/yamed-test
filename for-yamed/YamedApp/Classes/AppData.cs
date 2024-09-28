using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using YamedApp.Entities;

namespace YamedApp.Classes
{
    public static class AppData
    {
        public static Entities.Bank2Entities Context { get; set; } = new Entities.Bank2Entities();

        public static Balance currentBalance = new Balance();
    }
}
