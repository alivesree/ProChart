package com.htl.cmn.det
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.converters.JSON
import groovy.sql.Sql 

@Transactional(readOnly = true)
class CmnMenuMastrController {


    def menuList() {    
        

        def lstQry="""SELECT modl_name,menu_grp_name,menu_name,class_name
                        FROM cmn_menu_mastr
                        INNER JOIN cmn_menu_grp_mastr
                        ON cmn_menu_mastr.menu_grp_id=cmn_menu_grp_mastr.menu_grp_id
                        INNER JOIN cmn_modl_mastr 
                        on cmn_menu_mastr.modl_id=cmn_modl_mastr.modl_id"""       
        def mdlcount="""SELECT modl_id,count(distinct menu_grp_id),count(menu_name) FROM cmn_menu_mastr group by modl_id"""  
        def grpcount="""SELECT modl_id,count(distinct menu_name) FROM cmn_menu_mastr group by menu_grp_id order by modl_id,count(distinct menu_name) desc"""
        def lst=[]       
        CmnMenuMastr.withSession
        {  session ->
            def query=session.createSQLQuery(lstQry)
            def query2=session.createSQLQuery(mdlcount)
            def q3=session.createSQLQuery(grpcount)
            mdlcount=query2.list();
            lst=query.list();
            grpcount=q3.list();
        } 
        

        def res = 

            [    

                lst:lst,
                mdlcount:mdlcount,
                grpcount:grpcount,

            ]
            
            def jsonData=[res]
            render jsonData as JSON
            }
    


            }
