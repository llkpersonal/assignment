<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="adminheader.jsp">
	<c:param name="title" value="用户管理" />
</c:import>

<script type="text/javascript">
var global_uid;
function getuserinfo(uid){
	global_uid = uid;
	jQuery.ajax({
		type : "GET",
		url : "showuser?uid="+uid,
		dataType : "json",
		success : function(data) {
			jQuery("#modal_username").val(data["username"]);
			jQuery("#modal_name").val(data["name"]);
			if(data["usertype"]=="admin"){
				jQuery("#modal_admin").attr("selected","true");
			} else if( data["usertype"]=="student"){
				jQuery("#modal_student").attr("selected","true");
			} else if(data["usertype"]=="assistant"){
				jQuery("#modal_assistant").attr("selected","true");
			} else if(data["usertype"]=="teacher"){
				jQuery("#modal_teacher").attr("selected","true");
			}
		}
	});
}
function on_submit_click(){
	var username = jQuery("#modal_username").val(), name=jQuery("#modal_name").val(),
		usertype = jQuery("#modal_type").val();
	//alert(username+name+usertype);
	jQuery.ajax({
		type : "POST",
		url : "modifyuser",
		dataType : "json",
		
		data : {
			"username" : username,
			"name" : name,
			"usertype" : usertype,
			"uid" : global_uid
		},
		success : function(data) {
			if (data["status"] == "failed") {
				alert("添加失败，请检查是否有重复的用户名！");
			} else {
				location.href = "adminusermanage";
			}
		}
	});
}
function deleteuser_setid(uid){
	global_uid = uid;
}
function deleteuser(){
	jQuery.ajax({
		type : "GET",
		url : "delauser?uid="+global_uid,
		dataType : "json",
		
		success : function(data) {
			if (data["status"] == "failed") {
				alert(data["msg"]);
				location.href = "adminusermanage";
			} else {
				location.href = "adminusermanage";
			}
		}
	});
}
    jQuery(document).ready(function(){
        // dynamic table
        
        jQuery('#dyntable').dataTable({
            "sPaginationType": "full_numbers",
            "aaSortingFixed": [[0,'asc']],
            "fnDrawCallback": function(oSettings) {
                jQuery.uniform.update();
            }
        });
        
        jQuery('#dyntable2').dataTable( {
            "bScrollInfinite": true,
            "bScrollCollapse": true,
            "sScrollY": "300px"
        });
        
    });
	
</script>
<div class="rightpanel">
        
         <ul class="breadcrumbs">
            <li><a href="adminhomepage"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a href="adminusermanage">用户管理</a></li>
            
             
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
                <h1>增删改查</h1>
            </div>
        </div><!--pageheader-->
        
        <div class="maincontent">
            <div class="maincontentinner">
				<a href="adduserpage">
				<button class="btn btn-success btn-large">添加用户</button></a>
                <h4 class="widgettitle">用户列表</h4>
             
                <table id="dyntable" class="table table-bordered responsive">
                    <colgroup>
                        <col class="con0" style="align: center; width: 4%" />
                        <col class="con1" />
                        <col class="con0" />
                        <col class="con1" />
                        <col class="con0" />
                        
                    </colgroup>
                    <thead>
                        <tr>
                          	<!-- th class="head0 nosort"><input type="checkbox" class="checkall" /></th-->
                            <th class="head0 center">uid</th>
                            <th class="head1 center">姓名</th>
                            <th class="head0 center">角色</th>
                            <th class="head1 center">用户名</th>
                            <th class="head0 center">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${userlist}" var="user">
                        <tr class="gradeX">
                          <!-- <td class="aligncenter"><span class="center">
                            <input type="checkbox" />
                          </span></td> -->
                            <td class="center">${user.uid}</td>
                            <td class="center">${user.name }</td>
                            <td class="center">${user.usertype }</td>
							<td class="center">${user.username }</td>
                            <td class="center">
								
								<a data-toggle="modal" onclick="getuserinfo(${user.uid})" data-target="#modifyModal">修改</a>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a data-toggle="modal" onclick="deleteuser_setid(${user.uid})" data-target="#deleteModal">删除</a></td>
                        
                        </tr>
                     </c:forEach>
                    </tbody>
                </table>
                
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

	
	
	
	<!-- modifyModal -->
<div aria-hidden="false" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" class="modal hide fade in" id="modifyModal">
  
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
       <h3 class="modal-title myfont" id="myModalLabel">修改用户</h3>
      </div>
      <div class="modal-body myfont">
       
                        <p>
                        	<label>用户名</label>
                            <span class="field"><input type="text" id="modal_username" class="input-xlarge" /></span>
                        </p>
                       
                        <p>
                            <label>姓名</label>
                             <span class="field"><input type="text" id="modal_name" class="input-xlarge" /></span>
                        </p>
			
                        
		                <!-- p>
                            <label>密码</label>
                             <span class="field"><input type="text" id="modal_password" class="input-xlarge" /></span>
                        </p-->
		                <p>
                            <label>角色</label>
                            <span class="field">
                            <select id="modal_type" class="uniformselect">
                            	<option id="modal_teacher" value="teacher">老师</option>
                                <option id="modal_student" value="student">学生</option>
                                <option id="modal_assistant" value="assistant">助教</option>
                                <option id="modal_admin" value="admin">管理员</option>
                                
                            </select>
                            </span>
                        </p>
          
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default myfont" data-dismiss="modal">关闭</button>
        <button type="button" onclick="on_submit_click()" id="modal_btn_submit" class="btn btn-primary myfont">确定</button>
      </div>
    </div>

	<!-- deleteModal -->
<div aria-hidden="false" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" class="modal hide fade in" id="deleteModal">
  
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
       <h3 class="modal-title myfont" id="myModalLabel">删除用户</h3>
      </div>
      <div class="modal-body myfont">
        <h5>请问您确认删除吗？</h5>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default myfont" data-dismiss="modal">关闭</button>
        <button type="button" onclick="deleteuser()" class="btn btn-primary myfont">确定</button>
      </div>
    </div>

	
</body>
</html>