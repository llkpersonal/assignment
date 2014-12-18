<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="adminheader.jsp">
	<c:param name="title" value="申诉处理" />
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
		url : "getmsginfo?mid="+mid,
		dataType:"json",
		success: function(data){
			jQuery("#msgtime").text(1900+data["sendtime"]["year"]+"/"+(1+data["sendtime"]["month"])+"/"+data["sendtime"]["date"]);
			jQuery("#msguser").text(data["sender"]);
			jQuery("#msgsender").text(data["sender"]);
			jQuery("#msgreceiver").text(data["receiver"]);
			jQuery("#msgcontent").text(data["messagecontent"]);
		}
	});
}

jQuery(document).ready(function(){
	jQuery("#btn_send").click(function(){
		var receiver = jQuery("#receiver").val(), messagecontent = jQuery("#messagecontent").val();
		alert(receiver+messagecontent);
		jQuery.ajax({
			type : "POST",
			url : "sendamessage",
			dataType : "json",
			
			data : {
				"receiver" : receiver,
				"messagecontent" : messagecontent,
			},
			success : function(data) {
				if (data["status"] == "failed") {
					alert("添加失败，请检查是否有重复的课程号！");
				} else {
					location.href = "showadminmessagebox";
				}
			}
		});
	});
});
</script>
<div class="rightpanel">
        
        <ul class="breadcrumbs">
            <li><a href="adminhomepage"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a href="showadminmessagebox">申诉处理</a></li>
          
            
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
                <h5>申诉</h5>
                <h1>申诉处理</h1>
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
                            <li class="active"><a href="showadminmessagebox"><span class="iconfa-inbox"></span> 收件箱</a></li>
                            <li><a href="showadminsendmailbox"><span class="iconfa-plane"></span> 发件箱</a></li>
                           	
							
                        </ul>
                    </div>
                    <div class="messagecontent">
                        <div class="messageleft">
                            <form class="messagesearch">
                                <input type="text" class="input-block-level" placeholder="Search message and hit enter..." />
                            </form>
                            <ul class="msglist">
                            <c:forEach items="${messagelist}" var="message">
                                <li class="unread" onclick="display_message(${message.mid})">
                                   <div class="thumb"><img src="images/photos/1.jpg" alt="" /></div>
                                    <div class="summary">
                                    <span class="date pull-right"><small>${message.sendtime}</small></span>
                                    <h4>${message.sender}</h4>
                                     <p><strong>${message.messagecontent}</strong></p>
                                </li>
                            </c:forEach>
                               <!--  <li class="unread">
                                    <div class="thumb"><img src="images/photos/1.jpg" alt="" /></div>
                                    <div class="summary">
                                        <span class="date pull-right"><small>April 03, 2013</small></span>
                                        <h4>Leevanjo Sarce</h4>
                                        <p><strong>Lorem ipsum dol..</strong> - Hey, leevanjo doloe..</p>
                                    </div>
                                </li>
                                <li class="unread">
                                    <div class="thumb"><img src="images/photos/1.jpg" alt="" /></div>
                                    <div class="summary">
                                        <span class="date pull-right"><small>April 03, 2013</small></span>
                                        <h4>Yanmar Iobi</h4>
                                        <p><strong>Lorem ipsum dol..</strong> - Hey, leevanjo doloe..</p>
                                    </div>
                                </li>
                                <li>
                                    <div class="thumb"><img src="images/photos/1.jpg" alt="" /></div>
                                    <div class="summary">
                                        <span class="date pull-right"><small>April 03, 2013</small></span>
                                        <h4>Nusjan Wanlacal</h4>
                                        <p><strong>Lorem ipsum dol..</strong> - Hey, leevanjo doloe..</p>
                                    </div>
                                </li>
                                <li>
                                    <div class="thumb"><img src="images/photos/1.jpg" alt="" /></div>
                                    <div class="summary">
                                        <span class="date pull-right"><small>April 03, 2013</small></span>
                                        <h4>Zaham Sindilmaca</h4>
                                        <p><strong>Lorem ipsum dol..</strong> - Hey, leevanjo doloe..</p>
                                    </div>
                                </li>
                                <li class="unread">
                                    <div class="thumb"><img src="images/photos/1.jpg" alt="" /></div>
                                    <div class="summary">
                                        <span class="date pull-right"><small>April 03, 2013</small></span>
                                        <h4>Weno Carasbong</h4>
                                        <p><strong>Lorem ipsum dol..</strong> - Hey, leevanjo doloe..</p>
                                    </div>
                                </li>
                                <li>
                                    <div class="thumb"><img src="images/photos/1.jpg" alt="" /></div>
                                    <div class="summary">
                                        <span class="date pull-right"><small>April 03, 2013</small></span>
                                        <h4>Ratesoc Maitum</h4>
                                        <p><strong>Lorem ipsum dol..</strong> - Hey, leevanjo doloe..</p>
                                    </div>
                                </li>
                                <li>
                                    <div class="thumb"><img src="images/photos/1.jpg" alt="" /></div>
                                    <div class="summary">
                                        <span class="date pull-right"><small>April 03, 2013</small></span>
                                        <h4>Venro Leongal</h4>
                                        <p><strong>Lorem ipsum dol..</strong> - Hey, leevanjo doloe..</p>
                                    </div>
                                </li>-->
                            </ul>
                        </div><!--messageleft-->
                        <div class="messageright">
                            <div class="messageview">
                                
                                <div class="btn-group pull-right">
                                    <button data-toggle="dropdown" class="btn dropdown-toggle">操作 <span class="caret"></span></button>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">删除信息</a></li>
                                        <li><a href="#">标记为未读</a></li>
                                        
                                    </ul>
                                </div>
                                
                                <h1 class="subject">Message</h1>
                                <div class="msgauthor">
                                    <div class="thumb"><img src="images/photos/1.jpg" alt="" /></div>
                                    <div class="authorinfo">
                                        <span class="date pull-right" id="msgtime">Nov. 25th,2014</span>
                                        <h5><strong id="msguser">公告</strong> <span id="msgsender">llkpersonal</span></h5>
                                        <span class="to" id="msgreceiver">me</span>
                                    </div><!--authorinfo-->
                                </div><!--msgauthor-->
                                <div class="msgbody">
                                    <p id="msgcontent">消息系统启用了！</p>
                                </div><!--msgbody-->
                                
                                
                                
                               
                                
                               
                            </div><!--messageview-->
                            
                            <div class="msgreply">
                                <div class="thumb"><img src="images/photos/1.jpg" alt="" /><br/>
								<a href="" class="btn btn-warning"><i class="iconsweets-mail iconsweets-white"></i></a>
								</div>
                                <div class="reply">
                                    <textarea placeholder="回复"></textarea>
									
                                </div><!--reply-->
								
                            </div><!--messagereply-->
                            
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
                            <span class="field"><input id="receiver" type="text" name="receiver" class="input-xlarge" /></span>
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