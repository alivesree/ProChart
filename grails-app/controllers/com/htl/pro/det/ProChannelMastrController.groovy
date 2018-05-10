package com.htl.pro.det
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.converters.JSON
import java.text.SimpleDateFormat
import java.text.DateFormat



@Transactional(readOnly = true)
class ProChannelMastrController {
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    DateFormat df = new SimpleDateFormat("dd-mm-yyyy")
    def index() { }
    def create()  { }
     
    @Transactional
    def save(ProChannelMastr channelMastrInstance){       
        channelMastrInstance.delFlg='N'
        channelMastrInstance.statsFlg='A'
        channelMastrInstance.cretnBy = request.getCookie('htl_Pchrt_sd').toInteger();
        channelMastrInstance.cretnDate= new Date()
        channelMastrInstance.strtDt = df.parse(params.get("strtDtStr"));
        channelMastrInstance.endDt = df.parse(params.get("endDtStr"));
        channelMastrInstance.save flush:true  
        flash.message="Saved"
        redirect action:'index'
    }
    
    
    def GetList()
    {
        def varr=ProChannelMastr.createCriteria().list() {                    
            if(params.chnlName!="" && params.chnlName!=null) 
            {ilike("chnlName","${params.chnlName}%")  }
            if(params.strtDtStr!="" && params.strtDtStr!=null) 
            eq("strtDt",df.parse(params.get("strtDtStr")))
            if(params.endDtStr!="" && params.endDtStr!=null) 
            eq("endDt",df.parse(params.get("endDtStr")))
            ne("delFlg","Y")
            order("id", "desc")
        }
       
        def res = varr.collect{
            it.strtDtStr = df.format(it.strtDt)
            it.endDtStr = df.format(it.endDt)        
            
            [                    
                id:it.id,
                chnlName:it.chnlName,     
                strtDtStr:it.strtDtStr,                    
                endDtStr:it.endDtStr,                      
            ]
        }
        def jsonData=[row:res]
        render jsonData as JSON
    }
    
        
    def edit(ProChannelMastr channelMastrInstance){           
  
        channelMastrInstance.strtDtStr = df.format(channelMastrInstance.strtDt)
        channelMastrInstance.endDtStr = df.format(channelMastrInstance.endDt)    

        respond channelMastrInstance
    }
    
    
    @Transactional
    def update(ProChannelMastr channelMastrInstance)
    {              
        if(params.del)
        {
            flash.message="Deleted"
            channelMastrInstance.delFlg='Y'     
        }

        else{
            channelMastrInstance.strtDt = df.parse(params.get("strtDtStr"));
            channelMastrInstance.endDt = df.parse(params.get("endDtStr"));
            flash.message="Updated"
        } 
        
        channelMastrInstance.updtdBy=request.getCookie('htl_Pchrt_sd').toInteger();
        channelMastrInstance.updtdDate= new Date()
        channelMastrInstance.save flush:true        
        redirect action:'index'
    }
  
    
}
