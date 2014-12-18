<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="adminheader.jsp">
	<c:param name="title" value="添加课程" />
</c:import>

<script>
jQuery(document).ready(function(){
	jQuery("#btn_add").click(function(){
		var courseid = jQuery("#courseid").val(), coursename = jQuery("#coursename").val(),
		teachername = jQuery("#teachername").val(), classroom = jQuery("#classroom").val(), coursetime = jQuery("#coursetime").val();
		//alert(courseid+coursename+teachername+classroom+coursetime);
		jQuery.ajax({
			type : "POST",
			url : "addacourse",
			dataType : "json",
			
			data : {
				"courseid" : courseid,
				"coursename" : coursename,
				"teachername" : teachername,
				"classroom" : classroom,
				"coursetime" : coursetime
			},
			success : function(data) {
				if (data["status"] == "failed") {
					alert("添加失败，请检查是否有重复的课程号！");
				} else {
					location.href = "admincourseman";
				}
			}
		});
	});
});

</script>


<div class="rightpanel">
        
         <ul class="breadcrumbs">
            <li><a href="adminhomepage"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a href="admincourseman">课程管理</a><span class="separator"></span></li>
             <li><a href="adminaddcourse">添加课程</a></li>
             
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
                <h1>添加课程</h1>
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
                        	<label>课程编号</label>
                            <span class="field"><input id="courseid" type="text" name="courseid" class="input-xlarge" /></span>
                        </p>
                       
                        <p>
                            <label>课程名</label>
                             <span class="field"><input id="coursename" type="text" name="coursename" class="input-xlarge" /></span>
                        </p>
			
                        
		                <p>
                            <label>授课教师</label>
                             <select id="teachername">
                             	<c:forEach items="${teacherlist}" var="teacher">
                             		<option value="${teacher.uid}">${teacher.name }(${teacher.username })</option>
                             	</c:forEach>
                             </select>
                        </p>
						<p>
                            <label>上课教室</label>
                             <span class="field"><input id="classroom" type="text" name="classroom" class="input-xlarge" /></span>
                        </p>
								
						<p>
                            <label>上课时间</label>
                             <span class="field"><input id="coursetime" type="text" name="coursetime" class="input-xlarge" /></span>
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
