<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="stuheader.jsp">
	<c:param name="title" value="编程作业" />
</c:import>
<link rel="stylesheet" href="css/fontandcolor.css" type="text/css" />
<link rel="stylesheet" href="css/bootstrap-fileupload.min.css" type="text/css" />
<link rel="stylesheet" href="css/bootstrap-timepicker.min.css" type="text/css" />
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/bootstrap-fileupload.min.js"></script>
<script type="text/javascript" src="js/bootstrap-timepicker.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<script type="text/javascript" src="js/jquery.tagsinput.min.js"></script>
<script type="text/javascript" src="js/jquery.autogrow-textarea.js"></script>
<script type="text/javascript" src="js/charCount.js"></script>
<script type="text/javascript" src="js/colorpicker.js"></script>
<script type="text/javascript" src="js/ui.spinner.min.js"></script>
<script type="text/javascript" src="js/chosen.jquery.min.js"></script>
<script type="text/javascript" src="js/forms.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function(){
        // dynamic table
        jQuery('#dyntable').dataTable({
            "sPaginationType": "full_numbers",
            "aaSortingFixed": [[0,'asc']],
            "fnDrawCallback": function(oSettings) {
                jQuery.uniform.update();
            }
        });
        
        jQuery('#dyntable2').dataTable( {
            "bScrollInfinite": true,
            "bScrollCollapse": true,
            "sScrollY": "300px"
        });
        
    });
	
