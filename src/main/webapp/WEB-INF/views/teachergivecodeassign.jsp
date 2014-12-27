<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="teacherheader.jsp">
	<c:param name="title" value="作业管理系统/添加编程作业" />
</c:import>

<div class="rightpanel">
        
        <ul class="breadcrumbs">
            <li><a href="homepage.html"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a href="giveassign.html">作业管理</a> <span class="separator"></span></li>
			<li><a href="codeassign.html">编程作业</a> <span class="separator"></span></li>
            <li><a href="givecodeassign.html">添加编程作业</a></li>
            
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
                <h5>编程作业</h5>
                <h1>添加编程作业</h1>
            </div>
        </div><!--pageheader-->
        
        <div class="maincontent">
            <div class="maincontentinner">
            
            <div class="widget">
            <h4 class="widgettitle">添加编程作业</h4>
            <div class="widgetcontent">
                <form class="stdform" action="formaddcodeassign" method="post">
                   
                        <input type="hidden" name="cid" value="${cid }" />
                        <p>
                        	<label>作业标题</label>
                            <span class="field"><input type="text" name="title" class="input-xlarge" /></span>
                        </p>
					<p>
                        	<label>时间限制</label>
                            <span class="field"><input type="text" name="timelimit" class="input-xlarge" /></span>
                        </p>
					<p>
                        	<label>空间限制</label>
                            <span class="field"><input type="text" name="memorylimit" class="input-xlarge" /></span>
                        </p>
                       
                        <p>
                            <label>作业内容</label>
                            <span class="field"><textarea cols="80" rows="18" name="description" class="span7"></textarea></span> 
                        </p>
			
			
                        <div class="par">
                            <label>截止日期</label>
                            <span class="field"><input id="datepicker" type="text" name="date" class="input-small" /></span>
                        </div> 
                         
                        <div class="par">
                            <label>截止时间</label>
                            <div class="input-append bootstrap-timepicker">
				<input id="timepicker1" type="text" class="input-small" name="time" />
				<span class="add-on"><i class="iconfa-time"></i></span>
			    </div>
                        </div>
                        
                      <p class="stdformbutton">
                                <button type="submit" class="btn btn-primary">添加</button>
                                <button type="reset" class="btn">重置</button>
                            </p>  
                        
                </form>
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
