<%@page import="com.sun.corba.se.pept.transport.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
<%@page import="my.miniboard.*"%>
<%
	//��� �и�
	//������ ����
	//DB���� �� ó�� -> java file
	//����� �˸�
%>
<!-- insert.jsp : DB�� ������ ����ִ� ������ -->
<!-- Oracle�� TEST ���̺� ������ ����ִ� ���� ��ǥ -->
<%
	request.setCharacterEncoding("euc-kr");
	String name = request.getParameter("name");
	String text = request.getParameter("text");
	//3. ��ȿ�� �˻�
	if (name == null || name.trim().equals("") || text == null) {
		response.sendRedirect("home.jsp");//�ѾƳ��ڴ�.
		return;
	}

	//DB���� �� ó��
	//�ù��� (DAO) �ҷ��� ��Ű�� ���ǹޱ�
	//my.miniboard.MiniDAO dao = new my.miniboard.MiniDAO();
	MiniDAO dao = new MiniDAO();
	int result = dao.inset(name, text);
	
	if (result > 0) {
%>
<script type="text/javascript">
	alert("�Խñ� �Է� ����");
	location.href = "list.jsp";
</script>
<%
	} else {
%>
<script type="text/javascript">
	alert("�Խñ� �Է� ����...");
	location.href = "home.jsp";
</script>
<%
	}
%>

