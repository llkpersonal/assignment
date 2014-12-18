<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="adminheader.jsp">
	<c:param name="title" value="课程管理" />
</c:import>
<script>
var global_cid;
function set_delete_id(cid){
	global_cid = cid;
}
function commit_delete(){
	cid = global_cid;
	jQuery.ajax({
		type : "GET",
		url : "delacourse?cid="+cid,
		dataType : "json",
		success : function(data) {
			location.href = "admincourseman";
		}
	});
}
function getcourseinfo(cid){
	global_cid = cid;
	jQuery.ajax({
		type : "GET",
		url : "fetchacourse?cid="+cid,
		dataType : "json",
		success : function(data) {
			jQuery("#courseid").val(data["courseid"]);
			jQuery("#teachername").val(data["teachername"]);
			jQuery("#coursetime").val(data["coursetime"]);
			jQuery("#coursename").val(data["coursename"]);
			jQuery("#classroom").val(data["classroom"]);
		}
	});
}
function submit_course_info(){
	var cid = global_cid;
	var courseid = jQuery("#courseid").val(), classroom = jQuery("#classroom").val(), coursename=jQuery("#coursename").val(), coursetime = jQuery("#coursetime").val(),
		teachername=jQuery("#teachername").val();
	//alert(courseid+classroom+coursename+coursetime+teachername);
	jQuery.ajax({
		type : "POST",
		url : "modifycourse",
		dataType:"json",
		data:{
			"cid" : cid,
			"courseid" : courseid,
			"classroom" : classroom,
			"coursename" : coursename,
			"coursetime" : coursetime,
			"teachername" : teachername
		},
		success: function(data){
			location.href="admincourseman";
		}
	});
}
</script>
<div class="rightpanel">
        
         <ul class="breadcrumbs">
            <li><a href="adminhomepage"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a href="admincourseman">课程管理</a></li>
            
             
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
                <h5>课程管理</h5>
                <h1>增删改查</h1>
            </div>
        </div><!--pageheader-->
        
        <div class="maincontent">
            <div class="maincontentinner">
				<a href="adminaddcourse">
				<button class="btn btn-success btn-large">添加课程</button></a>
                <h4 class="widgettitle">课程列表</h4>
             
                <table id="dyntable" class="table table-bordered responsive">
                    <colgroup>
                        <!-- col class="con0" style="align: center; width: 4%" /-->
                        <col class="con1" />
                        <col class="con0" />
                        <col class="con1" />
                        <col class="con0" />
                        <col class="con1" />
                    </colgroup>
                    <thead>
                        <tr>
                          	<!-- th class="head0 nosort"><input type="checkbox" class="checkall" /></th-->
                            <th class="head0 center">编号</th>
                            <th class="head1 center">课程名</th>
                            <th class="head0 center">授课老师</th>
                            <th class="head1 center">上课教室</th>
							<th class="head1 center">上课时间</th>
							<th class="head1 center">学生人数</th>
                            <th class="head0 center">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        
                        <c:forEach items="${courselist}" var="course">
                        <tr class="gradeX">
                          <!-- td class="aligncenter"><span class="center">
                            <input type="checkbox" />
                          </span></td--> 
                            <td class="center">${course.courseid}</td>
                            <td class="center">${course.coursename }</td>
                            <td class="center">${course.name }</td>
							<td class="center">${course.classroom }</td>
							<td class="center">${course.coursetime }</td>
							<td class="center">${course.studentnumber }</td>
                            <td class="center">
								
								<a data-toggle="modal" onclick="getcourseinfo(${course.cid})" data-target="#modifyModal">修改</a>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a data-toggle="modal" onclick="set_delete_id(${course.cid})" data-target="#deleteModal">删除</a></td>
                        
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
       <h3 class="modal-title myfont" id="myModalLabel">修改课程</h3>
      </div>
      <div class="modal-body myfont">
       
                        <p>
                        	<label>课程编号</label>
                            <span class="field"><input type="text" id="courseid" class="input-xlarge" /></span>
                        </p>
                       
                        <p>
                            <label>课程名</label>
                             <span class="field"><input type="text" id="coursename" class="input-xlarge" /></span>
                        </p>
			
                        
		                <p>
                            <label>授课教师</label>
                             <span class="field"><input type="text" id="teachername" class="input-xlarge" /></span>
                        </p>
		  <p>
                            <label>上课教室</label>
                             <span class="field"><input type="text" id="classroom" class="input-xlarge" /></span>
                        </p>
		  <p>
                            <label>上课时间</label>
                             <span class="field"><input type="text" id="coursetime" class="input-xlarge" /></span>
                        </p>
		               
          
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default myfont" data-dismiss="modal">关闭</button>
        <button type="button" onclick="submit_course_info()" class="btn btn-primary myfont">确定</button>
      </div>
    </div>

	<!-- deleteModal -->
<div aria-hidden="false" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" class="modal hide fade in" id="deleteModal">
  
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
       <h3 class="modal-title myfont" id="myModalLabel">删除课程</h3>
      </div>
      <div class="modal-body myfont">
        <h5>请问您确认删除吗？</h5>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default myfont" data-dismiss="modal">关闭</button>
        <button type="button" onclick="commit_delete()" class="btn btn-primary myfont">确定</button>
      </div>
    </div>

	
</body>
</html>
