package com.htl.cmn.det

class CmnUsrMastr {

        String   usrCd
        String   usrName
        String   usrPaswrd
        String   usrType
        
    
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
        
        usrCd(nullable:false,unique:true,maxSize:20) 
        usrName(nullable:false,maxSize:50) 
        usrPaswrd(nullable:false,maxSize:50) 
        usrType(nullable:false,maxSize:1) 
         }
         
        static mapping=
        {
             columns
          {
                id column:"usr_id"  
          }
        } 
}
