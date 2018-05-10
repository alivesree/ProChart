package com.htl.pro.det
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.converters.JSON
import java.text.SimpleDateFormat
import java.text.DateFormat


@Transactional(readOnly = true)
class ProSpecialProgMastrController {
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    DateFormat df = new SimpleDateFormat("dd-MM-yyyy HH:mm")

    def index() { }
    def create()  { }
    def check(){
        println params
        def strtDt = df.parse(params.get("strtDtStr"));
        def endDt = df.parse(params.get("endDtStr"));
        def d1=df.format(strtDt)
        def d2=df.format(endDt)
        def times=ProSpecialProgMastr.createCriteria().list() {    
            projections {
                property('strtDt')
                property('endDt')
            }
            ne("delFlg","Y")
            if(params.id!=""){
                ne('id',params.id.toLong())
            }
        }
        println times
        if(!times){
            render "noError"
            return
        }
        for (def i=0;i<times.size();i++)
        {
            def D1 = df.format(times[i][0]);
            def D2 = df.format(times[i][1]);
            println D1
            println D2
            if(D1>d1&&D1<d2||D2>d1&&D2<d2  ||  d1>D1&&d1<D2||d2>D1&&d2<D2 || d1==D1&&d2==D2){
                println "Already" 
                render  "error"
                return
            }
        }
        render "noError"
    }
    @Transactional
    def save(){   
        def proSpecialProgMastrInstance=new ProSpecialProgMastr(params)
        proSpecialProgMastrInstance.strtDt = df.parse(params.get("strtDtStr"));
        proSpecialProgMastrInstance.endDt = df.parse(params.get("endDtStr"));
        proSpecialProgMastrInstance.delFlg='N'
        proSpecialProgMastrInstance.statsFlg='A'
        proSpecialProgMastrInstance.cretnBy = request.getCookie('htl_Pchrt_sd').toInteger();
        proSpecialProgMastrInstance.cretnDate= new Date()
        proSpecialProgMastrInstance.save flush:true  
        flash.message="Saved"
        redirect action:'index'
    }
    
    
    def GetList()
    {
        def varr=ProSpecialProgMastr.createCriteria().list() {                    
            if(params.spclName!="" && params.spclName!=null) 
            {ilike("spclName","${params.spclName}%")  }
            if(params.timAlloted!="" && params.timAlloted!=null) 
            {eq("timAlloted", ("${params.timAlloted}").toInteger())  }
            if(params.strtDtStr!="" && params.strtDtStr!=null) 
            eq("strtDt",  df.parse(params.get("strtDtStr")))
            if(params.endDtStr!="" && params.endDtStr!=null) 
            eq("endDt", df.parse(params.get("endDtStr")))
            
            ne("delFlg","Y")
            order("id", "desc")
        }

        def res = varr.collect{
            it.strtDtStr = df.format(it.strtDt)
            it.endDtStr = df.format(it.endDt)         
            
            [                    
                id:it.id,
                spclName:it.spclName,   
                timAlloted:it.timAlloted,
                strtDtStr:it.strtDtStr,                    
                endDtStr:it.endDtStr,                    
            ]
        }
        def jsonData=[row:res]
        render jsonData as JSON
    }
    
        
    def edit(ProSpecialProgMastr proSpecialProgMastrInstance){   
        DateFormat df = new SimpleDateFormat("dd-MM-yyyy HH:mm")
 
        proSpecialProgMastrInstance.strtDtStr = df.format(proSpecialProgMastrInstance.strtDt)
        proSpecialProgMastrInstance.endDtStr = df.format(proSpecialProgMastrInstance.endDt)    

        respond proSpecialProgMastrInstance
    }
    
    
    @Transactional
    def update(ProSpecialProgMastr proSpecialProgMastrInstance)
    {       
        if(params.del)
        {
            proSpecialProgMastrInstance.delFlg='Y'  
            flash.message="Deleted"
        }

        else{
            DateFormat df = new SimpleDateFormat("dd-MM-yyyy HH:mm")
            proSpecialProgMastrInstance.strtDt = df.parse(params.get("strtDtStr"));
            proSpecialProgMastrInstance.endDt = df.parse(params.get("endDtStr"));
            flash.message="Updated"
        } 
 
        proSpecialProgMastrInstance.updtdBy=request.getCookie('htl_Pchrt_sd').toInteger();
        proSpecialProgMastrInstance.updtdDate= new Date()
        proSpecialProgMastrInstance.save flush:true        
        redirect action:'index'
    }
}