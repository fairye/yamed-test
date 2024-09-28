using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;

namespace YamedApp.Classes
{
    public static class Operation
    {
        public static void refilBalance(double sum)
        {
            try
            {
                if (sum <= 0)
                {
                    Console.WriteLine("Сумма пополнения должна быть больше нуля");
                    return;
                }
                AppData.currentBalance.Amount += Convert.ToDecimal(sum);
                AppData.Context.SaveChanges();
                AppData.Context.Operation.Add(new Entities.Operation()
                {
                    User = AppData.Context.User.ToList().Where(p => p.IdUser == AppData.currentBalance.IdUser).FirstOrDefault(),
                    Balance = AppData.currentBalance,
                    Transaction = AppData.Context.Transaction.ToList().Where(p => p.IdTransaction == 1).FirstOrDefault(),
                });
                AppData.Context.SaveChanges();
            } catch (Exception ex) 
            {
                Console.WriteLine(ex);
                return;
            }
        }
        public static void moneyTransfer(double money, int bankAcc) 
        {
            try
            {
                if (money <= 0)
                {
                    Console.WriteLine("Сумма перевода должна быть больше нуля");
                    return;
                }
                if (!AppData.Context.User.ToList().Where(p => p.IdUser == bankAcc).Any())
                {
                    Console.WriteLine("Такого счёта не существует");
                    return;
                }
                if (AppData.currentBalance.Amount < Convert.ToDecimal(money))
                {
                    Console.WriteLine("Недостаточно средств");
                    return;
                }
                if (AppData.currentBalance.IdUser == bankAcc)
                {
                    Console.WriteLine("Вы не можете перевести деньги себе");
                    return;
                }

                double currentUserAmount = Resources.convertToUsd(money);
                switch(AppData.Context.Balance.ToList().Where(p => p.IdUser == bankAcc).FirstOrDefault().Currency.CurrencyName)
                {
                    case "Рубль":
                        AppData.currentBalance.Amount -= (decimal)money;
                        AppData.Context.SaveChanges();
                        AppData.Context.Balance.ToList().Where(p => p.IdUser == bankAcc).FirstOrDefault().Amount += (decimal) currentUserAmount * (decimal) Resources.usdToRub;
                        AppData.Context.SaveChanges();
                        break;
                    case "Евро":
                        AppData.currentBalance.Amount -= (decimal)money;
                        AppData.Context.SaveChanges();
                        AppData.Context.Balance.ToList().Where(p => p.IdUser == bankAcc).FirstOrDefault().Amount += (decimal)currentUserAmount * (decimal)Resources.usdToEuro;
                        AppData.Context.SaveChanges();
                        break;
                    case "Доллар":
                        AppData.currentBalance.Amount -= (decimal)money;
                        AppData.Context.SaveChanges();
                        AppData.Context.Balance.ToList().Where(p => p.IdUser == bankAcc).FirstOrDefault().Amount += (decimal)currentUserAmount;
                        AppData.Context.SaveChanges();
                        break;
                }             
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                return;
            }
        }
        public static void withdrawMoney(double money)
        {
            try
            {
                if (money <= 0)
                {
                    Console.WriteLine("Вводите только положительные значения");
                    return;
                }
                if (AppData.currentBalance.Amount < Convert.ToDecimal(money))
                {
                    Console.WriteLine("Недостаточно средств");
                    return;
                }
                AppData.currentBalance.Amount -= Convert.ToDecimal(money);
                AppData.Context.SaveChanges();
                AppData.Context.Operation.Add(new Entities.Operation()
                {
                    User = AppData.Context.User.ToList().Where(p => p.IdUser == AppData.currentBalance.IdUser).FirstOrDefault(),
                    Balance = AppData.currentBalance,
                    Transaction = AppData.Context.Transaction.ToList().Where(p => p.IdTransaction == 3).FirstOrDefault(),
                });
                AppData.Context.SaveChanges();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                return;
            }
        }
    }
}
