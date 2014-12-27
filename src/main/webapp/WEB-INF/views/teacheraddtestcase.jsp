<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="teacherheader.jsp">
	<c:param name="title" value="作业管理系统/添加测试样例" />
</c:import>

<div class="rightpanel">
        
         <ul class="breadcrumbs">
            <li><a href="homepage.html"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a href="showassign.html">作业管理</a> <span class="separator"></span></li>
            <li><a href="codeassign.html">编程作业</a> <span class="separator"></span></li>
            <li><a href="showcodeassign.html">第一次编程作业</a><span class="separator"></span></li>
             <li><a href="showtestcase.html">测试样例</a><span class="separator"></span></li>
			<li><a href="addtestcase.html">添加测试样例</a></li>
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
                <h5>测试样例</h5>
                <h1>添加样例</h1>
            </div>
        </div><!--pageheader-->
        
        <div class="maincontent">
            <div class="maincontentinner">
            
                        <div class="widget">
            <h4 class="widgettitle">测试样例</h4>
            <div class="widgetcontent">
          
                   
                        
                        <form class="stdform" method="post" action="formaddtestcase">
                        	<input type="hidden" name="cid" value="${cid}" />
                        	<input type="hidden" name="pid" value="${pid}" />
                            <p>
                                <label>测试输入</label>
                                <span class="field"><textarea cols="80" rows="7" name="input" id="content2" class="span4"></textarea>
                                </span>
                                
                            </p>
                            <!--  div class="par">
                                <label>输入文件</label>
			                     <div class="fileupload fileupload-new" data-provides="fileupload">
				                <div class="input-append">
				                <div class="uneditable-input span3">
                                 <i class="iconfa-file fileupload-exists"></i>
                                <span class="fileupload-preview"></span>
				                </div>
				                <span class="btn btn-file"><span class="fileupload-new">附件</span>
                                    <span class="fileupload-exists">修改</span>
                                    <input type="file" name="fileinput"/></span>
                                    <a href="#" class="btn fileupload-exists" data-dismiss="fileupload">移除</a>
				                </div>
                                </div>
			                 </div-->

                            <p>
                                <label>测试输出</label>
                                <span class="field"><textarea cols="80" rows="7" name="output" id="content2" class="span4"></textarea></span>
                                
                            </p>
                            
                            <!-- div class="par">
                                <label>输出文件</label>
			                     <div class="fileupload fileupload-new" data-provides="fileupload">
				                <div class="input-append">
				                <div class="uneditable-input span3">
                                 <i class="iconfa-file fileupload-exists"></i>
                                <span class="fileupload-preview"></span>
				                </div>
				                <span class="btn btn-file"><span class="fileupload-new">附件</span>
                                    <span class="fileupload-exists">修改</span>
                                    <input type="file" name="outputfile"/></span>
                                    <a href="#" class="btn fileupload-exists" data-dismiss="fileupload">移除</a>
				                </div>
                                </div>
			                 </div -->
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