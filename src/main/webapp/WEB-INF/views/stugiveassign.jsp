<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="stuheader.jsp">
	<c:param name="title" value="提交作业" />
</c:import>
<script type="text/javascript">
jQuery(document).ready(function(){
	jQuery("#btn_submit").click(function(){
		var assigncontent = jQuery("#assigncontent").val(), assignstucontent = jQuery("#assignstucontent").val(), aid=${aid};
		//alert("000");
		jQuery.ajax({
			type : "POST",
			url : "subassign",
			dataType : "json",
			
			data : {
				"assigncontent" : assigncontent,
				"assignstucontent" : assignstucontent,
				"aid" : aid,
			},
			success : function(data) {
				if (data["status"] == "failed") {
					alert("发送失败！");
				} else {
					alert("发送成功！");
					location.href = "stushowassign?cid=${cid}";
				}
			}
		});
	});
});
</script>
    <div class="rightpanel">
        
         <ul class="breadcrumbs">
            <li><a href="stuhomepage.html"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a href="stushowassign.html?cid=${cid}">查看/提交作业</a> <span class="separator"></span></li>
            <li><a href="stugiveassign.html?cid=${cid}&aid=${aid}">提交作业</a> </li>
            
			 
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
                <h5>查看/提交作业</h5>
                <h1>提交作业</h1>
            </div>
        </div><!--pageheader-->
        
        <div class="maincontent">
            <div class="maincontentinner">
            
            <div class="widget">
            <h4 class="widgettitle">提交作业</h4>
            <div class="widgetcontent">
                <div class="stdform">
                        <p>
                        	<label>作业标题</label>
                            <span class="field"><input id="assigncontent" type="text" name="assigncontent" class="input-xlarge" /></span>
                        </p>
                       
                        <p>
                            <label>作业内容</label>
                            <span class="field"><textarea id="assignstucontent" name="assignstucontent" cols="80" rows="8" class="span7"></textarea></span> 
                        </p>
			
                     
                                    
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
                                <button id="btn_submit" class="btn btn-primary" >提交</button>
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
