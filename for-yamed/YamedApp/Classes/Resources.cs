using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace YamedApp.Classes
{
    public static class Resources
    {
        public static float rubToUsd = 0.011f;
        public static float usdToRub = 94.22f;
        public static float euroToUsd = 1.12f;
        public static float usdToEuro = 0.9f;
        public static float euroToRub = 105.26f;

        public static double convertToUsd(double money)
        {
            switch (AppData.currentBalance.Currency.CurrencyName)
            {
                case "Рубль":
                    return (float) money * rubToUsd;
                case "Евро":
                    return (float) money * euroToUsd;
                default:
                    return (float) money;
            }
        }
    }
}
