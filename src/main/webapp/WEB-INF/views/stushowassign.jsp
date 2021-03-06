<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="stuheader.jsp">
	<c:param name="title" value="作业管理" />
</c:import>

    <div class="rightpanel">
        
         <ul class="breadcrumbs">
            <li><a href="stuhomepage.html"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a href="stushowassign.html?cid=${cid}">作业管理</a> <span class="separator"></span></li>
            <li><a href="stushowassign.html?cid=${cid}">查看/提交作业</a>></li>
             
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
                <h5>作业管理</h5>
                <h1>查看作业</h1>
            </div>
        </div><!--pageheader-->
        
        <div class="maincontent">
            <div class="maincontentinner">
            
                <h4 class="widgettitle">作业列表</h4>
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
                          	<th class="head0 nosort"><input type="checkbox" class="checkall" /></th>
                            <th class="head0 center">作业标题</th>
                            <th class="head1 center">起始日期</th>
                            <th class="head0 center">截止日期</th>
							
                            <th class="head1 center">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${assignlist}" var="assign" >
                    		<tr class="gradeA">
                          <td class="aligncenter"><span class="center">
                            <input type="checkbox" />
                          </span></td>
                            <td class="center">${assign[0] }</td>
                            <td class="center">${assign[2] }</td>
                            <td class="center">${assign[3] }</td>
                            <td class="center">
                            
                                <a id="topic" href="stushowdescassign.html?aid=${assign[4]}&cid=${cid}" data-placement="top" data-toggle="tooltip" data-original-title="Click me to view topic page">查看</a>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <!-- 
								<c:choose>
									<c:when test="${desc[5]==0 }">修改</c:when>
									<c:otherwise></c:otherwise>
								</c:choose>
								</a>
								</td>-->
                                <a href="stugiveassign.html?aid=${assign[4]}&cid=${cid}">提交</a>
                                
                                <!--<a href="stugiveassign.html?aid=${assign[4]}&cid=${cid}">修改</a>-->
			                </td>
                        
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

	
</body>
</html>
