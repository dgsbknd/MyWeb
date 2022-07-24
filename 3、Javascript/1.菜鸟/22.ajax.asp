<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
</head>
<script>
function showHint(str){
	if (str.length==0){
		document.getElementById("txtHint").innerHTML="";
		return;
	}
	if (window.XMLHttpRequest){
		// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp=new XMLHttpRequest();
	}else{
		// code for IE6, IE5
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange=function(){
		if (xmlhttp.readyState==4 && xmlhttp.status==200){
			document.getElementById("txtHint").innerHTML=xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET","gethint.asp?q="+str,true);
	xmlhttp.send();
}
</script>
<body>

<form>
	<input type="text" onkeyup="showHint(this.value)" size="20">
</form>
<p>Suggestions: <span id="txtHint"></span></p>
	
</body>
</html>
