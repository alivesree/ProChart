package com.htl.pro.det
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.converters.JSON
import java.text.SimpleDateFormat
import java.text.DateFormat

@Transactional(readOnly = true)
class ProProjectMastrController {
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
        
    DateFormat df = new SimpleDateFormat("dd-mm-yyyy")

    def index() { }
    def create()  { }
     
    @Transactional
    def save(ProProjectMastr projectMastrInstance){       
        projectMastrInstance.delFlg='N'
        projectMastrInstance.statsFlg='A'
        projectMastrInstance.cretnBy = request.getCookie('htl_Pchrt_sd').toInteger();             
        projectMastrInstance.cretnDate= new Date()
        projectMastrInstance.strtDt = df.parse(params.get("strtDtStr"));
        projectMastrInstance.endDt = df.parse(params.get("endDtStr"));      
        projectMastrInstance.save flush:true  
        flash.message="Saved"
        redirect action:'index'
    }
    
    
    def GetList()
    {
        def varr=ProProjectMastr.createCriteria().list() {                    
            if(params.projName!="" && params.projName!=null) 
            {ilike("projName","${params.projName}%")  }
            if(params.strtDtStr!="" && params.strtDtStr!=null) 
            eq("strtDt",df.parse(params.get("strtDtStr")))
            if(params.endDtStr!="" && params.endDtStr!=null) 
            eq("endDt",df.parse(params.get("endDtStr")))
            if(params.catgId!="" && params.catgId!=null) {catg{
                    ilike("catgName","${params.catgId}%")
                }}
            ne("delFlg","Y")
            order("id", "desc")
        }
                            
        def strCatg="" 

        def res = varr.collect{
            it.strtDtStr = df.format(it.strtDt)
            it.endDtStr = df.format(it.endDt) 
            if(it.catgId!=null)
            {
                def obj=ProProjCatagMastr.get(it.catgId)
                strCatg=obj.catgName
            }            
            
            [                    
                id:it.id,
                projName:it.projName,     
                strtDtStr:it.strtDtStr,                    
                endDtStr:it.endDtStr,                    
                catgId:strCatg,     
            ]
        }
        def jsonData=[row:res]
        render jsonData as JSON
    }
    
        
    def edit(ProProjectMastr projectMastrInstance){           

        projectMastrInstance.strtDtStr = df.format(projectMastrInstance.strtDt)
        projectMastrInstance.endDtStr = df.format(projectMastrInstance.endDt)    

        respond projectMastrInstance
    }
    
    
    @Transactional
    def update(ProProjectMastr proProjectMastrInstance)
    {      
        if(params.del)
        {
            proProjectMastrInstance.delFlg='Y'     
        }

        else{
            proProjectMastrInstance.strtDt = df.parse(params.get("strtDtStr"));
            proProjectMastrInstance.endDt = df.parse(params.get("endDtStr"));
            flash.message="Updated"
        } 
       
        proProjectMastrInstance.updtdBy=request.getCookie('htl_Pchrt_sd').toInteger();
        proProjectMastrInstance.updtdDate= new Date()
        proProjectMastrInstance.save flush:true
        redirect action:'index'
    }
  
    
}
