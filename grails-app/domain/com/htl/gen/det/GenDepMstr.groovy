package com.htl.gen.det

class GenDepMstr {

    String depCd
    String depName
    
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
        
        depCd(nullable:false,unique: 'delFlg',maxSize:20)
        depName(nullable:false,maxSize:50) 
    }
    
     static mapping=
    {
        columns
        {
            id column:"dep_id"  
        }
    }
}
