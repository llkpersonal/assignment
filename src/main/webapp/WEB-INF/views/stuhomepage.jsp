<%@ page isELIgnored="false"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>${param.title }</title>
<link rel="stylesheet" href="css/style.default.css" type="text/css" />

<link rel="stylesheet" href="css/responsive-tables.css">
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/jquery-migrate-1.1.1.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.9.2.min.js"></script>
<script type="text/javascript" src="js/modernizr.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script type="text/javascript" src="js/jquery.uniform.min.js"></script>
<script type="text/javascript" src="js/flot/jquery.flot.min.js"></script>
<script type="text/javascript" src="js/flot/jquery.flot.resize.min.js"></script>
<script type="text/javascript" src="js/responsive-tables.js"></script>
<script type="text/javascript" src="js/custom.js"></script>


<link rel="stylesheet" href="css/fontandcolor.css" type="text/css" />
<link rel="stylesheet" href="css/bootstrap-fileupload.min.css" type="text/css" />
<link rel="stylesheet" href="css/bootstrap-timepicker.min.css" type="text/css" />
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/bootstrap-fileupload.min.js"></script>
<script type="text/javascript" src="js/bootstrap-timepicker.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<script type="text/javascript" src="js/jquery.tagsinput.min.js"></script>
<script type="text/javascript" src="js/jquery.autogrow-textarea.js"></script>
<script type="text/javascript" src="js/fullcalendar.min.js"></script>
<script type="text/javascript" src="js/charCount.js"></script>
<script type="text/javascript" src="js/colorpicker.js"></script>
<script type="text/javascript" src="js/ui.spinner.min.js"></script>
<script type="text/javascript" src="js/chosen.jquery.min.js"></script>
<script type="text/javascript" src="js/forms.js"></script>
<!--[if lte IE 8]><script language="javascript" type="text/javascript" src="js/excanvas.min.js"></script><![endif]-->
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
</head>

<body>

