<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- session�� login�̶�� �׸��� ������ �α׾ƿ� ó���Ѵ�. -->
<%
	//session data����

	//��1. login �׸� �����Ѵ�.
	session.removeAttribute("login");
	session.removeAttribute("userId");

	//��2. ���� ������ ��� ����
	//session.invalidate();
	//������ ������ ������.
	//������ �ٸ� �����͸� ���� �������������� �����Ͽ��� �Ѵ�.
%>
<script type="text/javascript">
	alert("�α׾ƿ� �Ǿ����ϴ�.");
	location.href = "../index.jsp";
</script>