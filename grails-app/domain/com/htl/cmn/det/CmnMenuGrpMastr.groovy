package com.htl.cmn.det

class CmnMenuGrpMastr {
            
CmnModlMastr modl
String menuGrpName
CmnMenuGrpMastr parntMenuGrp

    
static hasMany = [parntMenuGrp : CmnMenuGrpMastr] 
    
    
    
     // common fields        
    String delFlg="N"      // Y / N
    String  statsFlg="A"    // A-Active / I-InActive
    int cretnBy
    Date cretnDate
    int updtdBy
    Date  updtdDate
    
    static constraints = {
         modl(nullable:false)       
         menuGrpName(nullable:false,blank:false,maxSize:100)
         parntMenuGrp(nullable:true) 
        
         //commomn constraint
        statsFlg(nullable:false,blank:false,maxSize:1,inList:["A","I"])
        delFlg(nullable:false,blank:false,maxSize:2,inList:["Y","N"])
        cretnBy(nullable:false,blank:false)
        cretnDate(nullable:false,blank:false)
        updtdBy(nullable:true)
        updtdDate(nullable:true)
    }
    
    static mapping=
    {
        columns
        {
            id column:"menu_grp_id"          
        }
    }
}
