<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="stuheader.jsp">
	<c:param name="title" value="申诉处理/发件箱" />
</c:import>
<script type="text/javascript">
jQuery(document).ready(function(){
    jQuery('.msglist li').click(function(){
        jQuery('.msglist li').each(function(){ jQuery(this).removeClass('selected')});
        jQuery(this).addClass('selected');
        
        // for mobile
        jQuery('.msglist').click(function(){
            if(jQuery(window).width() < 480) {
                jQuery('.messageright, .messagemenu .back').show();
                jQuery('.messageleft').hide();
            }
        });
        
        jQuery('.messagemenu .back').click(function(){
            if(jQuery(window).width() < 480) {
                jQuery('.messageright, .messagemenu .back').hide();
                jQuery('.messageleft').show();
            }
        });
    });
});

function display_message(mid){
	jQuery.ajax({
		type:"GET",
		url : "getstumsginfo?mid="+mid,
		dataType:"json",
		success: function(data){
			jQuery("#msgtime").text(1900+data[2]["year"]+"/"+(1+data[2]["month"])+"/"+data[2]["date"]);
			jQuery("#msguser").text(data[6]);
			jQuery("#msgreceiver").text(data[3]);
			jQuery("#msgsender").text(data[4]);
			jQuery("#msgcontent").text(data[1]);
		}
	});
}

jQuery(document).ready(function(){
	jQuery("#btn_send").click(function(){
		var receivername = jQuery("#receivername").val(), messagecontent = jQuery("#messagecontent").val();
		//alert(receiver+messagecontent);
		jQuery.ajax({
			type : "POST",
			url : "stusendamessage",
			dataType : "json",
			
			data : {
				"receivername" : receivername,
				"messagecontent" : messagecontent,
			},
			success : function(data) {
				if (data["status"] == "failed") {
					alert("发送失败！");
				} else {
					alert("发送成功！");
					location.href = "stusendmail";
				}
			}
		});
	});
});
</script>
    <div class="rightpanel">
        
        <ul class="breadcrumbs">
            <li><a href="stuhomepage.html"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a href="stusendmail.html">申诉处理/发件箱</a></li>
          
            
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
             <div class="pageicon"><span class="iconfa-envelope"></span></div>
            <div class="pagetitle">
                <h5>申诉处理</h5>
                <h1>发件箱</h1>
            </div>
        </div><!--pageheader-->
        
        <div class="maincontent">
            <div class="maincontentinner">
            
             <div class="messagepanel">
                    <div class="messagehead">
                        <a  href="#editModal" data-toggle="modal">
                        <button class="btn btn-success btn-large">编辑消息</button></a>
                    </div><!--messagehead-->
                    <div class="messagemenu">
                        <ul>
                            <li class="back"><a><span class="iconfa-chevron-left"></span> Back</a></li>
                            <li ><a href="stuappealman.html"><span class="iconfa-inbox"></span> 收件箱</a></li>
                            <li class="active"><a href="stusendmail.html"><span class="iconfa-plane"></span> 发件箱</a></li>
                           	
							
                        </ul>
                    </div>
                    <div class="messagecontent">
                        <div class="messageleft">
                            <form class="messagesearch">
                                <input type="text" class="input-block-level" placeholder="Search message and hit enter..." />
                            </form>
                            <ul class="msglist">
                                <c:forEach items="${messagelist}" var="message">
                                <li class="unread" onclick="display_message(${message[0]})">
                                   <div class="thumb"><img src="images/photos/1.jpg" alt="" /></div>
                                    <div class="summary">
                                    <span class="date pull-right"><small>${message[4]}</small></span>
                                    <h4>${message[2]}</h4>
                                     <p><strong>${message[1]}</strong></p>
                                </li>
                            </c:forEach>
                                
                            </ul>
                        </div><!--messageleft-->
                        <div class="messageright">
                            <div class="messageview">
                                
                                <div class="btn-group pull-right">
                                    <button data-toggle="dropdown" class="btn dropdown-toggle">操作 <span class="caret"></span></button>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">删除信息</a></li>
                                      
                                    </ul>
                                </div>
                                  
                                <h1 class="subject">Message</h1>
                                <div class="msgauthor">
                                    <div class="thumb"><img src="images/photos/1.jpg" alt="" /></div>
                                    <div class="authorinfo">
                                        <span class="date pull-right" id="msgtime">Nov. 25th,2014</span>
                                        <h5><strong id="msguser">公告</strong> <span id="msgreceiver">llkpersonal</span></h5>
                                        <span class="to" id="msgsender">me</span>
                                    </div><!--authorinfo-->
                                </div><!--msgauthor-->
                                <div class="msgbody">
                                    <p id="msgcontent">消息系统启用了！</p>
                                </div><!--msgbody-->
     
                            </div><!--messageview-->
                            
                            
                        </div><!--messageright-->
                    </div><!--messagecontent-->
                </div><!--messagepanel-->
            
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
<div aria-hidden="false" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" class="modal hide fade in" id="editModal">
    <div class="modal-header">
        <button aria-hidden="true" data-dismiss="modal" class="close" type="button">&times;</button>
        <h3 id="myModalLabel">编辑信息 </h3>
    </div>
    <div class="modal-body">
        <p>
                        	<label>收件人</label>
                            <span class="field"><input id="receivername" type="text" name="receivername" class="input-xlarge" /></span>
                        </p>
                       
                        <p>
                            <label>回复内容</label>
                            <span class="field"><textarea id="messagecontent" name="messagecontent" cols="80" rows="5" class="span5"></textarea></span> 
                        </p>
    </div>
    <div class="modal-footer">
        <button data-dismiss="modal" class="btn">关闭</button>
        <button id="btn_send" class="btn btn-primary">发送</button>
    </div>
</div><!--#编辑框-->
</body>
</html>
    