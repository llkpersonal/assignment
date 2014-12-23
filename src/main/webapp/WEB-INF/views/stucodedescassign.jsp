<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="stuheader.jsp">
	<c:param name="title" value="查看编程作业" />
</c:import>

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
            <li><a href="stucodeassign.html">编程作业</a> <span class="separator"></span></li>
            <li><a href="stucodedescassign.html">第一次编程作业</a></li>
			 
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
                <h5>编程作业作业</h5>
                <h1>第一次编程作业</h1>
            </div>
        </div><!--pageheader-->
        <div class="maincontent">
            <div class="maincontentinner">
            <a href="stucodeperassign.html">
				<button class="btn btn-success btn-large">查看榜单</button></a>
                        <div class="widget">
            <h4 class="widgettitle">第一次编程作业</h4>
            <div class="widgetcontent nopadding">
          
                   
                        
                        <form class="stdform stdform2" method="post" action="stucodedescassign.html">
                            <p>
                                <label>作业标题</label>
                                <span class="field"><input type="text" name="assigntitle" id="assigntitle2" class="input-xxlarge" placeholder="第一次作业" readonly /></span>
                            </p>
                            
                            <p>
                                <label>开始日期</label>
                                <span class="field"><input type="text" name="stoptime" id="stoptime2" class="input-xxlarge" placeholder="2014.10.10 12:00" readonly /></span>
                            </p>
                            
                            <p>
                                <label>截止日期</label>
                                <span class="field"><input type="text" name="sendtime" id="sendtime2" class="input-xxlarge" placeholder="2014.10.10 12:00" readonly /></span>
                            </p>
                            <p>
                                <label>时间限制</label>
                                <span class="field"><input type="text" name="stoptime" id="stoptime2" class="input-xxlarge" placeholder="10000MS" readonly /></span>
                            </p>
                            
                            <p>
                                <label>空间限制</label>
                                <span class="field"><input type="text" name="sendtime" id="sendtime2" class="input-xxlarge" placeholder="1000k" readonly /></span>
                            </p>
                            <p>
                                <label>作业内容 </label>
                                <span class="field"><textarea cols="80" rows="10" name="content" id="content2" class="span7"></textarea></span>
                            </p>
                            
							
                            <p>
                                <label>附件列表</label>
                                <span class="field">
									
									<input type="checkbox" /> lala.txt<br />
                                     <input type="checkbox" /> my.jpg<br/>
									<a href class="btn"><i class="iconsweets-link"></i>下载</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href class="btn btn-primary"><i class="iconsweets-magnifying iconsweets-white"></i>在线预览</a>
                               </span>
								
                            </p>
                                                    
                          
                    </form>
            </div><!--widgetcontent-->
            </div><!--widget-->
            
         <div class="widget">
            <h4 class="widgettitle">提交代码</h4>
            <div class="widgetcontent nopadding">
				<form class="stdform stdform2" method="post" action="stucodedescassign.html">
				 <p>
                              <label>输入框</label>  
                                <span class="field">
									<textarea cols="80" rows="15" name="content" id="content2" class="span7"></textarea> 
					 <br/>
							<button class="btn btn-primary">提交</button>
                                <button type="reset" class="btn">重置</button>		
					 </span>	
					 
                            </p>
					
					</form>
            </div>
			 </div>
               
                
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
