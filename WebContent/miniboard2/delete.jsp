<%@page import="com.sun.corba.se.pept.transport.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
<%@page import="my.miniboard.*"%>
<!-- delete.jsp : �̸��� �޾� ��ġ ����  -->
<%
	//�ۼ���(name)�� �ޱ�
	request.setCharacterEncoding("euc-kr");
	String name = request.getParameter("name");
	if (name == null || name.trim().equals("")) {
		response.sendRedirect("home.jsp");//�ѾƳ��ڴ�.
		return;
	}
	//DAO���Ѽ� ������ ���� ��û�Ѵ�.
	MiniDAO dao = new MiniDAO();

	//�� ó�������̾ƴ϶� ����� �˰� �ʹ�
	//boolean char int��� �����ϴ�.
	boolean result = dao.delete(name);
	//dao.delete : ���۰��� ���
	//dao.delete(name) : ���۰��� a�� ���

	String msg = "", url = "";
	if (result) {

		msg = "���� ����";
		url = "list.jsp";

	} else {

		msg = "���� ����";
		url = "home.jsp";

	}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>
