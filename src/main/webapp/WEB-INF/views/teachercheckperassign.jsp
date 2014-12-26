<%@ page language="java" contentType="text/html; utf-8"
    pageEncoding="utf-8"%>
<%@ page isELIgnored = "false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="teacherheader.jsp">
	<c:param name="title" value="作业管理系统/批改作业" />
</c:import>

<script>


window.onload = function(){
	getinfo(${gid});
}

function getinfo(gid){
	//global_gid = gid;
	 
	jQuery.ajax({
		type : "GET",
		url : "fetchperassign?gid="+gid,
		dataType : "json",
		success : function(data) {
			jQuery("#assigntitle2").val(data[0]);
			jQuery("#stoptime2").val(1900+data[1]["year"]+"/"+(1+data[1]["month"])+"/"+data[1]["date"]+" "+data[1]["hours"]+":"+data[1]["minutes"]);
			jQuery("#sendtime2").val(1900+data[2]["year"]+"/"+(1+data[2]["month"])+"/"+data[2]["date"]+" "+data[1]["hours"]+":"+data[1]["minutes"]);
			jQuery("#content2").val(data[3]);
			jQuery("#grade2").val(data[4]);
			jQuery("#assignhead").text(data[0]);
			jQuery("#username").text(data[5]);
			jQuery("#usergrade").text(data[5]+"——"+data[4]);
			jQuery("#username1").text(data[5]+"的作业");
		}
	});
}

function submit_score_info(){
	var gid=${gid};
	var score=jQuery("#grade2").val();
	
	jQuery.ajax({
		type : "POST",
		url : "modifyscore",
		dataType:"json",
		data:{
			"gid":gid,
			"score" : score
		},
		success: function(data){
			location.reload();
		}
	});
}

</script>
<div class="rightpanel">
        
         <ul class="breadcrumbs">
             <li><a href="teacherhomepage.html"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a href="teachershowassign.html?cid=${cid }">作业管理</a> <span class="separator"></span></li>
            <li><a href="teachercheckassign.html?cid=${cid }">批改作业</a> <span class="separator"></span></li>
            <li><a href="teachercheckdescassign.html?cid=${cid }&aid=${aid}&head=${head}">${head}</a><span class="separator"></span></li>
			 <li ><a href="teachercheckperassign.html?cid=${cid }&aid=${aid}&gid=${gid}&head=${head}" id="username1"></a></li>
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
                <h5 id="assignhead"></h5>
                <h1 id="username"></h1>
            </div>
        </div><!--pageheader-->
        
        <div class="maincontent">
            <div class="maincontentinner">
            
                        <div class="widget">
            <h4 class="widgettitle" id="usergrade"></h4>
            <div class="widgetcontent nopadding">
          
                    
                        
                        <div class="stdform stdform2">
                            <p>
                                <label>作业标题</label>
                                <span class="field"><input type="text" name="assigntitle" id="assigntitle2" class="input-xxlarge" placeholder="第一次作业" readonly /></span>
                            </p>
                            
                            <p>
                                <label>截止日期</label>
                                <span class="field"><input type="text" name="stoptime" id="stoptime2" class="input-xxlarge" placeholder="2014.10.10 12:00" readonly /></span>
                            </p>
                            
                            <p>
                                <label>上交日期</label>
                                <span class="field"><input type="text" name="sendtime" id="sendtime2" class="input-xxlarge" placeholder="2014.10.10 12:00" readonly /></span>
                            </p>
                            
                            <p>
                                <label>作业内容 </label>
                                <span class="field"><textarea cols="80" rows="10" name="content" id="content2" class="span5"></textarea></span>
                            </p>
                            
							<p>
                                <label>作业分数</label>
                                <span class="field"><input type="text" name="grade" id="grade2" class="input-large" placeholder="97"  /></span>
                            </p>
                            <p>
                                <label>附件列表</label>
                                <span class="field">
									
									<input type="checkbox" /> lala.txt<br />
                                     <input type="checkbox" /> my.jpg<br/>
									<a href class="btn"><i class="iconsweets-link"></i>下载</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href class="btn btn-primary"><i class="iconsweets-magnifying iconsweets-white"></i>在线预览</a>
                               </span>
								
                            </p>
                                                    
                            <p class="stdformbutton">
                                <button onclick="submit_score_info()" class="btn btn-primary">确认</button>
                                <button type="reset" class="btn">取消</button>
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