<div class="mainwrapper">
    
    <div class="header">
        <div class="logo">
            <a href="stuhomepage.html"><img src="images/logo1.png" alt="" /></a>
        </div>
        <div class="headerinner">
            <ul class="headmenu">
                <li class="odd">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <span class="count">4</span>
                        <span class="head-icon head-message"></span>
                        <span class="headmenu-label">信息</span>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="nav-header">信息</li>
                        <li><a href=""><span class="icon-envelope"></span> 新信息来自 <strong>Jack</strong> <small class="muted"> - 19 hours ago</small></a></li>
                        <li><a href=""><span class="icon-envelope"></span> 新信息来自 <strong>Daniel</strong> <small class="muted"> - 2 days ago</small></a></li>
                        <li><a href=""><span class="icon-envelope"></span> 新信息来自 <strong>Jane</strong> <small class="muted"> - 3 days ago</small></a></li>
                        <li><a href=""><span class="icon-envelope"></span> 新信息来自 <strong>Tanya</strong> <small class="muted"> - 1 week ago</small></a></li>
                        <li><a href=""><span class="icon-envelope"></span> 新信息来自 <strong>Lee</strong> <small class="muted"> - 1 week ago</small></a></li>
                        <li class="viewmore"><a href="stuappealman.html">查看更多</a></li>
                    </ul>
                </li>
                <li>
                    <a class="dropdown-toggle" data-toggle="dropdown" data-target="#">
                    <span class="count">10</span>
                    <span class="head-icon head-event"></span>
                    <span class="headmenu-label">日历</span>
                    </a>
                    <ul class="dropdown-menu newusers">
                        <li class="nav-header">日历</li>
                        <li>
                            <a href="">
                                
                                <strong>Draniem Daamul</strong>
                                <small>April 20, 2013</small>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                
                                <strong>Shamcey Sindilmaca</strong>
                                <small>April 19, 2013</small>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                
                                <strong>Nusja Paul Nawancali</strong>
                                <small>April 19, 2013</small>
                            </a>
                        </li>
                        <li>
                            <a href="">
                               
                                <strong>Rose Cerona</strong>
                                <small>April 18, 2013</small>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                
                                <strong>John Doe</strong>
                                <small>April 16, 2013</small>
                            </a>
                        </li>
                    </ul>
                </li>
               <%
        			Cookie [] cookies = request.getCookies();
        			String name = "" , username="";
        			for(int i=0;i<cookies.length;i++){
        				if( cookies[i].getName().equals("name") ){
        					name = cookies[i].getValue();
        				} else if( cookies[i].getName().equals("username") ){
        					username = cookies[i].getValue();
        				}
       			 	}
       			 %>
                <li class="right">
                    <div class="userloggedinfo">
                        <img src="images/photos/1.jpg" alt="" />
                        <div class="userinfo">
                            <h5><% out.println(URLDecoder.decode(name)); %>  <small>- <% out.println(username); %></small></h5>
                            <ul>
                                <li><a href="">学生</a></li>
                                <li><a href="stupersoninfo.html">修改资料</a></li>
                                <li><a href="logout">注销</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
            </ul><!--headmenu-->
        </div>
    </div>
    
    <div class="leftpanel">
        <%
        	String uri = request.getRequestURI();
        %>
        <div class="leftmenu">        
            <ul class="nav nav-tabs nav-stacked">
            	<li class="nav-header">导航</li>
                <li <%if(uri.indexOf("stuhomepage")!=-1) out.print("class=\"active\""); %>><a href="stuhomepage"><span class="iconfa-laptop"></span> 主页</a></li>         
                <li <%if(uri.indexOf("stuappealman")!=-1) out.print("class=\"active\""); %>><a href="stuappealman"><span class="iconfa-envelope"></span> 申诉处理</a></li>
                <li <%if(uri.indexOf("stucalendar")!=-1) out.print("class=\"active\""); %>><a href="showstucalendar"><span class="iconfa-calendar"></span>日历</a></li>

            </ul>
        </div><!--leftmenu-->
        
    </div><!-- leftpanel -->
    
    <div class="rightpanel">
        
        <ul class="breadcrumbs">
            <li><a href="stuhomepage.html"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li>主页</li>
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
            <div class="pageicon"><span class="iconfa-laptop"></span></div>
            <div class="pagetitle">
                <h5>所有功能的入口</h5>
                <h1>学生主页</h1>
            </div>
        </div><!--pageheader-->
        
         <div class="maincontent">
            <div class="maincontentinner">
            
            <div class="row-fluid">
                
                <div class="span9">
                    <h3 class="subtitle2">选择课程</h3>
                    <br />
                    <table class="table discussions">
                        <colgroup>
                            <col class="width45" />
                            <col class="width15" />
                            <col class="width10" />
                            <col class="width20" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>课程名</th>
                                <th>上课地点</th>
                                <th>授课老师</th>
                                <th>上课时间</th>    
                            </tr>
                        </thead>
                        <tbody>
                        
                     		<c:forEach items="${courselist}" var="course">
                     			<tr>
                                <td><a id="topic" href="stushowassign.html?cid=${course[4]}" data-placement="top" data-toggle="tooltip" data-original-title="Click me to view topic page">${course[0] }</a></td>
                                <td><a href="stushowassign.html?cid=${course[4]}">${course[1] }</a></td>
                                <td>${course[2] }</td>
                                <td>${course[3] }</td>
                            </tr>
                     		</c:forEach>
                            </tbody>
                        </table>
                            
                        <br /><br />
                            
                     
                </div><!--span9-->
                
                <div class="span3">
                    <div class="alert">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        <h4>通知</h4>
                        <div class="divider15"></div>
                        <p>要写作业呀呀呀呀</p>
                    </div>
                    
                    <br />
                         
                               
                </div><!--span3-->
                
            </div><!--row-fluid-->
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
<script type="text/javascript">
    jQuery(document).ready(function() {
        
      // simple chart
		var flash = [[0, 11], [1, 9], [2,12], [3, 8], [4, 7], [5, 3], [6, 1]];
		var html5 = [[0, 5], [1, 4], [2,4], [3, 1], [4, 9], [5, 10], [6, 13]];
      var css3 = [[0, 6], [1, 1], [2,9], [3, 12], [4, 10], [5, 12], [6, 11]];
			
		function showTooltip(x, y, contents) {
			jQuery('<div id="tooltip" class="tooltipflot">' + contents + '</div>').css( {
				position: 'absolute',
				display: 'none',
				top: y + 5,
				left: x + 5
			}).appendTo("body").fadeIn(200);
		}
	
			
		var plot = jQuery.plot(jQuery("#chartplace"),
			   [ { data: flash, label: "Flash(x)", color: "#6fad04"},
              { data: html5, label: "HTML5(x)", color: "#06c"},
              { data: css3, label: "CSS3", color: "#666"} ], {
				   series: {
					   lines: { show: true, fill: true, fillColor: { colors: [ { opacity: 0.05 }, { opacity: 0.15 } ] } },
					   points: { show: true }
				   },
				   legend: { position: 'nw'},
				   grid: { hoverable: true, clickable: true, borderColor: '#666', borderWidth: 2, labelMargin: 10 },
				   yaxis: { min: 0, max: 15 }
				 });
		
		var previousPoint = null;
		jQuery("#chartplace").bind("plothover", function (event, pos, item) {
			jQuery("#x").text(pos.x.toFixed(2));
			jQuery("#y").text(pos.y.toFixed(2));
			
			if(item) {
				if (previousPoint != item.dataIndex) {
					previousPoint = item.dataIndex;
						
					jQuery("#tooltip").remove();
					var x = item.datapoint[0].toFixed(2),
					y = item.datapoint[1].toFixed(2);
						
					showTooltip(item.pageX, item.pageY,
									item.series.label + " of " + x + " = " + y);
				}
			
			} else {
			   jQuery("#tooltip").remove();
			   previousPoint = null;            
			}
		
		});
		
		jQuery("#chartplace").bind("plotclick", function (event, pos, item) {
			if (item) {
				jQuery("#clickdata").text("You clicked point " + item.dataIndex + " in " + item.series.label + ".");
				plot.highlight(item.series, item.datapoint);
			}
		});
    
        
        //datepicker
        jQuery('#datepicker').datepicker();
        
        // tabbed widget
        jQuery('.tabbedwidget').tabs();
        
        
    
    });
</script>
</body>
</html>
