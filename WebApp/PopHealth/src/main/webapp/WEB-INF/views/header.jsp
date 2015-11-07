<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="<c:url value="/resources/js/header.js"/>"></script>
<nav class="navbar navbar-default navbar-fixed-top ph-navbar">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar" /> <span class="icon-bar" /> <span
					class="icon-bar" />
			</button>
			<a href="#" class="navbar-brand logo-align"><img src="<c:url value="/resources/images/PopHealth.png"/>"></a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1" id="viewNav">
			<ul class="nav navbar-nav">
				<li id="homeMenu" class="menuhighlight active"><a href="home.do" class="menuitem">Grid View
				</a></li>
				<li id="chartMenu" class="menuhighlight"><a href="chart.do" class="menuitem">Chart View</a></li>
				<li class="menuhighlight"><a href="#" class="menuitem">Demographics Map</a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle ph-dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">
					
					<img class="img-circle" src="<c:url value="/resources/images/photo.png"/>" />
					<br>
					Vinay<img src="<c:url value="/resources/images/down-arrow.png"/>" />
				</a>
					<ul class="dropdown-menu">
						<li><a href="#">FAQ</a></li>
						<li><a href="#">Contact Us</a></li>
						<li role="separator" class="divider" />
						<li><a href="#">Sign out</a></li>
					</ul></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>