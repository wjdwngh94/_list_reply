<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- list.jsp : ����� ������ ����� ǥ���ϴ� ������ -->
<%
	//DB����ܰ�

	//1.����̹� �˻�
	//������������ �����ų�� �𸣱� ������ �켱 driver�˻��� �Ѵ�.
	Class.forName("oracle.jdbc.driver.OracleDriver");

	//2.�α���
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	//localhost == 127.0.0.1
	String user = "jsp1";
	String pass = "jsp1";
	Connection con = DriverManager.getConnection(url, user, pass);

	//3.��������
	String sql = "select * from miniboard order by no asc";//desc asc
	PreparedStatement ps = con.prepareStatement(sql);

	//����ǥ ����

	//4.���� �� ���Ȯ��
	ResultSet rs = ps.executeQuery();

	//rs�� �ִ� �����͸� ȭ�鿡 ���
%>
<!-- top.jsp�� �ҷ��´�. -->
<%@ include file="../top.jsp"%>
<div align="center">
	<!-- ��� ��� -->
	<h1>��ϵ� �Խñ�</h1>
	<table border="1" width="600">
		<tr>
			<th>��ȣ</th>
			<th>�ۼ���</th>
			<th width="40%">����</th>
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
</div>
<!-- bottom.jsp�� �ҷ��´�. -->
<%@ include file="../bottom.jsp"%>
<%
	//5.���� ���� - rs,ps,con�� ���
	rs.close();
	ps.close();
	con.close();
%>