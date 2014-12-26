<%@ page language="java" contentType="text/html; utf-8"
    pageEncoding="utf-8"%>
<%@ page isELIgnored = "false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="teacherheader.jsp">
	<c:param name="title" value="作业管理系统/批改作业" />
</c:import>
<div class="rightpanel">
        
         <ul class="breadcrumbs">
            <li><a href="teacherhomepage.html"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a href="teachershowassign.html?cid=${cid }">作业管理</a> <span class="separator"></span></li>
            <li><a href="teachercheckassign.html?cid=${cid }">批改作业</a></li>
             
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
                <h1>批改作业</h1>
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
							<th class="head1 center">学生总人数</th>
							<th class="head0 center">上交总人数</th>
                            <th class="head1 center">未批改</th>
                            <th class="head0 center">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach items="${checklist}" var="check">
                    		<tr class="gradeX">
                          <td class="aligncenter"><span class="center">
                            <input type="checkbox" />
                          </span></td>
                            <td class="center">${check[2]}</td>
                            <td class="center">${check[3]}</td>
                            <td class="center">${check[4]}</td>
							<td class="center">${check[5]}</td>
							<td class="center">${check[6]}</td>
							<td class="center">${check[7]}</td>
                            <td class="center">
								<a href="teachercheckdescassign.html?cid=${cid}&aid=${check[0]}&head=${check[2] } ">批改</a>
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
