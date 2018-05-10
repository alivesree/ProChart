package com.htl.hr.det
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.converters.JSON

@Transactional(readOnly = true)
class HrEmpTypeMastrController {
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def create() { }
    def index()  { }
    
    
    @Transactional
    def save(HrEmpTypeMastr hrEmpTypeMastrInstance){
        hrEmpTypeMastrInstance.delFlg='N'
        hrEmpTypeMastrInstance.statsFlg='A'
        hrEmpTypeMastrInstance.cretnBy = request.getCookie('htl_Pchrt_sd').toInteger();
        hrEmpTypeMastrInstance.cretnDate= new Date()

        if (!hrEmpTypeMastrInstance.validate()) {
            if(HrEmpTypeMastr.findByEmpTypeName(params.empTypeName)) flash.message= "Employee Code should be Unique"
            
            hrEmpTypeMastrInstance.errors.allErrors.each {
                println it
                //flash.message=it
            }
            //flash.message=hrEmpTypeMastrInstance.errors
            //println ("::"+hrEmpTypeMastrInstance.errors)
            respond hrEmpTypeMastrInstance.errors, view:'create'
            return
        }
        
        hrEmpTypeMastrInstance.save flush:true
        flash.message="Saved"     
        redirect action:'index'
    }
    
    
    def GetList()
    {
        
        
        def varr=HrEmpTypeMastr.createCriteria().list() {                    
            if(params.empTypeDesc!="" && params.empTypeDesc!=null) 
            {ilike("empTypeDesc","${params.empTypeDesc}%")  }
            if(params.empTypeName!="" && params.empTypeName!=null) 
            ilike("empTypeName","${params.empTypeName}%")
            ne("delFlg","Y")
            order("id", "desc")
        }
        
        def res = varr.collect{
            [    
                id:it.id,
                empTypeName:it.empTypeName,
                empTypeDesc:it.empTypeDesc,                                
            ]
        }
        def jsonData=[row:res]
        render jsonData as JSON
    }
    
    def edit(HrEmpTypeMastr hrEmpTypeMastrInstance){       
        respond hrEmpTypeMastrInstance
    }  
   
    @Transactional
    def update(HrEmpTypeMastr hrEmpTypeMastrInstance){
        
        if(params.del)
        {
            HrEmpTypeMastr.executeUpdate("delete HrEmpTypeMastr where delFlg = 'Y' and empTypeName=?",[params.empTypeName])
            hrEmpTypeMastrInstance.delFlg='Y'     
            flash.message="Deleted"
        }  
        else{
              
          
            if (!hrEmpTypeMastrInstance.validate()) {
                if(HrEmpTypeMastr.findByEmpTypeName(params.empTypeName)) flash.message= "Employee Code should be Unique"
                println ("::"+hrEmpTypeMastrInstance.errors)
                respond hrEmpTypeMastrInstance.errors, view:'create'
                return
            }
            
            flash.message="Updated"
            
        }
        hrEmpTypeMastrInstance.updtdBy=request.getCookie('htl_Pchrt_sd').toInteger();
        hrEmpTypeMastrInstance.updtdDate= new Date()
        hrEmpTypeMastrInstance.save flush:true
        redirect action:'index'
    }
}
