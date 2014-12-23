<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="teacherheader.jsp">
	<c:param name="title" value="作业管理系统/布置作业" />
</c:import>
    
<script>
window.onload = function(){
	jQuery("#datepicker1").datepicker();
	jQuery("#timepicker2").timepicker();
};


function btnclick(){
	alert("111111");
	var assignhead = jQuery("#assignhead").val(), assigncontent = jQuery("#assigncontent").val(),
	datepicker1 = jQuery("#datepicker1").val(), timepicker2 = jQuery("#timepicker2").val(),
	datepicker = jQuery("#datepicker").val(), timepicker1 = jQuery("#timepicker1").val();
	var cid=jQuery("#course_id").val();
	//alert(courseid+coursename+teachername+classroom+coursetime);
	jQuery.ajax({
		type : "POST",
		url : "addaassign",
		dataType : "json",
		
		data : {
			"assignhead" : assignhead,
			"assigncontent" : assigncontent,
			"datepicker1" : datepicker1,
			"timepicker2" : timepicker2,
			"datepicker" : datepicker,
			"timepicker1" : timepicker1,
			"cid" : cid
			
		},
		success : function(data) {
			if (data["status"] == "failed") {
				alert("添加失败，请检查是否有重复的作业标题！");
			} else {
				location.href = "teachershowassign?cid="+cid;
			}
		}
	});
}



</script>    
    
 <div class="rightpanel">
        
        <ul class="breadcrumbs">
            <li><a href="teacherhomepage.html"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a href="teachergiveassign.html?cid=${cid }">作业管理</a> <span class="separator"></span></li>
            <li><a href="teachergiveassign.html?cid=${cid }">布置作业</a></li>
            
            <li class="right">
                <a href="" data-toggle="dropdown" class="dropdown-toggle"><i class="icon-tint"></i> 皮肤</a>
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
            <div class="pageicon"><span class="iconfa-pencil"></span></div>
            <div class="pagetitle">
                <h5>作业管理</h5>
                <h1>布置作业</h1>
            </div>
        </div><!--pageheader-->
        
        <div class="maincontent">
            <div class="maincontentinner">
            
            <div class="widget">
            <h4 class="widgettitle">布置作业</h4>
            <div class="widgetcontent">
                <div class="stdform" >
                   
                        
                        <p>
                        	<label>作业标题</label>
                            <span class="field"><input type="text" name="input4" class="input-xlarge" id="assignhead" /></span>
                        </p>
                       
                        <p>
                            <label>作业内容</label>
                            <span class="field"><textarea cols="80" rows="5" class="span5" id="assigncontent"></textarea></span> 
                        </p>
						
						 <div class="par">
                            <label>起始日期</label>
                            <span class="field"><input id="datepicker1" type="text" name="date" class="input-small"/></span>
                        </div> 
                         
                        <div class="par">
                            <label>起始时间</label>
                            <div id="timepicker" class="input-append bootstrap-timepicker">
				<input id="timepicker2" type="text" class="input-small" />
				<span class="add-on"><i class="iconfa-time"></i></span>
			    </div>
                        </div>
						
                        <div class="par">
                            <label>截止日期</label>
                            <span class="field"><input id="datepicker" type="text" name="date" class="input-small" data-date-format="yyyy-mm-dd" /></span>
                        </div> 
                         <input type="hidden" id="course_id" value="${cid }" />
                        <div class="par">
                            <label>截止时间</label>
                            <div id="timepicker" class="input-append bootstrap-timepicker">
				<input id="timepicker1" type="text" class="input-small" />
				<span class="add-on"><i class="iconfa-time"></i></span>
			    </div>
                        </div>
                                    
			<div class="par">
			    <label>添加附件</label>
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
                                <button onclick="btnclick()" class="btn btn-primary" id="btn-add">添加</button>
                                <button type="reset" class="btn">重置</button>
                            </p>  
                        
                </div>
            </div><!--widgetcontent-->
            </div><!--widget-->
            
         
            
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
    