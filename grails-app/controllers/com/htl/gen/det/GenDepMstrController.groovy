package com.htl.gen.det
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.converters.JSON



@Transactional(readOnly = true)
class GenDepMstrController {
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]


    def create() { }
    def index()  { }
    
    @Transactional
    def save(GenDepMstr depInstance){
        depInstance.delFlg='N'
        depInstance.statsFlg='A'
        depInstance.cretnBy = request.getCookie('htl_Pchrt_sd').toInteger();
        //depInstance.cretnBy=1      
        depInstance.cretnDate= new Date()

        if (!depInstance.validate()) {
            if(GenDepMstr.findByDepCd(params.depCd)) flash.message= "Department Code should be Unique!"            
            //flash.message=depInstance.errors
            println ("::"+depInstance.errors)
            respond depInstance.errors, view:'create'
            return
        }
        
        depInstance.save flush:true  
        flash.message="Saved"
        redirect action:'index'
    }
    
    
    def GetList(){
 
        def varr=GenDepMstr.createCriteria().list() {                    
            if(params.depCd!="" && params.depCd!=null) 
            {ilike("depCd","${params.depCd}%")  }
            if(params.depName!="" && params.depName!=null) 
            ilike("depName","${params.depName}%")
            ne("delFlg","Y")
            order("id", "desc")
        }

        def res = varr.collect{
            [    
                id:it.id,
                depCd:it.depCd,
                depName:it.depName,                                
            ]
        }
        def jsonData=[row:res]
        render jsonData as JSON
    }
    
    
    def edit(GenDepMstr depInstance){         
        respond depInstance
    }
   
    @Transactional
    def update(GenDepMstr depInstance){        
        if(params.del)
        {
            GenDepMstr.executeUpdate("delete GenDepMstr where delFlg = 'Y' and depCd=?",[params.depCd])
            depInstance.delFlg='Y'     
            flash.message="Deleted"
        }  
        else{
            if (!depInstance.validate()) {
                if(GenDepMstr.findByDepCd(params.depCd)) flash.message= "Department Code should be Unique!"            
                println ("::"+depInstance.errors)
                respond depInstance.errors, view:'create'
                return
            }          
            flash.message="Updated"
        }
        depInstance.updtdBy=request.getCookie('htl_Pchrt_sd').toInteger();
        depInstance.updtdDate= new Date()
        depInstance.save flush:true
        redirect action:'index'
    }
        
}
