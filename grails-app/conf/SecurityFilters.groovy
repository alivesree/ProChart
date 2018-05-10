/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author User Account
 */

class SecurityFilters {
   def filters = {
       loginCheck(controller: '*', action: '*') {
           before = {
              // println controllerName
              if (request.getCookie('htl_li')==null && !controllerName.equals('cmnUsrMastr') ) {
                  flash.message="Please login first"
                  redirect(controller:'CmnUsrMastr',action: 'login')
                  return false
               }
           }
       }
   }
}
