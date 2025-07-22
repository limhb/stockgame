<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/resources/jquery-3.7.1.js"></script>
</head>
<body>
<button>버튼1</button>
<button>버튼2</button>
<button>버튼3</button>

<div id="d1">div1</div>
<div id="d2">div2</div>

<script>
const btn = document.querySelector('button'); //단일 제일 첫번째 엘리먼트를 가져옴

$('button') // selector를 만족하는 모든 엘리먼트를 가져옴

const d1 = document.querySelector('#d1');
d1.style.width='100px';
d1.style.border= '1px solid blue';
d1.style.backgroundColor = '#eeeeee';
d1.innerHTML = '<b>hi1</b>';
alert(d1.innerHTML);

const d2 = ${'#d2'};
d2.css({
	width : '100px';
	border : '1px solid blue';
	backgroundColor : '#eeeeee';
})
d2.html('<b>hi2<b>');
alert(d2.html());

</script>
</body>
</html>