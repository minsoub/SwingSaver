<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	if ("${success}" == "Y")
	{
		self.close();
		opener.location.href="/";
	}else {
		alert("${error}");
		self.close();
	}
</script>