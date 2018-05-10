package com.htl.pro.det

class ProBudgetMastr {
        String bdgtName
        ProProjectMastr proj
        Double bdgtAmt
        String bdgtMode="R"
        Date strtDt
        Date endDt

    String strtDtStr
    String endDtStr
    static transients = ['strtDtStr','endDtStr']
    
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
                
        bdgtName(nullable:false,maxSize:20)
        bdgtAmt(nullable:false)
        bdgtMode(nullable:false,maxSize:1)
        strtDt(nullable:false)
        endDt(nullable:false)
    }
    static mapping={

        columns
        {
            id column:"bdgt_id"  
        }
    }
}
