package com.htl.gen.det
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.converters.JSON


@Transactional(readOnly = true)
class GenDesigMastrController {
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def create() { }
    def index()  { }
    
    @Transactional
    def save(GenDesigMastr desigInstance){
        desigInstance.delFlg='N'
        desigInstance.statsFlg='A'
        //desigInstance.cretnBy=1
        desigInstance.cretnBy = request.getCookie('htl_Pchrt_sd').toInteger();        
        desigInstance.cretnDate= new Date()
        if (!desigInstance.validate()) {
            if(GenDesigMastr.findByDesigCd(params.desigCd)) flash.message= "Designation Code should be Unique!"
            //flash.message=desigInstance.errors
            println ("::"+desigInstance.errors)
            respond desigInstance.errors, view:'create'
            return
        }
        desigInstance.save flush:true     
        flash.message="Saved"
        redirect action:'index'
    }
    
    
    def GetList()
    {
        def varr=GenDesigMastr.createCriteria().list() {                    
            if(params.desigCd!="" && params.desigCd!=null) 
            {ilike("desigCd","${params.desigCd}%")  }
            if(params.desigName!="" && params.desigName!=null) 
            ilike("desigName","${params.desigName}%")
            ne("delFlg","Y")
            order("id", "desc")
        }
       
        def res = varr.collect{
            [    
                id:it.id,
                desigCd:it.desigCd,
                desigName:it.desigName,                                
            ]
        }
        def jsonData=[row:res]
        render jsonData as JSON
    }
    
    def edit(GenDesigMastr desigInstance){       
        respond desigInstance
    }
   
    @Transactional
    def update(GenDesigMastr desigInstance){        
        if(params.del)
        {
            GenDesigMastr.executeUpdate("delete GenDesigMastr where delFlg = 'Y' and desigCd=?",[params.desigCd])
            desigInstance.delFlg='Y'    
            flash.message="Deleted"
        }  
        else{
            if (!desigInstance.validate()) {
                if(GenDesigMastr.findByDesigCd(params.desigCd)) flash.message= "Designation Code should be Unique!"
                println ("::"+desigInstance.errors)
                respond desigInstance.errors, view:'create'
                return
            }

            flash.message="Saved"
        }
        desigInstance.updtdBy=request.getCookie('htl_Pchrt_sd').toInteger();
        desigInstance.updtdDate= new Date()
        desigInstance.save flush:true
        redirect action:'index'
    }    
}
