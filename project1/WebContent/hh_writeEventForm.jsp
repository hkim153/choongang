<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css" type="text/css">
</head>
<body>

	<form action="hh_eventUpdatePro.do" method="post">
		<input type="hidden" value="사나" name="username"> <input
			type="hidden" value="true" name="allday"> <input
			type="hidden" value="#ffffff" name="textColor">
		<div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
			<div class="modal-dialog" role="document">
				<div class="modal-content">

					<div class="modal-body">
						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="edit-title">일정명</label> <input
									class="inputModal" type="text" name="title" id="title"
									required="required" />
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="edit-start">시작</label> <input
									class="inputModal" type="date" name="e_start" id="e_start" />
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="edit-end">끝</label> <input
									class="inputModal" type="date" name="e_end" id="e_end" />
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="edit-type">구분</label> <select
									class="inputModal" type="text" name="e_type" id="e_type">
									<option value="지역 행사">지역 행사</option>
									<option value="개인 행사">개인 행사</option>
									<option value="대회">대회</option>
									<option value="모임">모임</option>
									<option value="기타">기타</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="edit-color">색상</label> <select
									class="inputModal" name="backgroundColor" id="backgroundColor">
									<option value="#D25565" style="color: #D25565;">빨간색</option>
									<option value="#9775fa" style="color: #9775fa;">보라색</option>
									<option value="#ffa94d" style="color: #ffa94d;">주황색</option>
									<option value="#74c0fc" style="color: #74c0fc;">파란색</option>
									<option value="#f06595" style="color: #f06595;">핑크색</option>
									<option value="#63e6be" style="color: #63e6be;">연두색</option>
									<option value="#a9e34b" style="color: #a9e34b;">초록색</option>
									<option value="#4d638c" style="color: #4d638c;">남색</option>
									<option value="#495057" style="color: #495057;">검정색</option>
								</select>
							</div>
						</div>
						<div>
							<label>행사 위치</label> <select name="eventpin" id="eventpin">
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
							</select>

						</div>
						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="edit-desc">설명</label>
								<textarea rows="4" cols="50" class="description"
									name="description" id="edit-desc">30자 이하</textarea>
							</div>
						</div>
							<div class="col-xs-12">
								<label class="col-xs-4" for="Url-title">Url</label> 
								<input class="inputModal" type="text" name="url" id="url"/>
							</div>
					</div>
					
					<div class="modal-footer modalBtnContainer-addEvent">
						<input type="reset" value="취소"> <input type="submit"
							value="확인">
					</div>

				</div>
			</div>
		</div>
	</form>

</body>
</html>