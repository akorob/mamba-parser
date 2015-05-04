//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace parser.models
{
    using System;
    using System.Collections.Generic;
    
    public partial class detailedinfo
    {
        public detailedinfo()
        {
            this.intereses = new HashSet<interes>();
            this.photos = new HashSet<photo>();
        }
    
        public int Id { get; set; }
        public string Name { get; set; }
        public string Horscop { get; set; }
        public string Message { get; set; }
        public string Goal { get; set; }
        public Nullable<int> Height { get; set; }
        public Nullable<int> Weight { get; set; }
        public string Build { get; set; }
        public string Ethnity { get; set; }
        public string Relationship { get; set; }
        public string Education { get; set; }
        public string SexOrient { get; set; }
        public string Smoker { get; set; }
        public string Drink { get; set; }
        public string Kids { get; set; }
        public string Income { get; set; }
        public string Accomodation { get; set; }
        public Nullable<int> Age { get; set; }
        public string Location { get; set; }
        public string LinkMamba { get; set; }
        public string LinkMail { get; set; }
        public string SearchFor { get; set; }
        public Nullable<int> SfStartAge { get; set; }
        public Nullable<int> SfEndAge { get; set; }
        public Nullable<System.DateTime> Date { get; set; }
        public Nullable<bool> Actual { get; set; }
        public string Offline { get; set; }
    
        public virtual info info { get; set; }
        public virtual ICollection<interes> intereses { get; set; }
        public virtual ICollection<photo> photos { get; set; }
    }
}
