package com.htl.pro.det
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.converters.JSON
import java.text.SimpleDateFormat
import java.text.DateFormat


@Transactional(readOnly = true)
class ProBudgetMastrController {
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() { }
    def create()  { }
     
    @Transactional
    def save(ProBudgetMastr budgetMastrInstance){       
        budgetMastrInstance.delFlg='N'
        budgetMastrInstance.statsFlg='A'
        budgetMastrInstance.cretnBy = request.getCookie('htl_Pchrt_sd').toInteger();
        budgetMastrInstance.cretnDate= new Date()
        DateFormat df = new SimpleDateFormat("dd-mm-yyyy")
        budgetMastrInstance.strtDt = df.parse(params.get("strtDtStr"));
        budgetMastrInstance.endDt = df.parse(params.get("endDtStr"));                 
        budgetMastrInstance.save flush:true  
        flash.message="Saved"
        redirect action:'index'
    }
    
    
    def GetList()
    {
        println params
        DateFormat df = new SimpleDateFormat("dd-mm-yyyy")
        def varr=ProBudgetMastr.createCriteria().list() {                    
            if(params.bdgtName!="" && params.bdgtName!=null) 
            {ilike("bdgtName","${params.bdgtName}%")  }
            if(params.bdgtAmt!="" && params.bdgtAmt!=null) 
            {eq("bdgtAmt", Double.parseDouble("${params.bdgtAmt}"))  }
            if(params.strtDtStr!="" && params.strtDtStr!=null) 
            eq("strtDt",df.parse(params.get("strtDtStr")))
            if(params.endDtStr!="" && params.endDtStr!=null) 
            eq("endDt",df.parse(params.get("endDtStr")))
            if(params.projId!="" && params.projId!=null) {proj{
                    ilike("projName","${params.projId}%")
                }}
            ne("delFlg","Y")
            order("id", "desc")
        }
                            
        def strProj="" 
               
 
           
        def res = varr.collect{
            it.strtDtStr = df.format(it.strtDt)
            it.endDtStr = df.format(it.endDt) 
            if(it.projId!=null)
            {
                def obj=ProProjectMastr.get(it.projId)
                strProj=obj.projName
            }            
            
            [                    
                id:it.id,
                bdgtName:it.bdgtName,   
                bdgtAmt:it.bdgtAmt,
                strtDtStr:it.strtDtStr,                    
                endDtStr:it.endDtStr,                    
                projId:strProj,     
            ]
        }
        def jsonData=[row:res]
        render jsonData as JSON
    }
    
        
    def edit(ProBudgetMastr budgetMastrInstance){   
        DateFormat df = new SimpleDateFormat("dd-mm-yyyy")
 
        budgetMastrInstance.strtDtStr = df.format(budgetMastrInstance.strtDt)
        budgetMastrInstance.endDtStr = df.format(budgetMastrInstance.endDt)    

        respond budgetMastrInstance
    }
    
    
    @Transactional
    def update(ProBudgetMastr budgetMastrInstance)
    {       
        if(params.del)
        {
            budgetMastrInstance.delFlg='Y'  
            flash.message="Deleted"
        }

        else{

            DateFormat df = new SimpleDateFormat("dd/mm/yyyy")
            budgetMastrInstance.strtDt = df.parse(params.get("strtDtStr"));
            budgetMastrInstance.endDt = df.parse(params.get("endDtStr"));
            flash.message="Updated"
        } 

        budgetMastrInstance.updtdBy=request.getCookie('htl_Pchrt_sd').toInteger();
        budgetMastrInstance.updtdDate= new Date()
        budgetMastrInstance.save flush:true        
        redirect action:'index'
    }
  
    
}

