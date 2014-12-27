<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="teacherheader.jsp">
	<c:param name="title" value="作业管理系统/查看编程作业" />
</c:import>
<div class="rightpanel">
        
         <ul class="breadcrumbs">
            <li><a href="homepage.html"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a href="showassign.html">作业管理</a> <span class="separator"></span></li>
            <li><a href="codeassign.html">编程作业</a> <span class="separator"></span></li>
            <li><a href="showcodeassign.html">${pb[0] }</a></li>
			
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
                <h5>编程作业</h5>
                <h1>${pb[0] }</h1>
            </div>
        </div><!--pageheader-->
        
        <div class="maincontent">
            <div class="maincontentinner">
            
                        <div class="widget">
            <h4 class="widgettitle">${pb[0] }</h4>
            <div class="widgetcontent nopadding">
          
                   
                        
                        <form class="stdform stdform2" method="post" action="checkperassign.html">
                            <p>
                                <label>作业标题</label>
                                <span class="field"><input type="text" name="assigntitle" id="assigntitle2" class="input-xxlarge" value="${pb[0] }" readonly /></span>
                            </p>
                            
                            <p>
                                <label>开始日期</label>
                                <span class="field"><input type="text" name="stoptime" id="stoptime2" class="input-xxlarge" value="${pb[4] }" readonly /></span>
                            </p>
                            
                            <p>
                                <label>截止日期</label>
                                <span class="field"><input type="text" name="sendtime" id="sendtime2" class="input-xxlarge" value="${pb[5] }" readonly /></span>
                            </p>
                            <p>
                                <label>时间限制</label>
                                <span class="field"><input type="text" name="stoptime" id="stoptime2" class="input-xxlarge" value="${pb[2] }MS" readonly /></span>
                            </p>
                            
                            <p>
                                <label>空间限制</label>
                                <span class="field"><input type="text" name="sendtime" id="sendtime2" class="input-xxlarge" value="${pb[3] }KB" readonly /></span>
                            </p>
                            <p>
                                <label>作业内容 </label>
                                <span class="field"><textarea cols="80" rows="10" name="content" id="content2" class="span7">${pb[1] }</textarea></span>
                            </p>
                    
                          
                    </form>
                
            </div><!--widgetcontent-->
            </div><!--widget-->
            
         <a href="showtestcase.html?cid=${cid }&pid=${pid}"><button class="btn btn-primary">测试样例</button></a>
            
               
                
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
