<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- session�� login�̶�� �׸��� ������ �α׾ƿ� ó�� -->
<%
		//login �׸� ����
		session.removeAttribute("login");
		session.removeAttribute("userId");
		
		//���� ������ ��� ����
		//session.invalidate();
%>
<script type="text/javascript">
	alert("�α׾ƿ� �Ǿ����ϴ�.");
	location.href="../index.jsp";
</script>







