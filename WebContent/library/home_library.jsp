<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!--  home.jsp : DBConnect�� send.jsp�� ���� ������ �����ϴ� ������ �Դϴ�. -->

<!-- top.jsp�� �ҷ��´�. -->
<%@ include file="../top.jsp"%>

<div align="center">

	<br>
	<h1>���� ��� ������</h1>
	<form action="insert_library.jsp" method="post">
		<table border="1" width="80%">
			<tr>
				<th colspan="2" width="30%">���� ���</th>
			</tr>
			<tr>
				<th width="5%">������</th>
				<td><input type="text" name="writer">
			</tr>
			<tr>
				<th height="10%">������</th>
				<td><input type="text" name="name">
			</tr>
			<tr>
				<th height="10%">����</th>
				<td><input type="text" name="price">
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="���"> <input
					type="reset" value="���"></th>
			</tr>
		</table>
	</form>

	<hr color="green">

	<h1>���� ��� ������</h1>
	
	<hr color="green">
	
	<table border="1">
		<tr>
			<th><a href="list_library.jsp"> <input type="submit" value="�̵�">
			</a></th>
		</tr>
	</table>

	<hr color="green">

	<h1>���� ���� ������</h1>
	<form action="delete_library.jsp" method="post">
		<table border="1" width="90%">

			<tr>
				<th>������</th>
				<td><input type="text" name="name"></td>
				<th colspan="1"><input type="submit" value="����">
				</th>
			</tr>
			
		</table>
	</form>

	<hr color="green">

	<br>
	<h1>���� �˻� ������</h1>
	<form action="find_library.jsp" method="post">
		<table border="1" width="90%">

			<tr>
				<td>�˻��� �Է� (������or������)</td>
				<td><input type="text" name="name"></td>
				<th colspan="1"><input type="submit" value="�˻�"></th>
			</tr>
		</table>
	</form>
	<br>
</div>
<!-- bottom.jsp�� �ҷ��´�. -->
<%@ include file="../bottom.jsp"%>






