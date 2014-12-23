<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="stuheader.jsp">
	<c:param name="title" value="学生个人信息" />
</c:import>
    <div class="rightpanel">
        
         <ul class="breadcrumbs">
            <li><a href="stuhomepage.html"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a href="stupersoninfo.html">个人信息</a> </li>
           
             
            <li class="right">
                <a href="" data-toggle="dropdown" class="dropdown-toggle"><i class="icon-tint"></i>皮肤</a>
                <ul class="dropdown-menu pull-right skin-color">
                    <li><a href="default">Default</a></li>
                    <li><a href="navyblue">Navy Blue</a></li>
                    <li><a href="palegreen">Pale Green</a></li>
                    <li><a href="red">Red</a></li>
                    <li><a href="green">Green</a></li>
                    <li><a href="brown">Brown</a></li>
					<li><a href="lightred">Lightred</a></li>
                </ul>
            </li>
        </ul>
        
        <div class="pageheader">
            <form action="results.html" method="post" class="searchbar">
                <input type="text" name="keyword" placeholder="To search type and hit enter..." />
            </form>
            <div class="pageicon"><span class="iconfa-laptop"></span></div>
            <div class="pagetitle">
                <h5>个人信息</h5>
                <h1>修改资料</h1>
            </div>
        </div><!--pageheader-->
        
        <div class="maincontent">
            <div class="maincontentinner">
                <div class="row-fluid">
                    	<div class="span4 profile-left">
                        
                        <div class="widgetbox profile-photo">
                            <div class="headtitle">
                                <div class="btn-group">
                                    <button data-toggle="dropdown" class="btn dropdown-toggle">操作 <span class="caret"></span></button>
                                    <ul class="dropdown-menu">
                                      <li><a href="#">修改照片</a></li>
                                      <li><a href="#">删除照片</a></li>
                                    </ul>
                                </div>
                                <h4 class="widgettitle">照片</h4>
                            </div>
                            <div class="widgetcontent">
                                <div class="profilethumb">
                                    <img src="images/profilethumb.png" alt="" class="img-polaroid" />
                                </div><!--profilethumb-->
                            </div>
                        </div>
                            
                            
                        <div class="widgetbox tags">
                                <h4 class="widgettitle">标签</h4>
                                <div class="widgetcontent">
                                    <ul class="taglist">
                                        <li><a href="">HTML5 <span class="close">&times;</span></a></li>
                                        <li><a href="">CSS <span class="close">&times;</span></a></li>
                                        <li><a href="">PHP <span class="close">&times;</span></a></li>
                                        <li><a href="">jQuery <span class="close">&times;</span></a></li>
                                        <li><a href="">Java <span class="close">&times;</span></a></li>
                                        
                                        <li><a href="">Bootstrap <span class="close">&times;</span></a></li>
                                    </ul>
                                    <a href="" style="display:block;margin-top:10px">+ 添加标签</a>
                                </div>
                        </div>
                            
                        </div><!--span4-->
                        <div class="span8">
                            <form action="editprofile.html" class="editprofileform" method="post">
                                
                                <div class="widgetbox login-information">
                                    <h4 class="widgettitle">登录信息</h4>
                                    <div class="widgetcontent">
                                        <p>
                                            <label>姓名:</label>
                                            <input type="text" name="username" class="input-xlarge" value="罗夕" readonly />
                                        </p>
                                        <p>
                                            <label>邮箱:</label>
                                            <input type="text" name="email" class="input-xlarge" value="you@yourdomain.com" />
                                        </p>
                                        <p>
                                            <label style="padding:0">修改密码：</label>
                                            <input type="text" name="password" class="input-xlarge" />
											
                                        </p>
										<p>
                                            <label style="padding:0">重复密码：</label>
                                           
											<input type="text" name="confirmpassword" class="input-xlarge" />
                                        </p>
                                    </div>
                                </div>
                                
                                
                                <div class="widgetbox personal-information">
                                    <h4 class="widgettitle">个人信息</h4>
                                    <div class="widgetcontent">
                                       <p>
                                            <label>学号:</label>
                                            <input type="text" name="number" class="input-xlarge" value="12301123" readonly />
                                        </p>
                                        <p>
                                            <label>性别:</label>
                                            <input type="text" name="sex" class="input-xlarge" value="Cebu, Philippines" />
                                        </p>
                                        <p>
                                            <label>年龄:</label>
                                            <input type="text" name="age" class="input-xlarge" value="http://themepixels.com/" />
                                        </p>
                                        
                                    </div>
                                </div>
                                
                              
                                
                                <p>
                                	<button type="submit" class="btn btn-primary">更新</button> &nbsp; 
                                </p>
                                
                            </form>
                        </div><!--span8-->
                    </div><!--row-fluid-->
                
                <div class="footer">
                    <div class="footer-left">
                        <span>&copy; 2014. 牛A昆昆. All Rights Reserved.</span>
                    </div>
                    <div class="footer-right">
                        <span>Designed by: <a href="http://kkxixi.com/">Christy</a></span>
                    </div>
                </div><!--footer-->
            
            </div><!--maincontentinner-->
        </div><!--maincontent-->
        
    </div><!--rightpanel-->
    
</div><!--mainwrapper-->

	
</body>
</html>
