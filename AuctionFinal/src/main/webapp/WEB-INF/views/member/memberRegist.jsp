<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
 
    $(document).ready(function(){
    	
    }); // end of $(document).ready()---------------------------	 
    
    function goPwdCheck(){
    	
		var frm = document.RegistFrm;
    	
    	var pwd1val = $("#passwd").val();
    	var pwd2val = $("#passwd2").val();
   	
       	if(pwd1val != pwd2val){
       		alert("비밀번호가 일지하지 않습니다.");
       		$("#passwd2").val("");
       		$("#passwd2").focus();
       		return;
       	}
       	else if(pwd1val == pwd2val){
       		$("#name").focus();
       		return;
       	}
    	
    	
    }
    
    function idCheck(){
    	    	
    	var form_data = {userid : $("#userid").val()};
    	
    	$.ajax({
			url: "idCheck.action",
			type: "GET",
			data: form_data,
			dataType: "JSON",
			success: function(json){
				$("#table2").empty();
				
				var html = "<tr>";
				html += "<th style='width: 15%; text-align: center;'>작성자</th>";
				html += "<th style='width: 67%; text-align: center;'>내용</th>";
				html += "<th style='text-align: center;'>작성일</th>";
				html += "</tr>";
				$.each(json, function(entryIndex, entry) {
				html += "<tr>";
				html += "<td style='text-align: center;'>"+entry.name+"</td>";
				html += "<td>"+entry.content+"</td>";
				html += "<td style='text-align: center;'>"+entry.regDate+"</td>";
				html += "</tr>";
				});
				
				$("#table2").append(html);
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});
    	
    }
    
</script>

<div style="width:90%; margin: auto; border: solid 0px red;">

	<div style="width:80%; margin-top:2%; margin-left:10%; height:200px; border: solid 0px blue;">
		<h2 class="text-primary">회원가입</h2>
		<p class="bg-primary">&nbsp;</p>
		
		<form name="RegistFrm">
			<div class="mydiv" style="margin-left: 15%;">
				<span style="font-size: 15pt;" class="mydisplay myfont" >아이디 : </span><input style="font-size: 15pt;" class="mydisplay form-control" type="text" name="userid" id="userid" size="20" /><button style="font-size: 15pt;" type="button" onClick="idCheck();">아이디 확인</button><br/>
				<span style="font-size: 15pt;" class="mydisplay myfont" style="margin-top: 30px;">암&nbsp;&nbsp;&nbsp;호 : </span> <input class="mydisplay form-control" style="font-size: 15pt; margin-top: 15px;" type="password" name="passwd" id="passwd" size="20" /> 
				<span style="font-size: 15pt;" class="mydisplay myfont" style="margin-top: 30px;">암호 확인 : </span><input class="mydisplay form-control" style="font-size: 15pt; margin-top: 15px;" type="password" name="passwd2" id="passwd2" size="20" /> <button style="font-size: 15pt;" type="button" onClick="goPwdCheck();">암호 확인</button><br/>
				<span style="font-size: 15pt;" class="mydisplay myfont" style="margin-top: 30px;">이&nbsp;&nbsp;&nbsp;름 : </span><input class="mydisplay form-control" style="font-size: 15pt; margin-top: 15px;" type="text" name="name" id="name" size="20" /> 
				<span style="font-size: 15pt;" class="mydisplay myfont" style="margin-top: 30px;">이메일 : </span><input class="mydisplay form-control" style="font-size: 15pt; margin-top: 15px;" type="text" name="name" id="name" size="20" /> 
				<span style="font-size: 15pt;" class="mydisplay myfont" style="margin-top: 30px;">주&nbsp;&nbsp;&nbsp;소 : </span><input class="mydisplay form-control" style="margin-top: 15px;" type="text" name="addr1" id="addr1" size="20" /> - <input class="mydisplay form-control" style="margin-top: 15px;" type="text" name="addr2" id="addr2" size="20" />
			</div>
			
			
			<div class="mydiv" style="margin-left: 10%;">
				<button class="btn btn-success" style="width: 100px; font-size: 14pt;" type="button" id="btnRegist" >회원가입</button> 
			</div>	 
		</form>
	</div>
	
</div>
