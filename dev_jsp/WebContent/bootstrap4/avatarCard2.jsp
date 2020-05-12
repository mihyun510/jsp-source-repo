<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Conponant2 - card 액션태그 활용</title>
<jsp:include page="../common/bootStrap4UI.jsp"/>
<script type="text/javascript">
	function method() {
		alert("method 호출 성공");
	}
</script>
</head>
<body>
<div class="card" style="width: 18rem;">
  <img src="img/img_avartar2.png" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>
</body>
</html>