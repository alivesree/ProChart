package com.htl.cmn.det

import javax.servlet.http.Cookie
import com.htl.hr.det.*
import com.htl.gen.det.*

import grails.converters.JSON

class CookieController {
    /**
     *  htl_Pchrt_sd = user Id
     *  htl_rn = user Name
     *  htl_md = menu id
     *
     *
     *  htl_ef = create flag
     *  htl_tf = edit flag
     *  htl_def = delete flag
     *  htl_wf = view flag
     *  htl_vf = approve flag*  
     *  htl_adld = additional data
     *  htl_li  =   employee Id
     *  htl_ld  =   employee designtn
     *  xc47dcwl = finance secret key (''=='N'  jr4n_5=='Y' )
     *  xzw34e_d=loading 'Finance' string
     ***/

    def tim=12 * 60 * 60    
    def index() { }
    
    /**
     *deleteAllCookie() function for delete all cookies. This mainly use when user logout
     ***/
    def deleteAllCookie()
    {
        
        response.deleteCookie('htl_Pchrt_sd');
        response.deleteCookie('htl_rn');
        response.deleteCookie('htl_li');
        response.deleteCookie('htl_ld'); 
        response.deleteCookie('htl_dg');  
        response.deleteCookie('htl_dp');
        response.deleteCookie('htl_En');  
        
        response.deleteCookie('htl_ef'); 
        response.deleteCookie('htl_tf');  
        response.deleteCookie('htl_def'); 
        response.deleteCookie('htl_wf');  
        response.deleteCookie('htl_vf');
        response.deleteCookie('htl_adld');  
        response.deleteCookie('xc47dcwl');
        response.deleteCookie('xzw34e_d');
    }
    /*
     *userGeneralCookie() function use for add general data like company name and user data into cookie
     **/
    def userGeneralCookie(def user)
    {
        response.deleteCookie('htl_Pchrt_sd');
        response.deleteCookie('htl_rn');
        response.deleteCookie('htl_li');
        response.deleteCookie('xc47dcwl');
        response.deleteCookie('htl_ld');  
        response.deleteCookie('htl_dg');  
        response.deleteCookie('htl_dp');  
        response.deleteCookie('htl_En');  
        
        
        response.setCookie('xc47dcwl','',tim)
        response.setCookie('xzw34e_d','Finance',tim)
        
        def objEmpl=HrEmpMstr.findByEmpUsrId(user.id)
        
        response.setCookie('htl_Pchrt_sd',user.id.toString(),tim)
        response.setCookie('htl_rn',user.usrName.toString(),tim)
        
        if(objEmpl)
        {                 
        response.setCookie('htl_li',objEmpl.id.toString(),tim)
      
        
        if(objEmpl.desig!=null){             
            def objDesig=GenDesigMastr.findById(objEmpl.desig.id)
            response.setCookie('htl_ld',objEmpl.desig.id.toString(),tim)
            response.setCookie('htl_dg',objDesig.desigName.toString(),tim)
        }
        if(objEmpl.dep!=null){
            def objDep=GenDepMstr.findById(objEmpl.dep.id)
            response.setCookie('htl_dp',objDep.depName.toString(),tim)
            
        }
       
        
        
        
        }
        else
        {
        response.setCookie('htl_li','0',tim)
        response.setCookie('htl_ld','0',tim)
        }
        
        return
    }
    
    /*
     *userRolesCookie() function use for add the roles data into the cookies.
     *this function code is delete the current cookie data and then add the data 
     *adding time we have check the condition for super admin and normal user
     * **/ 
//    def userRolesCookie(def usrType,def usrId,def menuId)
//    {         
//       
//        response.deleteCookie('htl_ef'); 
//        response.deleteCookie('htl_tf');  
//        response.deleteCookie('htl_def'); 
//        response.deleteCookie('htl_wf');  
//        response.deleteCookie('htl_vf');
//        response.deleteCookie('htl_adld');
//        response.deleteCookie('htl_md');
//        
//        response.setCookie('htl_md',menuId.toString(),tim) 
//        if(usrType=='Z' || usrType=='z')
//        {          
//               
//            response.setCookie('htl_ef','Y',tim)
//            response.setCookie('htl_tf','Y',tim)
//            response.setCookie('htl_def','Y',tim)
//            response.setCookie('htl_wf','Y',tim)
//            response.setCookie('htl_vf','Y',tim)
//          
//            
//            def menu=CmnMenuMastr.get(menuId.toInteger())
//            if(menu.adtnlData!=null)
//            response.setCookie('htl_adld',menu.adtnlData,tim)
//            else
//            response.setCookie('htl_adld','',tim)                    
//        }   
//        else{
//            def menuList
//            def strQuery  =  """
//                                    SELECT
//                                    b.role_id,
//                                    c.role_name,
//                                    d.role_id as rolId,d.menu_id,d.create_flg,d.edit_flg,d.remove_flg,d.view_flg,d.apprv_flg,d.sub_access,
//                                    e.menu_id as menuId,e.menu_name,e.menu_grp_id,e.modl_id,e.class_name,e.adtnl_data,
//                                    f.menu_grp_name,
//                                    g.modl_name
//                                    FROM cmn_usr_mastr a
//                                    inner join cmn_usr_role_dtls b on a.usr_id=b.usr_id and b.del_flg='N' and a.del_flg ='N'
//                                    inner join cmn_role_mastr c on b.role_id=c.role_id and c.del_flg='N'
//                                    inner join cmn_role_dtls d on b.role_id=d.role_id and d.del_flg='N'
//                                    inner join cmn_menu_mastr e on d.menu_id=e.menu_id and e.del_flg='N'
//                                    inner join cmn_menu_grp_mastr f on e.menu_grp_id=f.menu_grp_id and f.del_flg='N'
//                                    inner join cmn_modl_mastr g  on f.modl_id=g.modl_id and g.del_flg='N'
//                                    where a.usr_id=${usrId}   and d.menu_id=${menuId} group by e.menu_id
//                                """
//           
//            CmnMenuMastr.withSession
//            {
//                session ->
//                def query=session.createSQLQuery(strQuery)
//                menuList=query.list();
//            }           
//            def results = menuList?.collect {                 
//                response.setCookie('htl_ef',it[4],tim)
//                response.setCookie('htl_tf',it[5],tim)
//                response.setCookie('htl_def',it[6],tim)
//                response.setCookie('htl_wf',it[7],tim)
//                response.setCookie('htl_vf',it[8],tim)
//                if(it[15]!=null)
//                response.setCookie('htl_adld',it[15],tim)
//                else
//                response.setCookie('htl_adld','',tim)               
//            }
//        }
//       
//        return ;
//    }
    
    
//    def reloadCookie()// reload menu with finance
//    {
//        println "here"
//        response.setCookie('xc47dcwl','wrx_6y',tim)
//        
//         def jsonData = []
//        render jsonData as JSON
//    }
}
