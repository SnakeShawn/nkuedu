<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style id="antiClickjack">body{display:none !important;}</style>
<script>
if (self === top) {
	var antiClickjack = document.getElementById("antiClickjack");
	antiClickjack.parentNode.removeChild(antiClickjack);
} else {
	top.location = self.location;
}
</script>
<title>南开大学夏季学期高中生选课系统</title>
</head>
<frameset rows="*" cols="130,*" border="0" style="frameborder:NO; border:0; framespacing:0; noresize; marginheight:0; marginwidth:0">
  <frame src="<%=request.getContextPath()%>/admin/left" name="leftFrame" scrolling="NO" noresize marginheight="0" marginwidth="0">
  <frameset rows="81,*" cols="*" border="0" style="fraeborder:NO; border:0; framespacing:0; noresize; marginheight:0; marginwidth:0">
    <frame src="<%=request.getContextPath()%>/admin/top" name="topFrame" scrolling="NO" noresize marginheight="0" marginwidth="0">
    <frameset rows="26,*" border="0" style="frameborder:NO; border:0; framespacing:0; noresize; marginheight:0; marginwidth:0">
      <frame src="" name="topMenu" scrolling="NO" noresize marginwidth="0" marginheight="0">
      <frame src="" name="mainFrame" scrolling="YES" marginwidth="0" marginheight="0">
    </frameset>
  </frameset>
</frameset>

<noframes>
<body>
</body>
</noframes>

</html>