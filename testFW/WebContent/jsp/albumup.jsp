<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="com.testFW.util.UserUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.testFW.bo.DiaryReplyBO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.testFW.util.DateUtil"%>
<%@page import="com.testFW.bo.DiaryBO"%>
<%@page import="com.testFW.util.ConstantsUtil"%>
<%@page import="com.testFW.bo.UserBO"%>
<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String fun = (String) request.getAttribute("fun");
	if (fun == null)
		fun = "";
	UserBO user = (UserBO) request.getAttribute("loginUser");
	DiaryBO diary = (DiaryBO) request.getAttribute("diary");
	List<DiaryReplyBO> replies = (List<DiaryReplyBO>) request
			.getAttribute("replies");
	if (replies == null) {
		replies = new ArrayList<DiaryReplyBO>();
	}
	if (diary == null) {
		diary = new DiaryBO();
	}
	String userDiaryNum = "0";
	boolean hasLogin = false;
	if (user == null) {
		user = new UserBO();
	} else {
		hasLogin = true;
		userDiaryNum = (String) request
		.getAttribute("userDiaryNum");
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- 网站公用顶部 -->
<jsp:include page="/jsp/common/head.jsp" flush="true" >
	<jsp:param value="<%=hasLogin %>" name="hasLogin"/>
	<jsp:param value="<%=user.getName() %>" name="userName"/>
	<jsp:param value="<%=user.getId() %>" name="userId"/>
	<jsp:param value="<%=userDiaryNum %>" name="userDiaryNum" />
</jsp:include>
  <title>wnJava--新建图册</title>
  
  <link href="/css/albumup.css" rel="stylesheet" type="text/css" />
  <link href="/css/fineuploader.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
      .qq-upload-list {
        text-align: left;
      }
 
      /* For the bootstrapped demos */
      li.alert-success {
        background-color: #DFF0D8;
      }
 
      li.alert-error {
        background-color: #F2DEDE;
        margin-bottom: 5px;
      }
 
      .alert-error .qq-upload-failed-text {
        display: inline;
      }    

      .box-header{
        padding-bottom: 20px;
        border-bottom: 1px solid #e1e1e1;
      }
      .box{
        padding: 0;
      }
      .box-header, .box-body, .box-footer{
        padding: 20px;
      }
      .item{
        background-color: rgb(230, 230, 230);
        border: none;
        padding-bottom: 0px;
      }

      .qq-upload-button{
        padding-left: 0;
        margin-left: 0;
        float: left;
      }
      .tips{
        display: block;
        padding-top: 6px;
        float: left;
        margin-left: 20px;
      }

      .newalbum{
        font-size: 24px;
        font-family: "Microsoft Yahei", "微软雅黑", Tahoma, Arial;
      }
      .albumdesc{
        width: 98%;
      }
      .clearfix:after { content: "."; display: block; clear: both; visibility: hidden; line-height: 0; height: 0; }
      .clearfix { display: inline-block; }
       <font></font>  
      html[xmlns] .clearfix { display: block; }
      * html .clearfix { height: 1%; }       
    </style>
   
  </head>
  <body>
    <!--  begin container  -->
    <div class="container">
      <div class="row">
        <div class="span10 offset1 margin-top-middle">
          <div class="box">
            <div class="box-header">
              <span class="newalbum">新图册</span>
            </div>
            <!-- box header -->
            <form>
            <div class="box-body">
                <label for="albumname">图册名：</label>
                <input type="text" style="width:98%" name="albumname" id="albumname">
                <div id="imgshow">
          
                </div>              

            </div>
            <!-- end box-body -->
            
            <div class="box-footer">
              <div class="newimg">
                  <div id="imgupbtn" class="clearfix"></div>
                            
              </div>
              <!-- end newimg -->
              <div>
                <label for="albumdesc">描述:</label>
                <textarea class="albumdesc" name="albumdesc" id="albumdesc"  rows="6"></textarea>
              </div>
              <div class="action">
                <div class="row">
                  <div class="span1"><input type="submit" id="submit" class="btn btn-primary" value="发布"> </div>
                </div>
              </div>
              <!-- end action -->

            </div>
            <!-- end box footer -->
          </form>
          </div>
          <!-- end box -->                           
        </div>
        <!-- end span8  -->      
      </div>
      <!-- end row -->
    </div>
    <!-- end container -->
    
    	<script type="text/javascript"
		src="<%=ConstantsUtil.FW_DOMAIN%>/js/albumup.js"></script>
			<script type="text/javascript"
		src="<%=ConstantsUtil.FW_DOMAIN%>/js/jquery.fineuploader-3.5.0.js"></script>
		
		
    <script>
    $(document).ready(function() {
        $('#imgupbtn').fineUploader({
          request: {
            endpoint: '/action/imgupload?attr=album'
          },
          validation: {
            allowedExtensions: ['jpeg', 'jpg', 'png'],
            sizeLimit: 512000 
          },
          multiple: false,
          text: {
            uploadButton: '<div><i class="icon-upload icon-white"></i> 添加照片</div>'
          },
          template: '<div class="qq-uploader clearfix">' +
	          '<pre class="qq-upload-drop-area"><span>{dragZoneText}</span></pre>' +
	          '<div class="qq-upload-button btn btn-success">{uploadButtonText}</div>' +
	          '<div class="tips">5M, jpg, png, jpeg</div>'+
	          '<span class="qq-drop-processing"><span>{dropProcessingText}</span>'+
	          '<span class="qq-drop-processing-spinner"></span></span>'+ 
	          '</div>'+
	          '<div><ul class="qq-upload-list"></ul></div>',
          classes: {
            success: 'alert alert-success',
            fail: 'alert alert-error'
          }
        }).on('complete', function(event, id, fileName, responseJSON) {
          if (responseJSON.success) {
            $('#imgshow').append(
              '<div class="alert item" id="'+responseJSON.id+'">'+
              '<button type="button" class="close" data-dismiss="alert">&times;</button>'+
              '<div class="row">'+
              '<div class="span2">'+
              '<img src="<%=request.getContextPath()%>'+
              responseJSON.url+'" style="height:100px;width:100xp" alt="">'+
              '</div>'+
              '<div class="span4">'+
              '<textarea name="desc" id="'+
              responseJSON.id+"-desc"+'" class="span4 photodesc" rows="5"></textarea>'+ 
              '</div>'+
              '</div>'+
              '</div>');
          }
        });


        $('#submit').click(function(){
          var data = '{"albumname":';
          var albumname = $('#albumname').val();
          data = data+'"'+albumname+'",';
          data += '"photos":['
          $('.item').each(function(index){
            var id=$(this).attr('id');
            var photodesc=$('#'+id+'-desc').val();
            if(index != 0)
              data+=','
            data+='{'
            data+='"id":';
            data = data+'"'+id+'","desc":'
            data = data+'"'+photodesc+'"';
            data+='}'
          });
          data += '],'
          var albumdesc = $('#albumdesc').val();
          data += '"desc":';
          data = data + '"' + albumdesc + '"}'
          //alert(data);

          $.post('/action/album/albumup', data, function(data){
        	  if(data=='success'){
        		 alert('album upload success');
        	  }else{
        		  
        	  }
          });
          return false;
        });

      });
    </script>
 <!-- 底部 -->
<jsp:include page="/jsp/common/bottom.jsp" flush="true" />
</body>
</html>