<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!--  home.jsp : DBConnect�� send.jsp�� ���� ������ �����ϴ� ������ �Դϴ�. -->

<!-- top.jsp�� �ҷ��´�. -->
<%@ include file="../top.jsp"%>

	<h1>�Խñ� ���</h1>
	<form action="insert.jsp" method="post">
		<table border="1">
			<tr>
				<th colspan ="1" width = "30%">�Խñ� ���</th>
			</tr>
			<tr>
				<th>�ۼ���</th>
				<td> <input type="text" name="name"> </td>
			</tr>
			<tr>
				<th>����</th>
				<td> <input type="text" name="text"> </td>
			</tr>
			<tr>
				<th colspan ="1">
				<input type="submit" value="�Է�">
				  <input type = "reset" value = "���">
				</th>
			</tr>
		</table>
	</form>
	
	<br>
	<h1>�Խñ� ���</h1>
	<a href="list.jsp"><input type="submit" value="�̵�"></a>
	
	<br>
	<h1>�Խñ� ����</h1>
	<form action="delete.jsp" method="post">
		<table border="1">
			<tr>
				<th colspan ="1" width = "30%">�Խñ� ����</th>
			</tr>
			<tr>
				<th>�ۼ���</th>
				<td> <input type="text" name="name"> </td>
			</tr>
			<tr>
				<th colspan ="1">
				<input type="submit" value="�Է�">
				  <input type = "reset" value = "���">
				</th>
			</tr>
		</table>
	</form>
	
	<br>
	<h1>�Խñ� �˻�</h1>
	<form action="find.jsp" method="post">
		<table border="1">
			<tr>
				<th colspan ="1" width = "30%">�Խñ� �˻�</th>
			</tr>
			<tr>
				<th>�ۼ���</th>
				<td> <input type="text" name="name"> </td>
			</tr>
			<tr>
				<th colspan ="1">
				<input type="submit" value="�Է�">
				  <input type = "reset" value = "���">
				</th>
			</tr>
		</table>
	</form>
	
<!-- bottom.jsp�� �ҷ��´�. -->
<%@ include file="../bottom.jsp"%>






