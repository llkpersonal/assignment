<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="teacherheader.jsp">
	<c:param name="title" value="作业管理系统/测试样例" />
</c:import>

<script>
var global_tid = 0;

function set_delete_tid(tid){
	global_tid = tid;
}

function execute_delete(){
	jQuery.ajax({
		type:"GET",
		url : "deletetestcase?tid="+global_tid,
		dataType:"json",
		success: function(data){
			location.reload();
		}
	});
}
</script>

<div class="rightpanel">
        
         <ul class="breadcrumbs">
            <li><a href="#"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a href="#">作业管理</a> <span class="separator"></span></li>
            <li><a href="#">编程作业</a> <span class="separator"></span></li>
            <li><a href="#">次编程作业</a><span class="separator"></span></li>
             <li><a href="#">测试样例</a></li>
			
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
                <h1>测试样例</h1>
            </div>
        </div><!--pageheader-->
        
        <div class="maincontent">
            <div class="maincontentinner">
                <a href="addtestcase.html?cid=${cid}&pid=${pid}">
            <button class="btn btn-success btn-large">添加测试用例</button></a>

                <h4 class="widgettitle">样例列表</h4>
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
                            <th class="head0 center">序号</th>
                            <th class="head1 center">测试输入</th>
                            <th class="head0 center">测试输出</th>
							
                            <th class="head1 center">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    <% int i=1; %>
                    <c:forEach items="${list }" var="ls">
                        <tr class="gradeX">
                          <td class="aligncenter"><span class="center">
                            <input type="checkbox" />
                          </span></td>
                            <td class="center"><% out.println(i); i++; %></td>
                            <td class="center"><textarea rows='7'>${ls.input}</textarea></td>
                            <td class="center"><textarea rows='7'>${ls.output}</textarea></td>
							<td class="center"><a data-toggle="modal" onclick="set_delete_tid(${ls.tid})" data-target="#deleteModal">删除</a></td>
                        
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

	<!-- deleteModal -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
       <h3 class="modal-title myfont" id="myModalLabel">删除作业</h3>
      </div>
      <div class="modal-body myfont">
        <h5>请问您确认删除吗？</h5>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default myfont" data-dismiss="modal">关闭</button>
        <button type="button" onclick="execute_delete()" class="btn btn-primary myfont">确定</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>
