package com.htl.pro.det
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.converters.JSON
import java.text.SimpleDateFormat
import java.text.DateFormat
import groovy.sql.Sql


class ReportController {

    def index() { }       
    def getList(){
        DateFormat df = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss") 
        def st=df.parse(params.start+ " 00:00:00");
        def et=df.parse(params.end+ " 23:59:00");
        df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss") 
        st=df.format(st)
        et=df.format(et)
        def qry="""select prog_day_dt,prog_day_id from pro_prog_day_setng_dtls
                    where prog_day_dt >= '$st' AND prog_day_dt<='$et' AND del_flg='N'""" 
        def spcl="""select strt_dt,end_dt,spcl_name from pro_special_prog_mastr
                    where strt_dt >= '$st' AND strt_dt<='$et' AND del_flg='N'""" 
        def varr=[]
        ProProgDaySetngDtls.withSession
        {  session ->
            def lst=session.createSQLQuery(qry);
            varr=lst.list();
        } 
        def Spcl=[]
        ProSpecialProgMastr.withSession
        {  session ->
            def lst=session.createSQLQuery(spcl);
            Spcl=lst.list();
        } 
        println Spcl
        //println varr.size();
        def lst=[]
        for(def i=0;i<varr.size();i++)
        {            
            def lstQry="""select strt_dt,end_dt,prog_name from pro_prog_setting_dtls 
                        INNER JOIN pro_prog_mastr ON pro_prog_setting_dtls.prog_id=pro_prog_mastr.prog_id
                        where prog_stng_id=(select prog_stng_id from pro_prog_setting_day_dtls where prog_day_id=${varr[i][1]} AND del_flg='N')
                        AND pro_prog_setting_dtls.del_flg='N'""" 
             //println lstQry
            ProProgSettingDtls.withSession
            {  session ->
                def Lst=session.createSQLQuery(lstQry);
                lst[i]=Lst.list();
            } 
            lst[i]+=varr[i][0]
            //println lst[i]
        }
        //println lst
       
        
        DateFormat tf = new SimpleDateFormat("HH:mm") 
        df = new SimpleDateFormat("dd-MM-yyyy") 
        def res=[]
        lst.collect{  
            for(def i=0;i<it.size()-1;i++)
            {
                def strt=   df.format(it[it.size()-1]) +" " + tf.format(it[i][0])
                def end=   df.format(it[it.size()-1]) +" " + tf.format(it[i][1])
                //println strt
                //println end
                res.add( [                    
                        dates:df.format(it[it.size()-1]),   
                        from:tf.format(it[i][0]),
                        to:tf.format(it[i][1]),                    
                        program:it[i][2],                    
                    ])
                if(Spcl){
                    println Spcl
                    
                    //                for(def j=0;j<Spcl.size();j++)
//                {
//                    def SPstrt=   df.format(Spcl[j][0]) +" " + tf.format(Spcl[j][0])
//                    def SPend=   df.format(Spcl[j][01]) +" " + tf.format(Spcl[j][1])
//                    println "    "+SPstrt
//                    println "    "+SPend
//                    if(strt>SPstrt&&strt<SPend||end>SPstrt&&end<SPend)   //to find special program present
//                    res.add( [                    
//                            dates:df.format(Spcl[j][0]),   
//                            from:tf.format(Spcl[j][0]),
//                            to:tf.format(Spcl[j][1]),                    
//                            program:Spcl[j][2],                    
//                        ])
//                    else{                        
//                        res.add( [                    
//                                dates:df.format(it[it.size()-1]),   
//                                from:tf.format(it[i][0]),
//                                to:tf.format(it[i][1]),                    
//                                program:it[i][2],                    
//                            ])
//                    }
//                }
                    
                    
                }

                
                
                

                //println res
            }
            
        }
        // println res
        def jsonData=[row:res]
        render jsonData as JSON
        
        
    }
}
