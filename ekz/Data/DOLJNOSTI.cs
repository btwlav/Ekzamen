//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ekz.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class DOLJNOSTI
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DOLJNOSTI()
        {
            this.ACTIVITIES = new HashSet<ACTIVITIES>();
        }
    
        public int dol_id { get; set; }
        public string dol_name { get; set; }
        public Nullable<int> podraz_id { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ACTIVITIES> ACTIVITIES { get; set; }
        public virtual PODRAZDELENIYA PODRAZDELENIYA { get; set; }
    }
}
