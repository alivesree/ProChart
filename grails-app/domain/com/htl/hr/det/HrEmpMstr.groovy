package com.htl.hr.det
import com.htl.gen.det.*;


class HrEmpMstr {

  String bldngName
  String country
  String distrct
  Date dob    
  Date doj
  String email
  String empId
  String empName
  HrEmpTypeMastr empType
  Integer empUsrId
  String fatherName
  String landPhnNo
  String mobNo
  String picType
  String pinCd
  String place
  String poDtls
  Byte[]  profPic
  String state
  GenDepMstr dep
  GenDesigMastr desig
  Integer reportTo
  String payBy="S"
  Double grossSal=0
  Double basicSal=0
  Double dailyWage=0
       
    String dobStr
    String dojStr
     static transients = ['dobStr','dojStr']
     
    
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
                
              dob(nullable:false)
              empName(nullable:false,maxSize:50)
              empUsrId(nullable:false,maxSize:11)
              mobNo(nullable:false,maxSize:15)
              
              dailyWage(nullable:true)
              payBy(nullable:true,maxSize:1)
              reportTo(nullable:true)
              desig(nullable:true)
              dep(nullable:true)
              state(nullable:true,maxSize:50)
              pinCd(nullable:true,maxSize:10)
              poDtls(nullable:true,maxSize:50)
              picType(nullable:true)
              email(nullable:true,maxSize:100)
              landPhnNo(nullable:true,maxSize:15)
              fatherName(nullable:true,maxSize:50)
              empType(nullable:true)
              empId(nullable:true, unique: 'delFlg',maxSize:20)
              doj(nullable:true)
              distrct(nullable:true,maxSize:50)
              country(nullable:true,maxSize:50)
              bldngName(nullable:true,maxSize:50)
              basicSal(nullable:true)
              grossSal(nullable:true)
              place(nullable:true,maxSize:50)
              profPic(nullable:true)
    }
    static mapping={        
        columns
          {
                profPic sqlType:"LONGBLOB"
                id column:"emp_mastr_id"             
          }
    }
}
