package com.htl.pro.det
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ProProjCatagMastrController {
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() { }
    @Transactional
    def save(ProProjCatagMastr CatagMastrInstance){       
        //CatagMastrInstance.CatgName=params.CatgName
        CatagMastrInstance.delFlg='N'
        CatagMastrInstance.statsFlg='A'
        CatagMastrInstance.cretnBy = request.getCookie('htl_Pchrt_sd').toInteger();
        //CatagMastrInstance.cretnBy=1      
        CatagMastrInstance.cretnDate= new Date()

            if(ProProjCatagMastr.findByCatgName(params.catgName)) {                
                flash.message= "Category Name should be Unique!"            
                render flash.message
        }
        else{
        CatagMastrInstance.save flush:true 
        flash.message="Saved"
        render flash.message
        }
    }
    
}
