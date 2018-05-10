package com.htl.pro.det
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.converters.JSON
import java.text.SimpleDateFormat
import java.text.DateFormat
import java.text.DecimalFormat;


@Transactional(readOnly = true)
class ProProgSettingMastrController {
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def index() { }
    def create() {}

    def check(){
        def er="noError"

        def dayId=new Long[params.dayNameId.size()-1]
        for(def i=0;i<params.dayNameId.size()-1;i++)
        dayId[i]=Long.parseLong(params.dayNameId[i])
        println dayId
        def stngId=ProProgSettingDayDtls.createCriteria().list() {    
            projections {
                property('progStng.id')
            }
               'in'("progDay.id",dayId)
             if(params.progStngId!=""){
                 ne('progStng.id',params.progStngId.toLong())
             }
            
        }
        println stngId
        if(stngId==[]) {
            render er
            return
        }
        def times=ProProgSettingDtls.createCriteria().list() {    
            projections {
                property('strtDt')
                property('endDt')
            }
               'in'("progStng.id",stngId)
                ne("delFlg","Y")
        }
        println times
        for (def i=0;i<times.size();i++)
        {
            SimpleDateFormat df = new SimpleDateFormat("HH:mm:ss.S");
            def D1 = df.format(times[i][0]);
            def D2 = df.format(times[i][1]);
            for(def j=1;j<=(params.rowNo).toInteger()+1;j++)
            {
                def d1=Date.parse("HH:mm", params.strtTim[j])
                def d2=Date.parse("HH:mm", params.endTim[j])
                d1=df.format(d1)
                d2=df.format(d2)
                println d1
                println d2
                if(D1>d1&&D1<d2||D2>d1&&D2<d2  ||  d1>D1&&d1<D2||d2>D1&&d2<D2 || d1==D1&&d2==D2){
                    println "Already" 
                    render j-1
                    return
                }
            }
            println D1
            println D2
        }
            
        render er
        return
    }
    
    
    @Transactional
    def save()   {
        println params
        def progSettingMastrInstance=new ProProgSettingMastr()
        def ob=ProProgSettingMastr.find("from ProProgSettingMastr order by id desc") // To check table empty or not
        println ob
        DecimalFormat f = new DecimalFormat("000000");
        if(ob) progSettingMastrInstance.refNo="ref"+(f.format(Integer.parseInt(ob.refNo.substring(3))+1))            
        else   progSettingMastrInstance.refNo="ref000001"
              
        progSettingMastrInstance.delFlg='N'
        progSettingMastrInstance.statsFlg='A'
        progSettingMastrInstance.cretnBy = request.getCookie('htl_Pchrt_sd').toInteger();
        progSettingMastrInstance.cretnDate = new Date()
        progSettingMastrInstance.save flush:true                 
                
        for(def i=1;i<params.dayNameId.size();i++)
        {
            println params.dayNameId[i]
            def proProgSettingDayDtlsInstance=new ProProgSettingDayDtls()
            proProgSettingDayDtlsInstance.progStng=progSettingMastrInstance 
            proProgSettingDayDtlsInstance.delFlg='N'
            proProgSettingDayDtlsInstance.statsFlg='A'
            proProgSettingDayDtlsInstance.cretnBy = request.getCookie('htl_Pchrt_sd').toInteger();
            proProgSettingDayDtlsInstance.cretnDate = new Date()
            proProgSettingDayDtlsInstance.progDay=ProProgDaySetngMatr.get(params.dayNameId[i])
            proProgSettingDayDtlsInstance.save flush:true  
        }

        for(def i=1;i<=(params.rowNo).toInteger()+1;i++)
        {
            println params.progNameId[i]
            def proProgSettingDtlsInstance=new ProProgSettingDtls()
            proProgSettingDtlsInstance.delFlg='N'
            proProgSettingDtlsInstance.statsFlg='A'
            proProgSettingDtlsInstance.cretnBy = request.getCookie('htl_Pchrt_sd').toInteger();
            proProgSettingDtlsInstance.cretnDate = new Date()
            proProgSettingDtlsInstance.progStng=progSettingMastrInstance
            proProgSettingDtlsInstance.prog=ProProgMastr.get(params.progNameId[i])
            proProgSettingDtlsInstance.strtDt=Date.parse("hh:mm",params.strtTim[i])
            proProgSettingDtlsInstance.endDt=Date.parse("hh:mm", params.endTim[i])
            proProgSettingDtlsInstance.save flush:true
        }
        
        flash.message="Saved"
        redirect action:'index'
    }
    
    
    
