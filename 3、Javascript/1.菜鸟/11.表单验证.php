<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
</head>
<body>
<form name='myForm' action="11.表单验证.php" onsubmit="return validateFrom()"  method="post">
	<p>
		<!-- js判断 -->
		<label>账号：</label>
		<input type="text" name="username" placeholder="输入你的账号">			
	</p>
	<p>
		<!-- 自动验证 -->
		<label>密码：</label>
		<input type="password" name="password" placeholder="输入你的密码" required="required">		
	</p>
	<p>
		<label>邮箱：</label>
		<input type="email" name="email">
	</p>
	<p>
		<button>登陆</button>
	</p>
</form>
<hr/>
<p>请输入10 到 100 之间的数字:</p>
<input type="number" id="numb" min="10" max="100" required>
<button onclick="myFunction()">提交</button>
<p id="demo"></p>
<script type="text/javascript">
function validateFrom(){
	var strusername = document.forms["myForm"]['username'].value;
	var stremail =document.forms['myForm']['email'].value;
	var atops = stremail.indexOf('@');
	var dotpos = stremail.lastIndexOf('.')
	if (strusername == null || strusername == '') {
		alert('必须输入您的账号')
		return false
	}
	if (atops < 1 || dotpos < atops + 2 || dotpos + 2>=stremail.length) {
		alert("不是一个有效的 e-mail 地址");
		return false;
	}
}
function myFunction(){
	var x, text;
	x = document.getElementById('numb');
	// if (isNaN(x.value) || x.value<10 ||x.value>100) {
	// 	text = '输入错误';
	// }else{
	// 	text = '输入正确'
	// }
	// document.getElementById('demo').innerHTML = text
	if (x.checkValidity() == false) {
		document.getElementById('demo').innerHTML = x.validationMessage;
		// validationMessage	浏览器错误提示信息
	}else{
		document.getElementById('demo').innerHTML = "输入正确";
	}
}

// Validity 属性
// rangeOverflow：如果元素的值大于设置的最大值。 为 true,
// rangeUnderflow：如果元素的值大于设置的最大值。 为 true,



// 约束验证HTML输入属性

// disabled		规定输入的元素不可用
// max			规定输入元素的最大值
// min 			规定输入元素的最小值
// pattern		规定输入元素值的模式
// required		规定输入元素字段是必需的
// type 		规定输入元素的类型
</script>
</body>
</html>