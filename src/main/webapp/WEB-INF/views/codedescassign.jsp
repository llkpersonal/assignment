<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="teacherheader.jsp">
	<c:param name="title" value="作业管理系统/查看具体提交" />
</c:import>

<div class="rightpanel">
        
         <ul class="breadcrumbs">
            <li><a href="homepage.html"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a href="showassign.html">作业管理</a> <span class="separator"></span></li>
            <li><a href="codeassign.html">编程作业</a> <span class="separator"></span></li>
            <li><a href="codedescassign.html">第一次作业</a></li>
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
                <h1>第一次作业</h1>
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
                        <col class="con1" />
                        <col class="con0" />
                    </colgroup>
                    <thead>
                        <tr>
                          	<th class="head0 nosort"><input type="checkbox" class="checkall" /></th>
                            <th class="head0 center">作业标题</th>
                            <th class="head1 center">起始日期</th>
                            <th class="head0 center">截止日期</th>
							<th class="head1 center">上交时间</th>
							<th class="head0 center">姓名</th>
                            <th class="head1 center">分数/状态</th>
                          
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${submissionList}" var="submit">
                        <tr class="gradeX">
                          <td class="aligncenter"><span class="center">
                            <input type="checkbox" />
                          </span></td>
                            <td class="center">${submit[0] }</td>
                            <td class="center">${submit[1] }</td>
                            <td class="center">${submit[2] }</td>
							<td class="center">${submit[3] }</td>
							<td class="center">${submit[4] }</td>

                            <td class="center">
								<a href="codeperassign.html">${submit[5] }</a>
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
