<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dao.*" errorPage="Error.jsp" %>
<% 	
	    	String    json;
			String b_code = request.getParameter("b_code");
			String m_code = request.getParameter("m_code");
			StoreDao sd = StoreDao.getInstance();
			//BookMemberDao bmd = BookMemberDao.getInstance();
			List<Store> s_menu = sd.s_menu(b_code,m_code);
		    //List<BookMember> list = bmd.bmlist(1, 3);	
	    	System.out.println("list.size()-->"+s_menu.size());
			JSONObject data1 = new JSONObject();
			JSONObject data2 = new JSONObject();
			JSONObject data3 = new JSONObject();
			JSONObject data4 = new JSONObject();
			JSONObject data5 = new JSONObject();
			JSONObject data6 = new JSONObject();
			JSONObject data7 = new JSONObject();
			JSONObject data8 = new JSONObject();
			
			JSONArray   jsonArray = new JSONArray();//배열 적용 

		   for(int i=0;i < s_menu.size() ; i++){
	    	  	  switch (i) {
	    	  	     case 0:    data1.put("s_code" , s_menu.get(i).getS_code());    
	                        	data1.put("s_name" , s_menu.get(i).getS_name()); 
	                        	jsonArray.add(data1);
	    	  	                break;
	    	  	     case 1:    data2.put("s_code" , s_menu.get(i).getS_code());    
          	  	   				data2.put("s_name" , s_menu.get(i).getS_name());
          	  	   				jsonArray.add(data2);
                                break;
	    	  	     case 2:    data3.put("s_code" , s_menu.get(i).getS_code());    
          	  	                data3.put("s_name" , s_menu.get(i).getS_name());
          	  	            	jsonArray.add(data3);
                                break;
	    	  	   	 case 3:    data4.put("s_code" , s_menu.get(i).getS_code());    
	  	                		data4.put("s_name" , s_menu.get(i).getS_name());
	  	                		jsonArray.add(data4);
                  			 	break;
	    	  	   	 case 4:    data5.put("s_code" , s_menu.get(i).getS_code());    
			               	  	data5.put("s_name" , s_menu.get(i).getS_name()); 
			               		jsonArray.add(data5);
			 	                break;
			 	     case 5:    data6.put("s_code" , s_menu.get(i).getS_code());    
				  	   			data6.put("s_name" , s_menu.get(i).getS_name());
				  	   			jsonArray.add(data6);
			                    break;
			 	     case 6:    data7.put("s_code" , s_menu.get(i).getS_code());    
				  	            data7.put("s_name" , s_menu.get(i).getS_name());
				  	           	jsonArray.add(data7);
			                   	break;
			 	   	 case 7:    data8.put("s_code" , s_menu.get(i).getS_code());    
			             		data8.put("s_name" , s_menu.get(i).getS_name());
			             		jsonArray.add(data8);
			     			 	break;
	    	  	    default :   break;
	    	 	      }
 		  }
		   
		   /* for(int i=1; i<=4; i++){
			   if(datai != null)
			   jsonArray.add(data);
		   } */
  	    /*    jsonArray.add(data1);
  	       jsonArray.add(data2);
  	       jsonArray.add(data3);
  	       jsonArray.add(data4); */
         	  //  joRet  선언 및 적용
           JSONObject   joRet   = new JSONObject();
           joRet.put("list" ,  jsonArray );
           // 파싱 Data 저장 
          json = joRet.toJSONString();
	      System.out.println("json-->"+json);

		   out.print(json);    
  
		%>