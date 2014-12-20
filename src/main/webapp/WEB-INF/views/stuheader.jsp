<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>${param.title }</title>
<link rel="stylesheet" href="css/style.default.css" type="text/css" />

<link rel="stylesheet" href="css/responsive-tables.css">
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/jquery-migrate-1.1.1.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.9.2.min.js"></script>
<script type="text/javascript" src="js/modernizr.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script type="text/javascript" src="js/jquery.uniform.min.js"></script>
<script type="text/javascript" src="js/flot/jquery.flot.min.js"></script>
<script type="text/javascript" src="js/flot/jquery.flot.resize.min.js"></script>
<script type="text/javascript" src="js/responsive-tables.js"></script>
<script type="text/javascript" src="js/custom.js"></script>


<link rel="stylesheet" href="css/fontandcolor.css" type="text/css" />
<link rel="stylesheet" href="css/bootstrap-fileupload.min.css" type="text/css" />
<link rel="stylesheet" href="css/bootstrap-timepicker.min.css" type="text/css" />
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/bootstrap-fileupload.min.js"></script>
<script type="text/javascript" src="js/bootstrap-timepicker.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<script type="text/javascript" src="js/jquery.tagsinput.min.js"></script>
<script type="text/javascript" src="js/jquery.autogrow-textarea.js"></script>
<script type="text/javascript" src="js/fullcalendar.min.js"></script>
<script type="text/javascript" src="js/charCount.js"></script>
<script type="text/javascript" src="js/colorpicker.js"></script>
<script type="text/javascript" src="js/ui.spinner.min.js"></script>
<script type="text/javascript" src="js/chosen.jquery.min.js"></script>
<script type="text/javascript" src="js/forms.js"></script>
<!--[if lte IE 8]><script language="javascript" type="text/javascript" src="js/excanvas.min.js"></script><![endif]-->
</head>

<body>

<div class="mainwrapper">
    
    <div class="header">
        <div class="logo">
            <a href="stuhomepage.html"><img src="images/logo1.png" alt="" /></a>
        </div>
        <div class="headerinner">
            <ul class="headmenu">
                <li class="odd">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <span class="count">4</span>
                        <span class="head-icon head-message"></span>
                        <span class="headmenu-label">信息</span>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="nav-header">信息</li>
                        <li><a href=""><span class="icon-envelope"></span> 新信息来自 <strong>Jack</strong> <small class="muted"> - 19 hours ago</small></a></li>
                        <li><a href=""><span class="icon-envelope"></span> 新信息来自 <strong>Daniel</strong> <small class="muted"> - 2 days ago</small></a></li>
                        <li><a href=""><span class="icon-envelope"></span> 新信息来自 <strong>Jane</strong> <small class="muted"> - 3 days ago</small></a></li>
                        <li><a href=""><span class="icon-envelope"></span> 新信息来自 <strong>Tanya</strong> <small class="muted"> - 1 week ago</small></a></li>
                        <li><a href=""><span class="icon-envelope"></span> 新信息来自 <strong>Lee</strong> <small class="muted"> - 1 week ago</small></a></li>
                        <li class="viewmore"><a href="stuappealman.html">查看更多</a></li>
                    </ul>
                </li>
                <li>
                    <a class="dropdown-toggle" data-toggle="dropdown" data-target="#">
                    <span class="count">10</span>
                    <span class="head-icon head-event"></span>
                    <span class="headmenu-label">日历</span>
                    </a>
                    <ul class="dropdown-menu newusers">
                        <li class="nav-header">日历</li>
                        <li>
                            <a href="">
                                
                                <strong>Draniem Daamul</strong>
                                <small>April 20, 2013</small>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                
                                <strong>Shamcey Sindilmaca</strong>
                                <small>April 19, 2013</small>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                
                                <strong>Nusja Paul Nawancali</strong>
                                <small>April 19, 2013</small>
                            </a>
                        </li>
                        <li>
                            <a href="">
                               
                                <strong>Rose Cerona</strong>
                                <small>April 18, 2013</small>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                
                                <strong>John Doe</strong>
                                <small>April 16, 2013</small>
                            </a>
                        </li>
                    </ul>
                </li>
               <%
        			Cookie [] cookies = request.getCookies();
        			String name = "" , username="";
        			for(int i=0;i<cookies.length;i++){
        				if( cookies[i].getName().equals("name") ){
        					name = cookies[i].getValue();
        				} else if( cookies[i].getName().equals("username") ){
        					username = cookies[i].getValue();
        				}
       			 	}
       			 %>
                <li class="right">
                    <div class="userloggedinfo">
                        <img src="images/photos/1.jpg" alt="" />
                        <div class="userinfo">
                            <h5><% out.println(URLDecoder.decode(name)); %>  <small>- <% out.println(username); %></small></h5>
                            <ul>
                                <li><a href="">学生</a></li>
                                <li><a href="stupersoninfo.html">修改资料</a></li>
                                <li><a href="index.html">注销</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
            </ul><!--headmenu-->
        </div>
    </div>
    
    <div class="leftpanel">
        <%
        	String uri = request.getRequestURI();
        %>
        <div class="leftmenu">        
            <ul class="nav nav-tabs nav-stacked">
            	<li class="nav-header">导航</li>
                <li <%if(uri.indexOf("stuhomepage")!=-1) out.print("class=\"active\""); %>><a href="stuhomepage"><span class="iconfa-laptop"></span> 主页</a></li>
                
                <li class="dropdown"><a href=""><span class="iconfa-pencil"></span> 作业管理</a>
                	<ul>
                    	
						<li <%if(uri.indexOf("stushowassign")!=-1||uri.indexOf("stushowassign")!=-1) out.print("class=\"active\""); %>><a href="stushowassign">查看/提交作业</a></li>
                        
                        <li <%if(uri.indexOf("stucodeassign")!=-1||uri.indexOf("stucodeassign")!=-1) out.print("class=\"active\""); %>><a href="stucodeassign">编程作业</a></li>
                    </ul>
                </li>
				<li <%if(uri.indexOf("stugrademan")!=-1||uri.indexOf("stugrademan")!=-1) out.print("class=\"active\""); %>><a href="stugrademan"><span class="iconfa-hand-up"></span> 成绩管理</a></li>
                
                <li <%if(uri.indexOf("stuappealman")!=-1||uri.indexOf("stuappealman")!=-1) out.print("class=\"active\""); %>><a href="stuappealman"><span class="iconfa-envelope"></span> 申诉处理</a></li>
                <li <%if(uri.indexOf("stucalendar")!=-1) out.print("class=\"active\""); %>><a href="showstucalendar"><span class="iconfa-calendar"></span>日历</a></li>
				
                
             
             
            </ul>
        </div><!--leftmenu-->
        
    </div><!-- leftpanel -->