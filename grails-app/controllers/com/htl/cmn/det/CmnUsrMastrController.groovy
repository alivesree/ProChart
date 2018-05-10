package com.htl.cmn.det
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import hashencode.HashEncode
import com.htl.cmn.crypto.*

@Transactional(readOnly = true)
class CmnUsrMastrController {

 

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    
    def login(){
        
        if(request.getCookie('htl_Pchrt_sd')!=null){
            flash.message=null           
            redirect action:'dash'
        }

    } 
    
        def authenticate()
        {
            def obj=new HashEncode()
           // println   obj.md5Java(params.password)
            def user=CmnUsrMastr.findByUsrCdAndUsrPaswrd(params.userName, obj.md5Java(params.password))       
            if(user)
            {
                session.user=user
                def ob=new CookieController()
                ob.userGeneralCookie(user)
                
                redirect action:'dash'
            }
            else
            {
                flash.message="Invalid Username or password"
                redirect action:'login'
            }
        }
    
        def logout()
        {      
            def ob=new CookieController()                     
            flash.message="GoodBye, ${request.getCookie('htl_rn')}"    
            ob.deleteAllCookie() 
            session.user=null
            redirect(action:"login")      
        }  

        def dash(){
            validity()                   
        }
    

    
        def validity(){
            if (request.getCookie('htl_Pchrt_sd')==null)
            {
                flash.message = "Please Login"
                redirect action:'login'       
            }
 
        }
    
    
}
