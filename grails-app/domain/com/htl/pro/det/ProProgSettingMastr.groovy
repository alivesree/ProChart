package com.htl.pro.det

class ProProgSettingMastr { //table1   ProProgSettingDayDtls table2 ProProgSettingDtls table3
                

    String refNo
    
         // common fields        
    String delFlg="N"      // Y / N
    String  statsFlg="A"    // A-Active / I-InActive
    int cretnBy
    Date cretnDate
    int updtdBy
    Date  updtdDate
    
    static constraints = {
         //commomn constraint
        statsFlg(nullable:false,blank:false,maxSize:1,inList:["A","I"])
        delFlg(nullable:false,blank:false,maxSize:2,inList:["Y","N"])
        cretnBy(nullable:false,blank:false)
        cretnDate(nullable:false,blank:false)
        updtdBy(nullable:true)
        updtdDate(nullable:true)
                
        refNo(nullable:false,unique:true,maxSize:20)
    }
    static mapping={
        columns
        {
            id column:"prog_stng_id"  
        }
        
    }
}