    def edit(ProProgSettingMastr progSettingMastrInstance){
        List<Long> day = new ArrayList<Long>();
        
        day=ProProgSettingDayDtls.createCriteria().list() {    
            projections {
                property('progDay.id')
            }
            eq("progStng.id",progSettingMastrInstance.id)
        }
        def rows=ProProgSettingDtls.createCriteria().list() {    
            projections {
                property('prog.id')
                property('strtDt')
                property('endDt')
            }
            eq("progStng.id",progSettingMastrInstance.id)
        }
        
        SimpleDateFormat df = new SimpleDateFormat("HH:mm");
        for(def i=0;i<rows.size();i++){
            rows[i][1]=df.format(rows[i][1])
            rows[i][2]=df.format(rows[i][2])
        }

        respond progSettingMastrInstance,model:[progSettingMastrInstance:progSettingMastrInstance]
        respond day,model:[day:day]
        respond rows,model:[rows:rows]
    }
    
    
    @Transactional
    def update(ProProgSettingMastr progSettingMastrInstance){                
        println params
        println progSettingMastrInstance
        if(params.del)
        {
            flash.message="Deleted...!"
            ProProgSettingDtls.executeUpdate("delete ProProgSettingDtls where progStng=?",[progSettingMastrInstance])            
            ProProgSettingDayDtls.executeUpdate("delete ProProgSettingDayDtls where progStng=?",[progSettingMastrInstance]) 
            progSettingMastrInstance.delFlg='Y' 
        }
        else{
        
            ProProgSettingDtls.executeUpdate("delete ProProgSettingDtls where progStng=?",[progSettingMastrInstance])            
            ProProgSettingDayDtls.executeUpdate("delete ProProgSettingDayDtls where progStng=?",[progSettingMastrInstance]) 
        
            for(def i=1;i<params.dayNameId.size();i++)
            {
                println params.dayNameId[i]
                def proProgSettingDayDtlsInstance=new ProProgSettingDayDtls()
                proProgSettingDayDtlsInstance.progStng=progSettingMastrInstance 
                proProgSettingDayDtlsInstance.delFlg='N'
                proProgSettingDayDtlsInstance.statsFlg='A'
                proProgSettingDayDtlsInstance.cretnBy = request.getCookie('htl_Pchrt_sd').toInteger();
                proProgSettingDayDtlsInstance.cretnDate = new Date()
                proProgSettingDayDtlsInstance.progDay=ProProgDaySetngMatr.get(params.dayNameId[i])
                proProgSettingDayDtlsInstance.save flush:true  
            }

            for(def i=1;i<=(params.rowNo).toInteger()+1;i++)
            {
                println params.progNameId[i]
                def proProgSettingDtlsInstance=new ProProgSettingDtls()
                proProgSettingDtlsInstance.delFlg='N'
                proProgSettingDtlsInstance.statsFlg='A'
                proProgSettingDtlsInstance.cretnBy = request.getCookie('htl_Pchrt_sd').toInteger();
                proProgSettingDtlsInstance.cretnDate = new Date()
                proProgSettingDtlsInstance.progStng=progSettingMastrInstance
                proProgSettingDtlsInstance.prog=ProProgMastr.get(params.progNameId[i])
                proProgSettingDtlsInstance.strtDt=Date.parse("hh:mm",params.strtTim[i])
                proProgSettingDtlsInstance.endDt=Date.parse("hh:mm", params.endTim[i])
                proProgSettingDtlsInstance.save flush:true
            }
        }
        progSettingMastrInstance.updtdBy=request.getCookie('htl_Pchrt_sd').toInteger();
        progSettingMastrInstance.updtdDate= new Date()
        progSettingMastrInstance.save flush:true
        redirect action:'index'
    }
    
    
    
    @Transactional
    def saveProg(ProProgMastr proProgMastrInstance){                  
        if(params.flg=="Del"){
            proProgMastrInstance=ProProgMastr.findById(params.Id)
            proProgMastrInstance.delFlg='Y'           
            flash.message="Deleted"
            proProgMastrInstance.save flush:true 
            render flash.message
            return
        }


        if(params.flg=="updt")
        {
            proProgMastrInstance=ProProgMastr.findById(params.Id)
            proProgMastrInstance.progName=params.progName
            proProgMastrInstance.progDesc=params.progDesc
            proProgMastrInstance.updtdBy=request.getCookie('htl_Pchrt_sd').toInteger();
            proProgMastrInstance.updtdDate= new Date()                        
            flash.message="Updated"

        }
        else{
            if(ProProgMastr.findByProgNameAndDelFlg(params.progName,'N')) {                
                flash.message= "err"            
                render flash.message
                return
            }
            proProgMastrInstance.progName=params.progName
            proProgMastrInstance.progDesc=params.progDesc
            proProgMastrInstance.delFlg='N'
            proProgMastrInstance.statsFlg='A'
            proProgMastrInstance.cretnBy = request.getCookie('htl_Pchrt_sd').toInteger();
            proProgMastrInstance.cretnDate= new Date()
            println proProgMastrInstance
            flash.message="Saved"
        }
        proProgMastrInstance.save flush:true 
        render flash.message
    }
    
    
    
    def getData(){        
        if(params.getDescId){
            def ob=ProProgMastr.findById(params.getDescId)
            def OB=ob.collect{
                [                                        
                    progName:it.progName,
                    progDesc:it.progDesc                      
                ]
            }            
            render OB as JSON
            return
        }
        def varr=ProProgMastr.createCriteria().list() {                    
            ne("delFlg","Y")
        }

        def res = varr.collect{            
            [                    
                id:it.id,
                progName:it.progName,                
                      
            ]
        }
        def jsonData=[row:res]
        render jsonData as JSON
    }


    def GetList()
    {
        
        def varr=ProProgSettingMastr.createCriteria().list() {                    
            if(params.refNo!="" && params.refNo!=null) 
            {ilike("refNo","${params.refNo}%")  }
            ne("delFlg","Y")
            order("id", "desc")
        }

        def res = varr.collect{      
            
            [                    
                id:it.id,
                refNo:it.refNo  
            ]
        }
        def jsonData=[row:res]
        render jsonData as JSON
    }



}
