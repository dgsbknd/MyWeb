<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
</head>
<body>
<form action="">
	<select name="customers" onchange="showCustomer(this.value)">
		<option value="1137">1137</option>
		<option value="1126">1126</option>
		<option value="1130">1130</option>
		<option value="1131">1131</option>
	</select>
</form>
<p>客户信息将显示在这...</p>
<p id="txtHint"></p>

<script type="text/javascript">
function showCustomer(str){
	var xmlhttp;
	if (str=="") {
		document.getElementById("txtHint").innerHTML="";
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
	xmlhttp.open("GET","../getcustomer.asp?q="+str,true);
	xmlhttp.send()
}
</script>
</body>
</html>