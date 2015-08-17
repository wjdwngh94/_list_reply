<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!-- search.jsp : �˻��� ������ ����� ǥ���ϴ� ������ -->

<%
	request.setCharacterEncoding("euc-kr");
	String name = request.getParameter("name");

	//��ȿ�� �˻�
	if (name == null || name.trim().equals("")) {
		response.sendRedirect("home.jsp");//�ѾƳ��ڴ�.
		return;//_jspService();�� �����Ѵ�.
	}

	Class.forName("oracle.jdbc.driver.OracleDriver");

	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	//localhost == 127.0.0.1
	String user = "jsp1";
	String pass = "jsp1";
	//�α���

	Connection con = DriverManager.getConnection(url, user, pass);
	//������(��ü����� �������� ���̹Ƿ� ���� ������ �������(��ȣ�� ���� ����))

	String sql = "select * from miniboard where writer like ? order by no asc";//������
	PreparedStatement ps = con.prepareStatement(sql);
	//����ǥ ����
	ps.setString(1, "%" + name + "%");//���� �˻�

	ResultSet rs = ps.executeQuery();
%>
<!-- top.jsp�� �ҷ��´�. -->
<%@ include file="../top.jsp"%>

<h1>��ϵ� �Խñ�</h1>
<table border="1">

	<tr>
		<th>��ȣ</th>
		<th>�̸�</th>
		<th width="40%">����</th>
		<th>�ۼ���</th>
	</tr>
	<!-- ������ : �����Ͱ� ���� ������ 1�پ� ���� -->
	<%
		while (rs.next()) {//�����Ͱ� ������
	%>
	<tr>
		<th><%=rs.getInt("no")%></th>
		<!-- rs.getInt(1) -->
		<th><%=rs.getString("writer")%></th>
		<th><%=rs.getString("content")%></th>
		<th><%=rs.getString("regdate")%></th>
	</tr>
	<%
		}
	%>
</table>
<br>
<br>
<h1>
	<a href="home.jsp">�������� �̵�</a>
</h1>

<!-- bottom.jsp�� �ҷ��´�. -->
<%@ include file="../bottom.jsp"%>









