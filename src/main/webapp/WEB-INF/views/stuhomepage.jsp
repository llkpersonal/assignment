<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="stuheader.jsp">
	<c:param name="title" value="学生主页" />
</c:import>
    
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
                            <tr>
                                <td><a id="topic" href="stushowassign.html" data-placement="top" data-toggle="tooltip" data-original-title="Click me to view topic page">综合实践</a></td>
                                <td><a href="">逸夫601</a></td>
                                <td>罗夕</td>
                                <td>星期五 14:10~18:10</td>
                            </tr>
                            <tr>
                                <td><a href="stushowassign.html">操作系统</a></td>
                                <td><a href="">逸夫106</a></td>
                                <td>罗夕</td>
                                <td>星期二 10:10~12:00</td>
                            </tr>
                            <tr>
                                <td><a href="stushowassign.html">离散数学</a></td>
                                <td><a href="">逸夫104</a></td>
                                <td>罗夕</td>
                                <td>星期四 10:10~12:00</td>
                            </tr>
                            <tr>
                                <td><a href="stushowassign.html">算法</a></td>
                                <td><a href="">逸夫208</a></td>
                                <td>罗夕</td>
                                <td>星期二 14:10~16:00</td>
                            </tr>
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
