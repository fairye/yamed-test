//------------------------------------------------------------------------------
// <auto-generated>
//    Этот код был создан из шаблона.
//
//    Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//    Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace YamedApp.Entities
{
    using System;
    using System.Collections.Generic;
    
    public partial class Balance
    {
        public Balance()
        {
            this.Operation = new HashSet<Operation>();
        }
    
        public int IdBalance { get; set; }
        public Nullable<decimal> Amount { get; set; }
        public int IdCurrency { get; set; }
        public Nullable<int> IdUser { get; set; }
    
        public virtual Currency Currency { get; set; }
        public virtual User User { get; set; }
        public virtual ICollection<Operation> Operation { get; set; }
    }
}
