<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="test.css" rel="stylesheet" type="text/css">
<link href="join.css" rel="stylesheet" type="">
</head>
<body>



	<form action="hh_eventUpdatePro.do" method="post">
	<input type="hidden" value="true" name="allday"> 
	<input type="hidden" value="#ffffff" name="textColor">
	<c:if test="${chk==1 }">
	<input type="hidden" value="1" name="chk">
	</c:if>
	<c:if test="${chk==0 }">
	<input type="hidden" value="0" name="chk">
	</c:if>
	<table>
		<div id="container1" role="main">
				<div id="content">
					<div class="join_content">
						<div class="row_group">
							<div class="join_row">
							
								<h3 class="join_title">
									<label>일정명</label>
								</h3>
								<span class="ps_box int_id"> 
								<input	type="text" name="title" id="title" required="required" class="int" maxlength="20"/>
	
								</span> 
								<h3 class="join_title">
									<label>시작</label>
								</h3>
								<span class="ps_box int_id"> 
								<input type="date" name="e_start" id="e_start" class="int" maxlength="20"/>
	
								</span> 
								<h3 class="join_title">
									<label>종료</label>
								</h3>
								<span class="ps_box int_id"> 
								<input type="date" name="e_end" id="e_end" class="int" maxlength="20"/>
	
								</span> 
								<h3 class="join_title">
									<label>구분</label>
								</h3>
								<span class="ps_box int_id"> 
								<select	type="text" name="e_type" id="e_type" class="int" maxlength="20">
									<option value="지역 행사">지역 행사</option>
									<option value="개인 행사">개인 행사</option>
									<option value="대회">대회</option>
									<option value="모임">모임</option>
									<option value="금어기">금어기</option>
									<option value="기타">기타</option>
								</select>
	
								</span> 
								<h3 class="join_title">
									<label>행사 위치</label>
								</h3>
								<span class="ps_box int_id"> 
								<select name="eventpin" id="eventpin" class="int" maxlength="20">
								<optgroup LABEL="----기본 지역-----">
									<option value="서울">서울</option>
									<option value="인천">인천</option>
									<option value="경기">경기</option>
									<option value="강원">강원</option>
									<option value="충청">충청</option>
									<option value="대전">대전</option>
									<option value="전라">전라</option>
									<option value="광주">광주</option>
									<option value="경상">경상</option>
									<option value="대구">대구</option>
									<option value="부산">부산</option>
									<option value="제주">제주</option>
									<option value="기타">기타</option>
								</optgroup>
								<optgroup LABEL="---낚시터 행사---">
									<c:forEach var="event" items="${list }">
										<option value="${event.rsa }">${event.rsa }</option>
									</c:forEach>
								</optgroup>
							</select>
								</span> 
								<h3 class="join_title">
									<label>설명</label>
								</h3>
								<span class="ps_box int_id"> 
								<textarea rows="2" cols="75" class="description" class="int" maxlength="20"
									name="description" id="edit-desc" placeholder="30자 이하 입력"></textarea>
								</span> 
								<h3 class="join_title">
									<label>Url</label>
								</h3>
								<span class="ps_box int_id"> 
								<input type="text" name="url" id="url" placeholder="입력하지 않아도 됩니다." class="int" maxlength="20"/>
	
								</span> 
								
								<input type="submit" value="확인" style="height: 29px; font-size: 15px">
							<input type="reset" value="취소" onclick="location.href='main.do'" style="height: 29px; font-size: 15px"> 
								
							</div>
						</div>
					</div>
				</div>
			</div>
			
	<%-- 
	<tr><td>일정명</td><td><input	type="text" name="title" id="title" required="required" /></td></tr>
	<tr><td>시작</td><td><input type="date" name="e_start" id="e_start" /></td></tr>
	<tr><td>종료</td><td><input type="date" name="e_end" id="e_end" /></td></tr>
	<tr><td>구분</td><td><select	type="text" name="e_type" id="e_type">
									<option value="지역 행사">지역 행사</option>
									<option value="개인 행사">개인 행사</option>
									<option value="대회">대회</option>
									<option value="모임">모임</option>
									<option value="금어기">금어기</option>
									<option value="기타">기타</option>
								</select></td></tr>
	<tr><td>행사 위치</td><td><select name="eventpin" id="eventpin">
								<optgroup LABEL="----기본 지역-----">
									<option value="서울">서울</option>
									<option value="인천">인천</option>
									<option value="경기">경기</option>
									<option value="강원">강원</option>
									<option value="충청">충청</option>
									<option value="대전">대전</option>
									<option value="전라">전라</option>
									<option value="광주">광주</option>
									<option value="경상">경상</option>
									<option value="대구">대구</option>
									<option value="부산">부산</option>
									<option value="제주">제주</option>
								</optgroup>
								<optgroup LABEL="---낚시터 행사---">
									<c:forEach var="event" items="${list }">
										<option value="${event.rsa }">${event.rsa }</option>
									</c:forEach>
								</optgroup>
							</select></td></tr>
	<tr><td>설명</td><td><textarea rows="4" cols="50" class="description"
									name="description" id="edit-desc" placeholder="30자 이하 입력"></textarea></td></tr>
	<tr><td>Url</td><td><input type="text" name="url" id="url" placeholder="입력하지 않아도 됩니다."/></td></tr>

	
	</table>	
	
			 <input type="submit" value="확인">				
		<input type="reset" value="취소">				
			 --%>
	</form>

</body>
</html>