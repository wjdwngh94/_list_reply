<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- list.jsp : ����� ������ ����� ǥ���ϴ� ������ -->
<%
	//(4�ܰ踦 ��ġ��)
	//�ٷ� db�����Ѵ�.
	//1.������������ �����ų�� �𸣱� ������ �켱 driver�˻��� �Ѵ�.
	Class.forName("oracle.jdbc.driver.OracleDriver");

	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	//localhost == 127.0.0.1
	String user = "jsp1";
	String pass = "jsp1";
	//�α���

	Connection con = DriverManager.getConnection(url, user, pass);
	//������(��ü����� �������� ���̹Ƿ� ���� ������ �������(��ȣ�� ���� ����))

	String sql = "select * from miniboard order by no asc";//������
	PreparedStatement ps = con.prepareStatement(sql);
	//����ǥ ����
	ResultSet rs = ps.executeQuery();
%>
<!-- top.jsp�� �ҷ��´�. -->
<%@ include file="../top.jsp"%>

<h1>��ϵ� �Խñ�</h1>
	<table border="1">


		<tr>
			<th>��ȣ</th>
			<th>�ۼ���</th>
			<th>����</th>
			<th>�ۼ���</th>
		</tr>
		<!-- ������ : �����Ͱ� ���� ������ 1�پ� ���� -->
		<%
			while (rs.next()) {//�����Ͱ� ������
		%>
		<tr>
			<th><%=rs.getInt("no")%></th>
			<th><%=rs.getString("writer")%></th>
			<th><%=rs.getString("content")%></th>
			<th><%=rs.getString("regdate")%></th>
		</tr>
		<%
			}
		%>

	</table>
<!-- bottom.jsp�� �ҷ��´�. -->
<%@ include file="../bottom.jsp"%>










