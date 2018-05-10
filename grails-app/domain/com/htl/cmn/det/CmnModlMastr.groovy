package com.htl.cmn.det

class CmnModlMastr {

      
     String modlName;
 
    // common fields        
    String delFlg="N"      // Y / N
    String  statsFlg="A"    // A-Active / I-InActive
    int cretnBy
    Date cretnDate
    int updtdBy
    Date  updtdDate
    
    
     static constraints = {
                 
        modlName(nullable:false,blank:false,maxSize:200)
               
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
            id column:"modl_id"          
        }
    }
    }
    
    

