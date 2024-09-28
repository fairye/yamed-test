using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Text;
using System.Threading.Tasks;
using YamedApp.Entities;

namespace YamedApp.Classes
{
    public static class Authorization
    {
        public static bool IsAuthenticated(string Login, string Password)
        {
            List<UserLogin> loginList = new List<UserLogin>();
            loginList = AppData.Context.UserLogin.ToList();

            if (AppData.Context.UserLogin.FirstOrDefault(p => p.Login == Login && p.Password == Password) != null)
            {
                AppData.currentBalance = AppData.Context.Balance.ToList().Where(i => i.IdUser == loginList.FirstOrDefault(p => p.Login == Login && p.Password == Password).IdUserLogin).FirstOrDefault();
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
