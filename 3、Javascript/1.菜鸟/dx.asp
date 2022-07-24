<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.js"></script>
</head>
<body>
<hr />
<form name="form1" action="#" method="post">发送短信<br />
  <input type="text" name="phone" id="phone" value="18367760116" placeholder="请输入手机号" maxlength="11" />
  <input type="" name="verCode" id="verCode" value="" placeholder="请输入验证码" maxlength="6"/>
  <input type="button" name="" id="verCodeBtn" value="获取验证码" onclick="settime(this);"/>
</form> 
<script>
  var counts = 60;
  function settime(val) {
    if(counts == 0) {
      val.removeAttribute("disabled");
      val.value = "获取验证码";
      counts = 60;
      return false;
    }else{
      val.setAttribute("disabled", true);
      val.value = "重新发送（" + counts + "）";
      counts--;
    }
    setTimeout(function() {
      settime(val);
    }, 1000);
  }
$(function(){
//获取验证码
  $("#verCodeBtn").click(function() {
    // alert($("input[name='phone']").val())
    $.ajax({
      url: "c.asp",
      data:{
        "mobile":18367760116
      },
      type: "get",
      success: function() {
        console.log(this)
      },
      error: function(data) {
        alert("发送失败");
      }
    });


    // var userinfo = {
    //   "mobile":$("input[name='phone']").val(),
    //   "text":$("input[name='verCode']").val()
    // }
    // $.ajax({
    //   url: "https://www.soyea-tech.com/api/getms",
    //   data: userinfo,
    //   type: "get",
    //   success: function(data) {
    //     if(JSON.parse(data).state === 404 || JSON.parse(data).state === 202  ) {
    //       alert("验证码发送失败")
    //     } else {
    //       alert("验证码发送成功，请耐心等待")
    //     }
    //   },
    //   error: function(data) {
    //     alert("发送失败");
    //   }
    // });

  });
})
</script>
</body>
</html>