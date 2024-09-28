using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using YamedApp.Classes;
using YamedApp.Entities;

namespace YamedApp
{
    internal class Program
    {
        public static bool StringIsDigits(string s)
        {
            foreach (var item in s)
            {
                if (!char.IsDigit(item))
                    return false; 
            }
            return true; 
        }

        public static void Main(string[] args)
        {
            
            while (true)
            {
                Console.WriteLine("Введите логин");
                string userLogin = Console.ReadLine();
                
                if (string.IsNullOrWhiteSpace(userLogin))
                {
                    Console.WriteLine("Логин не может быть пустым");
                    Console.ReadKey();   
                    continue;
                }
                Console.WriteLine("Введите пароль");
                string userPassword = Console.ReadLine();
                if (string.IsNullOrWhiteSpace(userPassword))
                {
                    Console.WriteLine("Пароль не может быть пустым");
                    Console.ReadKey();
                    continue;
                }

                if (Classes.Authorization.IsAuthenticated(userLogin, userPassword))
                {
                    showBankAcc();
                    Console.ReadKey();
                    bool isContinue = true;

                    while(isContinue)
                    {
                        Console.WriteLine("Выберите операцию: ");
                        Console.WriteLine("1 - Пополнить\n2 - Перевести\n3 - Потратить\n4 - Выйти из аккаунта");

                        int? answer = null;
                        try
                        {
                            answer = Convert.ToInt32(Console.ReadLine());
                        }
                        catch (Exception)
                        {
                            Console.WriteLine("Введите НОМЕР операции!");
                            break;
                        }
                        
                        switch(answer)
                        {
                            case 1:
                                Console.WriteLine("Введите сумму для пополнения");
                                try
                                {
                                    string consoleAnswer = Console.ReadLine().Replace(" ", "").Trim();
                                    if (!StringIsDigits(consoleAnswer))  
                                    {
                                        Console.WriteLine("Вводите цирфы");
                                        break;
                                    }
                                    double refilSum = Convert.ToDouble(consoleAnswer);
                                    Classes.Operation.refilBalance(refilSum);
                                    showBankAcc();
                                    Console.ReadKey();
                                }
                                catch (Exception)
                                {
                                    Console.WriteLine("Вводите цирфы");
                                    break;                                  
                                }
                                break;
                            case 2:
                                try
                                {
                                    Console.WriteLine("Введите номер счета для перевода");
                                    int bankAcc = Convert.ToInt32(Console.ReadLine());
                                    Console.WriteLine("Введите сумму для перевода");
                                    double transferSum = Convert.ToDouble(Console.ReadLine());
                                    Classes.Operation.moneyTransfer(transferSum, bankAcc);
                                    showBankAcc();
                                    Console.ReadKey();
                                }
                                catch (Exception ex)
                                {
                                    Console.WriteLine("Введены некорректные данные");
                                    break;
                                }
                                
                                break;
                            case 3:
                                Console.WriteLine("Введите сумму для списания");
                                try
                                {
                                    string consoleAnswer = Console.ReadLine().Replace(" ", "").Trim();
                                    if (!StringIsDigits(consoleAnswer))
                                    {
                                        Console.WriteLine("Вводите цирфы");
                                        break;
                                    }
                                    double refilSum = Convert.ToDouble(consoleAnswer);
                                    Classes.Operation.withdrawMoney(refilSum);
                                    showBankAcc();
                                    Console.ReadKey();
                                }
                                catch (Exception)
                                {
                                    Console.WriteLine("Вводите цирфы");
                                    break;                                  
                                }
                                    break;
                            case 4:
                                isContinue = false;
                                    break;
                            default:
                                Console.WriteLine("Выьерите операцию из списка");
                                break;
                        }
                    }
                }
                else
                {
                    Console.WriteLine("Пользователь не найден");
                    Console.ReadKey();
                    continue;
                }
            }           
        }
        public static void showBankAcc() 
        {
            Console.WriteLine("Ваш баланс: ");
            Console.WriteLine("Валюта: " + AppData.currentBalance.Currency.CurrencyName);
            Console.WriteLine("Остаток: " + AppData.currentBalance.Amount);
        }
    }
}
