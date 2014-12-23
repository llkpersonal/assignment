<%@ page language="java" contentType="text/html; utf-8"
    pageEncoding="utf-8"%>
<%@ page isELIgnored = "false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="teacherheader.jsp">
	<c:param name="title" value="作业管理系统/查看作业" />
</c:import>
<div class="rightpanel">
        
         <ul class="breadcrumbs">
            <li><a href="teacherhomepage.html"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a href="teachergiveassign.html">作业管理</a> <span class="separator"></span></li>
            <li><a href="teachershowassign.html">查看作业</a></li>
            
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
								<a data-toggle="modal" data-target="#seeModal">查看</a>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a data-toggle="modal" data-target="#modifyModal">修改</a>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a data-toggle="modal" data-target="#deleteModal">删除</a></td>
                        
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
	<!-- seeModal -->
<div class="modal fade" id="seeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">

       <h3 class="modal-title myfont" id="myModalLabel">查看作业</h3>
      </div>
      <div class="modal-body myfont">
		    <table class="table table-bordered">
                  
         <tr>
                            <td class="center">作业标题</td>
                            <td class="center">第一次作业</td>
                          
                        </tr>
		  <tr>
                        
                            <td class="center">作业内容</td>
                            <td class="center"><textarea cols="50" rows="5" class="span5" readonly>lala</textarea></td>
                          
                            
                        </tr>
			  <tr>
                      
                            <td class="center">截止日期</td>
                            <td class="center">2014.12.10</td>
                          
                            
                        </tr>
			  <tr>
                       
                            <td class="center">截止时间</td>
                            <td class="center">12:30</td>
                          
                            
                        </tr>
			  <tr>
                       
                            <td class="center">附件名称</td>
                            <td class="center">啦啦啦.txt</td>
                          
                            
                        </tr>
             </table>         
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default myfont" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary myfont">确定</button>
      </div>
    </div>
  </div>
</div>
	
	<!-- modifyModal -->
<div class="modal fade" id="modifyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
       <h3 class="modal-title myfont" id="myModalLabel">修改作业</h3>
      </div>
      <div class="modal-body myfont">
       
                        <p>
                        	<label>作业标题</label>
                            <span class="field"><input type="text" name="input4" class="input-xlarge" /></span>
                        </p>
                       
                        <p>
                            <label>作业内容</label>
                            <span class="field"><textarea cols="80" rows="5" class="span5"></textarea></span> 
                        </p>
			<div class="par">
                            <label>截止日期</label>
                            <span class="field"><input id="datepicker" type="text" name="date" class="input-small" />eg:2014.10.10</span>
							
                        </div> 
                         
                        <div class="par">
                            <label>截止时间</label>
                            <div class="input-append bootstrap-timepicker">
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
                        
          
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default myfont" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary myfont">确定</button>
      </div>
    </div>
  </div>
</div>
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
        <button type="button" class="btn btn-primary myfont">确定</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>