</script>

    <div class="rightpanel">
        
         <ul class="breadcrumbs">
            <li><a href="stuhomepage.html"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a href="stushowassign.html">作业管理</a> <span class="separator"></span></li>
            <li><a href="stucodeassign.html">编程作业</a>></li>
             
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
                <h1>编程作业</h1>
            </div>
        </div><!--pageheader-->
        
        <div class="maincontent">
            <div class="maincontentinner">
				<a href="stucodeperassign.html">
				<button class="btn btn-success btn-large">查看榜单</button></a>
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
							<th class="head1 center">时间限制</th>
							<th class="head0 center">空间限制</th>
							
                            <th class="head1 center">状态/分数</th>
                            <th class="head0 center">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="gradeX">
                          <td class="aligncenter"><span class="center">
                            <input type="checkbox" />
                          </span></td>
                            <td class="center">第一次作业</td>
                            <td class="center">2014.10.10</td>
                            <td class="center">2014.10.28</td>
							<td class="center">1000MS</td>
							<td class="center">10000K</td>
							<td class="center">未提交</td>
							
                            <td class="center">
								<a href="stucodedescassign.html">查看</a>
								</td>
                        
                        </tr>
                        <tr class="gradeC">
                          <td class="aligncenter"><span class="center">
                            <input type="checkbox" />
                          </span></td>
                            <td class="center">第一次作业</td>
                            <td class="center">2014.10.10</td>
                            <td class="center">2014.10.28</td>
							<td class="center">1000MS</td>
							<td class="center">10000K</td>
							<td class="center">Wrong Answer-90</td>
							
                            <td class="center">
								<a href="stucodedescassign.html">查看</a>
								</td>
                        
                        </tr>
                        <tr class="gradeA">
                          <td class="aligncenter"><span class="center">
                            <input type="checkbox" />
                          </span></td>
                            <td class="center">第一次作业</td>
                            <td class="center">2014.10.10</td>
                            <td class="center">2014.10.28</td>
							<td class="center">1000MS</td>
							<td class="center">10000K</td>
							<td class="center">Wrong Answer-90</td>
							
                           <td class="center">
								<a href="stucodedescassign.html">查看</a>
								</td>
                        
                        </tr>
                        <tr class="gradeA">
                         <td class="aligncenter"><span class="center">
                            <input type="checkbox" />
                          </span></td>
                            <td class="center">第一次作业</td>
                            <td class="center">2014.10.10</td>
                            <td class="center">2014.10.28</td>
							<td class="center">1000MS</td>
							<td class="center">10000K</td>
							<td class="center">Wrong Answer-90</td>
							
                           <td class="center">
								<a href="stucodedescassign.html">查看</a>
								</td>
                        
                        </tr>
                        <tr class="gradeA">
                         <td class="aligncenter"><span class="center">
                            <input type="checkbox" />
                          </span></td>
                            <td class="center">第一次作业</td>
                            <td class="center">2014.10.10</td>
                            <td class="center">2014.10.28</td>
							<td class="center">1000MS</td>
							<td class="center">10000K</td>
							
							<td class="center">Wrong Answer-90</td>
                            <td class="center">
								<a href="stucodedescassign.html">查看</a>
								</td>
                        
                        </tr>
                        <tr class="gradeA">
                         
                          <td class="aligncenter"><span class="center">
                            <input type="checkbox" />
                          </span></td>
                            <td class="center">第一次作业</td>
                            <td class="center">2014.10.10</td>
                            <td class="center">2014.10.28</td>
							<td class="center">1000MS</td>
							<td class="center">10000K</td>
							
							<td class="center">Wrong Answer-90</td>
                           <td class="center">
								<a href="stucodedescassign.html">查看</a>
								</td>
                        
                        </tr>
                        <tr class="gradeA">
                          <td class="aligncenter"><span class="center">
                            <input type="checkbox" />
                          </span></td>
                            <td class="center">第一次作业</td>
                            <td class="center">2014.10.10</td>
                            <td class="center">2014.10.28</td>
							<td class="center">1000MS</td>
							<td class="center">10000K</td>
							
							<td class="center">Wrong Answer-90</td>
                          <td class="center">
								<a href="stucodedescassign.html">查看</a>
								</td>
                        
                        </tr>
                        <tr class="gradeA">
                          <td class="aligncenter"><span class="center">
                            <input type="checkbox" />
                          </span></td>
                            <td class="center">第一次作业</td>
                            <td class="center">2014.10.10</td>
                            <td class="center">2014.10.28</td>
							<td class="center">1000MS</td>
							<td class="center">10000K</td>
							<td class="center">Wrong Answer-90</td>
							<td class="center">
								<a href="stucodedescassign.html">查看</a>
								</td>
                        
                        </tr>
                        <tr class="gradeA">
                         <td class="aligncenter"><span class="center">
                            <input type="checkbox" />
                          </span></td>
                            <td class="center">第一次作业</td>
                            <td class="center">2014.10.10</td>
                            <td class="center">2014.10.28</td>
							<td class="center">1000MS</td>
							<td class="center">10000K</td>
							<td class="center">Wrong Answer-90</td>
							
                           <td class="center">
								<a href="stucodedescassign.html">查看</a>
								</td>
                        
                        </tr>
                        <tr class="gradeA">
                        <td class="aligncenter"><span class="center">
                            <input type="checkbox" />
                          </span></td>
                            <td class="center">第一次作业</td>
                            <td class="center">2014.10.10</td>
                            <td class="center">2014.10.28</td>
							<td class="center">1000MS</td>
							<td class="center">10000K</td>
							<td class="center">Wrong Answer-90</td>
							
                           <td class="center">
								<a href="stucodedescassign.html">查看</a>
								</td>
                        
                        </tr>
                        <tr class="gradeA">
                          <td class="aligncenter"><span class="center">
                            <input type="checkbox" />
                          </span></td>
                            <td class="center">第一次作业</td>
                            <td class="center">2014.10.10</td>
                            <td class="center">2014.10.28</td>
							<td class="center">1000MS</td>
							<td class="center">10000K</td>
							<td class="center">Wrong Answer-90</td>
							
                          <td class="center">
								<a href="stucodedescassign.html">查看</a>
								</td>
                        
                        </tr>
                        <tr class="gradeA">
                          <td class="aligncenter"><span class="center">
                            <input type="checkbox" />
                          </span></td>
                            <td class="center">第一次作业</td>
                            <td class="center">2014.10.10</td>
                            <td class="center">2014.10.28</td>
							<td class="center">1000MS</td>
							<td class="center">10000K</td>
							<td class="center">Wrong Answer-90</td>
							<td class="center">
								<a href="stucodedescassign.html">查看</a>
								</td>
                        
                        </tr>
                       
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
