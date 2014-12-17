<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="adminheader.jsp">
	<c:param name="title" value="添加用户" />
</c:import>
<script>
jQuery(document).ready(function(){
	jQuery("#btn_add").click(function(){
		var username = jQuery("#username").val(), password = jQuery("#password").val(),
			type = jQuery("#type").val(), name = jQuery("#name").val();
		//alert(course+username+password+type+name);
		jQuery.ajax({
			type : "POST",
			url : "addauser",
			dataType : "json",
			
			data : {
				"username" : username,
				"password" : hex_md5(password),
				"type" : type,
				"name" : name
			},
			success : function(data) {
				if (data["status"] == "failed") {
					alert("添加失败，请检查是否有重复的用户名！");
				} else {
					location.href = "adminusermanage";
				}
			}
		});
	});
});

</script>


<div class="rightpanel">
        
         <ul class="breadcrumbs">
            <li><a href="adminhomepage"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a href="adminusermanage">用户管理</a><span class="separator"></span></li>
             <li><a href="adduserpage">添加用户</a></li>
             
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
            <div class="pageicon"><span class="iconfa-table"></span></div>
            <div class="pagetitle">
                <h5>用户管理</h5>
                <h1>添加用户</h1>
            </div>
        </div><!--pageheader-->
        
        <div class="maincontent">
            <div class="maincontentinner">
				
                 
                   
                <h4 class="subtitle2">添加方式</h4>
                <br />
                <div class="row-fluid">
                    <div class="span12">
                       
                                                
                        <div class="accordion accordion-primary">
                            <h3><a href="#">逐个添加</a></h3>
                            <div>
                                
                        <p>
                        	<label>用户名</label>
                            <span class="field"><input id="username" type="text" name="username" class="input-xlarge" /></span>
                        </p>
                       
                        <p>
                            <label>姓名</label>
                             <span class="field"><input id="name" type="text" name="name" class="input-xlarge" /></span>
                        </p>
			
                        
		                <p>
                            <label>用户密码</label>
                             <span class="field"><input id="password" type="text" name="password" class="input-xlarge" /></span>
                        </p>
		                <p>
                            <label>用户角色</label>
                            <span class="field">
                            <select id="type" name="type" class="uniformselect">
                            	<option value="teacher">老师</option>
                                <option value="student">学生</option>
                                <option value="assistent">助教</option>
                                <option value="admin">管理员</option>
                            </select>
                            </span>
                        </p>
          
								<p class="stdformbutton">
                                <button id="btn_add" class="btn btn-primary">添加</button>
                                
                            </p>  
                            </div>
                            <h3><a href="#">批量添加</a></h3>
                            <div>
                                <div class="par">
			    <label>上传附件</label>
			    <div class="fileupload fileupload-new" data-provides="fileupload">
				<div class="input-append">
				<div class="uneditable-input span3">
				    <i class="iconfa-file fileupload-exists"></i>
				    <span class="fileupload-preview"></span>
				</div>
				<span class="btn btn-file"><span class="fileupload-new">附件</span>
				<span class="fileupload-exists">修改</span>
				<input type="file" /></span>
				<a href="#" class="btn fileupload-exists" data-dismiss="fileupload">移除</a>
				</div>
			    </div>
			</div>
                        
                      <p class="stdformbutton">
                                <button class="btn btn-primary">添加</button>
                                
                            </p>  
                            </div>
                            
                        </div><!--#accordion-->
                        
                       
                        
                    </div><!--span6-->
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