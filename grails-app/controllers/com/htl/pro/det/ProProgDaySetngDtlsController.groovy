package com.htl.pro.det
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.converters.JSON
import java.text.SimpleDateFormat
import java.text.DateFormat

@Transactional(readOnly = true)
class ProProgDaySetngDtlsController {
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def index() { }
    def create() {}

    @Transactional
    def save(ProProgDaySetngDtls ProgDaySetngDtlsInstance){         
        ProProgDaySetngMatr mastrInstance=new  ProProgDaySetngMatr()
        mastrInstance.statsFlg = 'A';
        mastrInstance.delFlg = 'N';
        mastrInstance.cretnBy = request.getCookie('htl_Pchrt_sd').toInteger();            
        mastrInstance.cretnDate = new Date();
        mastrInstance.strtDt=new  SimpleDateFormat("MM-dd-yyyy").parse(params.strtDtStr+ " 00:00");  
        mastrInstance.endDt=new  SimpleDateFormat("MM-dd-yyyy").parse(params.endDtStr+ " 00:00"); 
        mastrInstance.dayName=params.dayName               
        if(mastrInstance.save(flush:true)){            
            ProgDaySetngDtlsInstance.progDay=mastrInstance
        }
        ProgDaySetngDtlsInstance.progDayDt=new  SimpleDateFormat("MM-dd-yyyy").parse(params.strtDtStr+ " 00:00");  
        ProgDaySetngDtlsInstance.delFlg='N'
        ProgDaySetngDtlsInstance.statsFlg='A'
        ProgDaySetngDtlsInstance.cretnBy = request.getCookie('htl_Pchrt_sd').toInteger();              
        ProgDaySetngDtlsInstance.cretnDate= new Date()        

        
        def flag=0
        if(params.RptChk) flag=1
        
        while(ProgDaySetngDtlsInstance.progDayDt<=mastrInstance.endDt){  
            ProProgDaySetngDtls ob=new  ProProgDaySetngDtls()
            ob.delFlg='N'
            ob.statsFlg='A'
            ob.cretnBy=request.getCookie('htl_Pchrt_sd').toInteger(); 
            ob.cretnDate=new Date()
            ob.remark=ProgDaySetngDtlsInstance.remark
            ob.progDay=mastrInstance
            ob.progDayDt=ProgDaySetngDtlsInstance.progDayDt

            ob.save flush:true
            if(flag==0) break;
            ProgDaySetngDtlsInstance.progDayDt+=7         
        }
        
        flash.message="Saved"
        redirect action:'index'
    }
    
    
    def GetList()
    {
        

        def varr=ProProgDaySetngMatr.createCriteria().list() {                    
            if(params.dayName!="" && params.dayName!=null) 
            {ilike("dayName","${params.dayName}%")  }
            ne("delFlg","Y")
            order("id", "desc")
        }

        def res = varr.collect{            
            [                    
                id:it.id,
                dayName:it.dayName     
                      
            ]
        }
        def jsonData=[row:res]
        render jsonData as JSON
    }
    
    def edit(ProProgDaySetngMatr proProgDaySetngMatrInstance){   
        def lstQry="""SELECT distinct remark from pro_prog_day_setng_dtls where prog_day_id= "${proProgDaySetngMatrInstance.id}"  """              
        def lst
        ProProgDaySetngDtls.withSession
        {  session ->
            def query=session.createSQLQuery(lstQry)
            lst=query.list();            
        }         
        proProgDaySetngMatrInstance.remarkStr=lst[0]
        DateFormat df = new SimpleDateFormat("MM-dd-yyyy")
        proProgDaySetngMatrInstance.strtDtStr = df.format(proProgDaySetngMatrInstance.strtDt)
        proProgDaySetngMatrInstance.endDtStr = df.format(proProgDaySetngMatrInstance.endDt)    
        respond proProgDaySetngMatrInstance
    }
    
    @Transactional
    def update(ProProgDaySetngMatr proProgDaySetngMatrInstance)
    {   
        if(params.del)
        {
            flash.message="Deleted...!"
            ProProgDaySetngDtls.executeUpdate("update ProProgDaySetngDtls set delFlg='Y' where progDay=?",[proProgDaySetngMatrInstance])
            proProgDaySetngMatrInstance.delFlg='Y' 
        }
        else{
            def progDayDt=new  SimpleDateFormat("MM-dd-yyyy").parse(params.strtDtStr+ " 00:00");         
            proProgDaySetngMatrInstance.strtDt=progDayDt
            proProgDaySetngMatrInstance.endDt=new  SimpleDateFormat("MM-dd-yyyy").parse(params.endDtStr+ " 00:00");       
            ProProgDaySetngDtls.executeUpdate("delete ProProgDaySetngDtls where progDay=?",[proProgDaySetngMatrInstance])            
            def flag=0
            if(params.RptChk) flag=1
            while(progDayDt<=proProgDaySetngMatrInstance.endDt){                  
                ProProgDaySetngDtls ob=new  ProProgDaySetngDtls()
                ob.delFlg='N'
                ob.statsFlg='A'
                ob.cretnBy=request.getCookie('htl_Pchrt_sd').toInteger(); 
                ob.cretnDate=new Date()
                ob.remark=params.remark
                ob.progDay=proProgDaySetngMatrInstance
                ob.progDayDt=progDayDt
                if (!ob.validate()) {
                    println ("::"+ob.errors)
                    respond proProgDaySetngMatrInstance.errors, view:'create'
                    return
                }
                ob.save flush:true
                if(flag==0) break;
                progDayDt+=7         
            }
            flash.message="Updated"
        }
        proProgDaySetngMatrInstance.updtdBy=request.getCookie('htl_Pchrt_sd').toInteger();
        proProgDaySetngMatrInstance.updtdDate= new Date()
        proProgDaySetngMatrInstance.save flush:true
        redirect action:'index'
    
        
    }
    def check(){
        def er="noError"
            if(params.id){  //If ID exisits the action is update, To avoid same name error
            if(ProProgDaySetngMatr.findByDayNameAndIdNotEqual(params.dayName,params.id.toLong())) er="err"
            }
            else if(ProProgDaySetngMatr.findByDayName(params.dayName)) er="err"            
            
            render er
            return
    }
}
