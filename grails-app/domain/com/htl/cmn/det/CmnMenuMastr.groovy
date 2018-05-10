package com.htl.cmn.det

class CmnMenuMastr {

    String menuName
    CmnMenuGrpMastr  menuGrp    
    CmnModlMastr modl
    String className
    String adtnlData
    String code
    String details
    String rmndrMenu='N'
      // common fields        
    String delFlg="N"      // Y / N
    String  statsFlg="A"    // A-Active / I-InActive
    int cretnBy
    Date cretnDate
    int updtdBy
    Date  updtdDate
    static constraints = {
         menuName(nullable:false,blank:false,maxSize:100)
         menuGrp(nullable:false,blank:false)
         modl(nullable:false,blank:false)
         className(nullable:false,blank:false,maxSize:500)
         adtnlData(nullable:true,blank:true,maxSize:500)
         code(nullable:true,blank:true,maxSize:50)
         details(nullable:true,blank:true,maxSize:100)
         rmndrMenu(nullable:true,blank:true,maxSize:10)
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
            id column:"menu_id"          
        }
    }
}
