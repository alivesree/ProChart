package com.htl.pro.det

class ProProgSettingDtls {
    
    ProProgSettingMastr progStng
    ProProgMastr prog
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
                
        progStng(nullable:false)
        prog(nullable:false)
        strtDt(nullable:false)
        endDt(nullable:false)
    }
    static mapping={
        columns
        {
            id column:"prog_stng_dtls_id"  
        }
    }
}
