package com.htl.pro.det

class ProProjectMastr {

        String projName
        ProProjCatagMastr catg
        String projMode="R"
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
                
        projName(nullable:false,maxSize:20)
        catg(nullable:false)
        projMode(nullable:false)
        strtDt(nullable:false)
        endDt(nullable:false)
    }
    static mapping={
        columns
        {
            id column:"proj_id"        
        }
    }
    
}
