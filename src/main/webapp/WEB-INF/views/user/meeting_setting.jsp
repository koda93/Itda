<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<style> .error {color:red;} </style>
<c:url var="R" value="/" />

<section id="content">
	<div class="container">
		<div class="form">
			<form:form method="post" modelAttribute="meetingRegistrationModel" action="meeting_setting?id=${id}">
				<div class="form-row">
					<div class="form-group center col-lg-12">
						<form:input path="meetingName" type="text" name="meetingName" class="form-control" placeholder="모임명"/>
						<form:errors path="meetingName" class="error"/>
					</div>
				</div>
				<div class="form-row">
					<div class="form-group center col-lg-12">
						<textarea name="mexplain" class="form-control" rows="5">${meetingRegistrationModel.mexplain }</textarea>
					</div>
				</div>
				<div>
					<!-- <button class="btn pull-right" data-url="#">모임 폐쇄</button> -->
					<button class="btn pull-right" >저장</button>
				</div>
			</form:form>
			<button class="btn pull-right" data-url="meeting?id=${id}">목록으로</button>
		</div>
	</div>
</section>
<%-- 
<div class="margin"></div>
<div class="margin"></div>

<section>
	<div class="container">
		<p class="text-center">카테고리 관리</p>
		<div id="more-features" class="row">
			<div class="col-lg-12">
				<div class="box">
					<div class="comment">
						<i class="ion-close-round pull-right" data-url="#"></i>
						<i class="ion-android-create pull-right" data-url="#"></i>
						<div>전체</div>
					</div>	
					<div class="form">
						<form>
							<div class="form-row">
								<div class="form-group col-10">
									<input type="text" class="form-control" placeholder="카테고리를 추가하세요.">
								</div>
								<div class="form-group col-2">
									<button type="submit" class="btn pull-right">추가</button>
								</div>
							</div>
						</form>
					</div>
	
				</div>
			</div>
		</div>
	</div>
</section> --%>

<div class="margin"></div>

<section>
	<div class="container">
		<p class="text-center">회원 목록</p>
		<div id="more-features" class="row">
			<div class="col-lg-12">
				<c:if test="${empty saveusers }">
					<div class="box">
						<div class="comment">
							<div>회원이 없습니다.</div>
						</div>
					</div>
				</c:if>
				<c:if test="${!empty saveusers }">
				<c:forEach var="saveuser" items="${ saveusers }">
					<div class="box" data-url="#">
						<p class="title">${ saveuser.userStudentNumber} (${saveuser.userName})</p>
						<c:if test="${saveuser.userGender == 1 }">
						<p class="description">${saveuser.departmentName } / 여성 </p>
						</c:if>
						<c:if test="${saveuser.userGender != 1 }">
						<p class="description">${saveuser.departmentName } / 남성 </p>
						</c:if>
						<button class="icon" onclick="my_confirm('${R}meeting_user_delete?id=${id }&mid=${saveuser.id}','회원을 모임에서 삭제하시겠습니까?')">삭제</button>
					</div>
				</c:forEach>
				</c:if>
			</div>
		</div>
		<div class="form" >
			<form method="post" action="userfind?id=${id }">
				<div class="form-row">
					<div class="form-group col-10">
						<input type="hidden" name="id" value="">
						<input type="text" name="studentNumber" class="form-control" placeholder="학번을 검색하세요.">
					</div>
					<div class="form-group col-2">
						<button type="submit" class="btn pull-right">검색</button>
					</div>
				</div>
			</form>
		</div>
		
		<div id="more-features" class="row">
			<div class="col-lg-12">
				<div class="box">
				<c:if test="${ empty finduser }">
					<div class="comment">
						<div>검색 결과가 없습니다.</div>
					</div>
				</c:if>
				<c:if test="${ !empty finduser }">
					<div class="comment">
						<p class="title">${ finduser.studentNumber} (${finduser.name})</p>
						<c:if test="${finduser.gender == 1 }">
						<p class="description">${department } / 여성 </p>
						</c:if>
						<c:if test="${finduser.gender != 1 }">
						<p class="description">${department } / 남성 </p>
						</c:if>
						<button class="icon" data-url="${R}meeting_adduser?id=${id}&uid=${finduser.id}">추가</button>
					</div>
				</c:if>	
				</div>
			</div>
		</div>
	</div>
</section>
	
