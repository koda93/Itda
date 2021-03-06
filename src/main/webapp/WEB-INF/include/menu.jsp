<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:url var="R" value="/" />

<%-- <header id="header">
	<div class="container menu">
		<div id="logo">
			<h1 data-url="${R}mypage">Itda</h1>
		</div>
		<div id="myInf" >
			<div class="myInf_icon" data-url="${R}mypage"><sec:authentication property="user.firstChar"/></div>
			<p class="myInf_text" data-url="${R}mypage"><sec:authentication property="user.name"/></p>
			<p class="myInf_text pull-right" data-url="${R}user/logout_processing">로그아웃</p>
		</div>
	</div>
</header> --%>
<header id="header">
	<div class="container menu">
		<div id="myInf" class="row">
			<div class="col-4">
				<%-- <div class="myInf_icon" data-url="${R}mypage"><sec:authentication property="user.firstChar"/></div> --%>
				<div class="inline_box" data-url="${R}mypage">
					<div class="myInf_icon"></div>
					<div class="myInf_first"><sec:authentication property="user.firstChar"/></div>
					<p class="myInf_text myInf_name"><sec:authentication property="user.name"/></p>
				</div>
			</div>
			<div id="logo" class="col-4">
				<%-- <h1 data-url="${R}main">Itda</h1> --%>
				<img src="${R}img/logo1-1.png" data-url="${R}main"/>
			</div>
			<sec:authorize access="authenticated">
				<div class="col-4  pull-right text-right">
					<div class="inline_box" data-url="${R}user/logout_processing">
						<p class="myInf_text">로그아웃</p>
					</div>
				</div>
			</sec:authorize>
		</div>
	</div>
</header>

<div class="margin"></div>

<section id="content">
	<div class="text-center">${ menu }</div>
</section>
