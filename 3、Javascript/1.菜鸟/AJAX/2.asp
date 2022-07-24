<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
</head>
<body>
<form action="">
	<span>输入姓名：</span>
	<input type="text" name="intxt" onkeyup="showHint(this.value)">
</form>
<p>提示信息：<span id="txtHint"></span></p>
<script type="text/javascript">
function showHint(str){
	var xmlhttp;
	if (str.length == 0) {
		document.getElementById('txtHint').innerHTML=''
		return;
	}
	if (window.XMLHttpRequest) {
		xmlhttp = new XMLHttpRequest();
	}else{
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange=function(){
		if (xmlhttp.readyState==4 && xmlhttp.status==200) {
			document.getElementById("txtHint").innerHTML=xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET","../gethint.asp?q="+str,true);
	xmlhttp.send()
}
</script>
</body>
</html>