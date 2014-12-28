<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="stuheader.jsp">
	<c:param name="title" value="查看榜单" />
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
</head>

<body>


    <div class="rightpanel">
        
         <ul class="breadcrumbs">
            <li><a href="stuhomepage.html"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a href="stugrademan.html?cid=${cid}">成绩管理</a><span class="separator"></span></li>
           <li><a href="stugradedesc.html?aid=${aid }&cid=${cid}">查看详情</a></li>
             
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
                <h1>查看详情</h1>
            </div>
        </div><!--pageheader-->
        
        <div class="maincontent">
            <div class="maincontentinner">
            
                        <div class="widget">
            <h4 class="widgettitle">成绩详情</h4>
            <div class="widgetcontent nopadding">
          
                   
                        
                        <form class="stdform stdform2" method="post" action="stushowdescassign.html?aid=${aid }&cid=${cid}">
                            <p>
                                <label>作业标题</label>
                                <span class="field"><input type="text" name="assigntitle" id="assigntitle2" class="input-xxlarge" placeholder="${gradelist[0]}" readonly /></span>
                            </p>
                            
                            <p>
                                <label>起始日期</label>
                                <span class="field"><input type="text" name="stoptime" id="stoptime2" class="input-xxlarge" placeholder="${gradelist[1]}" readonly /></span>
                            </p>
                            
                            <p>
                                <label>截止日期</label>
                                <span class="field"><input type="text" name="sendtime" id="sendtime2" class="input-xxlarge" placeholder="${gradelist[2]}" readonly /></span>
                            </p>
                            
                            <p>
                                <label>作业要求 </label>
                                <span class="field"><textarea cols="80" rows="5" name="content" id="content2" class="span5">${gradelist[3]}</textarea></span>
                            </p>
                            
							<p>
                                <label>作业分数</label>
                                <span class="field"><input type="text" name="grade" id="grade2" class="input-large" placeholder="${gradelist[4]}"  /></span>
                            </p>
							<p>
                                <label>作业内容</label>
                                <span class="field"><textarea cols="80" rows="5" name="content" id="content2" class="span5">${gradelist[5]}</textarea></span>
                            </p>
                            <p>
                                <label>附件列表</label>
                                <span class="field">
									
									<c:forEach items="${list }" var="ls" >
									<a href="download/${ls.attachmentid }">${ls.filename }</a>
								</c:forEach>
								<br />
                               </span>
								
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

	
</body>
</html>
