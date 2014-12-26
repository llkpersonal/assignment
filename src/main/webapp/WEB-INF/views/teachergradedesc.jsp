<%@ page language="java" contentType="text/html; utf-8"
    pageEncoding="utf-8"%>
<%@ page isELIgnored = "false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="teacherheader.jsp">
	<c:param name="title" value="作业管理系统/成绩详情" />
</c:import>

<div class="rightpanel">
        
         <ul class="breadcrumbs">
            <li><a href="teacherhomepage.html"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a href="teachergrademan.html?cid=${cid}">成绩管理</a><span class="separator"></span></li>
           <li><a href="teachergradedesc.html?cid=${cid }&aid=${aid}&head=${head}">成绩详情</a></li>
             
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
                <h5>成绩管理</h5>
                <h1>成绩详情</h1>
            </div>
        </div><!--pageheader-->
        
        <div class="maincontent">
            <div class="maincontentinner">
            
                <h4 class="widgettitle">${head}</h4>
                <table id="dyntable" class="table table-bordered responsive">
                    <colgroup>
                        <col class="con0" style="align: center; width: 4%" />
                        <col class="con1" />
                        <col class="con0" />
                        <col class="con1" />
                        
                        
                    </colgroup>
                    <thead>
                        <tr>
                          	<th class="head0 nosort"><input type="checkbox" class="checkall" /></th>
                            <th class="head0 center">学生姓名</th>
                            <th class="head1 center">分数</th>
                            <th class="head1 center">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach items="${desclist }" var="desc" >
                    		<tr class="gradeA">
                          <td class="aligncenter"><span class="center">
                            <input type="checkbox" />
                          </span></td>
                            <td class="center">${desc[0] }的作业</td>
                            
							<td class="center">${desc[1]}</td>
							<td class="center">
								<a href="teachercheckperassign.html?cid=${cid }&aid=${aid}&gid=${desc[4]}">修改</a>
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
