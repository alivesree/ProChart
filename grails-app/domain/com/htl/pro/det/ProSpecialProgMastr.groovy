package com.htl.pro.det

class ProSpecialProgMastr {

    String spclName
    String descr
    Integer timAlloted=0
    
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
                
        descr(nullable:true,maxSize:100)
        spclName(nullable:false,maxSize:30)
        endDt(nullable:false)
        timAlloted(nullable:false)
        strtDt(nullable:false)
    }
    static mapping={
        columns
        {
            id column:"spcl_prog_id"  
        }
    }
}