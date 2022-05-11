<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>${PageInfo.title}</title>
<link
	href="<c:url value='/home/vendor/bootstrap/css/bootstrap.min.css'/>"
	rel="stylesheet" type="text/css">
<link
	href="<c:url value='/home/vendor/fontawesome-free/css/all.min.css'/>"
	rel="stylesheet" type="text/css">
<link href="<c:url value='/home/assets/main.css'/>" rel="stylesheet"
	type="text/css">
<script src="<c:url value='/home/vendor/jquery/jquery.min.js'/>"></script>
<script src="<c:url value='/home/vendor/notify/notify.js'/>"></script>
</head>
<body class="">
	<div class="container-fluid" style="padding: 0;">
		<nav class="navbar navbar-expand-lg navbar-light bg-light" id="nav">
			<div class="container">

				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarCollapse" aria-controls="navbarCollapse"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarCollapse">
					<ul class="navbar-nav mr-auto">
						<li class="nav-item text-uppercase font-weight-bold li-item">
							<a class="nav-link a-item" href="admin/trang-chu">Trang chủ</a>
						</li>

					</ul>
					<c:if test="${empty user}">
						<ul class="navbar-nav ml-auto text-center">
							<li class="nav-item li-login"><a
								class="nav-link text-uppercase font-weight-bold btn-login"
								href="dang-nhap" style="color: #000" type="button"><i
									class="fas fa-sign-in-alt"></i> ĐĂNG NHẬP</a></li>
							<li class="nav-item"><a
								class="nav-link text-uppercase font-weight-bold btn-register"
								href="dang-ky" style="color:  #000" type="button"><i
									class="fas fa-user-plus"></i> ĐĂNG KÝ</a></li>
						</ul>
					</c:if>
					<c:if test="${not empty user}">
						<ul class="navbar-nav ml-auto text-center">
							<li class="nav-item li-login"><a
								class="nav-link text-uppercase font-weight-bold btn-login"
								href="thong-tin-ca-nhan" style="color:  #000" type="button"><i
									class="fas fa-user"></i> ${user.name}</a></li>
							<li class="nav-item"><a
								class="nav-link text-uppercase font-weight-bold btn-register"
								href="dang-xuat" style="color:  #000" type="button"><i
									class="fas fa-sign-in-alt"></i> ĐĂNG XUẤT</a></li>
						</ul>
					</c:if>

				</div>
			</div>
		</nav>
	</div>