<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.*"%>
<%@ page import="my.member.*"%>


<!-- DB�� ������ �ٲٱ� -->

<!-- Connection Pool Bean �� Application������ �����Ѵ�. -->
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean"
	scope="application"></jsp:useBean>

<!-- mbdao��� ���� �����ϰ� pool�� ������ mbdao���� ���� -->
<!-- �մ��� ��ǻ�͸� �̿��ϴ� �������� -->
<jsp:useBean id="mbdao" class="my.member.MemberDAO" />

<jsp:setProperty property="pool" name="mbdao" value="<%=pool%>" />


<!-- memberList.jsp : ȸ�� ��� + �˻� ������ -->
<!-- �˻�â�� ����� �˻����� ������ ���� ��带 ���� -->
<%@ include file="/top.jsp"%>
<!-- javascript �Լ� -->
<script type="text/javascript">
	function openEdit(no){
		//alert(no+"�� ȸ�� ����!");
		//��â�� ��� ������� ������ �����ϵ��� ȭ�鿡 ǥ��
		window.open("memberEdit.jsp?no="+no,"", 
							"width=500, height=500");
	}
	function openDel(no){
		//alert(no+"�� ȸ�� ����!");
		//Ȯ��â ��� �� ���� �����ϸ� ���� �������� ����
		var check = window.confirm("���� �����Ͻðڽ��ϱ�?");
		if(check){//���� ��������
			location.href="memberDelete.jsp?no="+no;
		}
	}
</script>

<div align="center">
	<!-- �˻��� ���� �ڵ� -->
	<%
		request.setCharacterEncoding("euc-kr");
		String search = request.getParameter("search");
		String searchString = request.getParameter("searchString");
	%>
	<h2>
		search :
		<%=search%>, searchString :
		<%=searchString%></h2>
	<%
		String mode = "";

		ArrayList<MemberDTO> list = null;
		if (search != null && searchString != null
				&& !searchString.trim().equals("")) {
			mode = "�˻� ���";//�˻�	
			list = mbdao.findMember(search, searchString);
		} else {
			mode = "��� ���";//���
			list = mbdao.listMember();
		}
	%>
	<h1>
		����
		<%=mode%></h1>

	<!-- ��� ��� �κ� -->
	<table class="outline" width="600">
		<!-- ���� -->
		<tr>
			<th class="m2">��ȣ</th>
			<th class="m2">���̵�</th>
			<th class="m2">�̸�</th>
			<th class="m2">����</th>
			<th class="m2">����</th>
			<th class="m2">����</th>
			<th class="m2">����</th>
		</tr>
		<!-- ������ -->
		<%
			for (MemberDTO mbdto : list) {
		%>
		<tr>
			<th class="m3"><%=mbdto.getNo()%></th>
			<th class="m3"><%=mbdto.getId()%></th>
			<th class="m3"><%=mbdto.getName()%></th>
			<th class="m3"><%=mbdto.getGender()%></th>
			<th class="m3"><%=mbdto.getPower()%></th>
			<th class="m3"><a
				href="javascript:openEdit(<%=mbdto.getNo()%>);">����</a></th>
			<th class="m3"><input type="button" value="����"
				onclick="openDel(<%=mbdto.getNo()%>);"></th>
		</tr>
		<%
			}
		%>
	</table>
	<br>
	<br>
	<!-- �˻��� �Է�â : action�� ������ ������ ���������� ���� -->
	<form method="post">
		<select name="search" class="box">
			<option value="name">�̸�
			<option value="id">���̵�
		</select> <input type="text" name="searchString" class="box" size="30">
		<input type="submit" value="�˻�">
	</form>
</div>
<%@ include file="/bottom.jsp"%>














