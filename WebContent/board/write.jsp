<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<jsp:useBean id="pool" class="my.db.ConnectionPoolBean"
	scope="application" />
<!-- mbdao��� ���� ���� -->
<jsp:useBean id="bddao" class="my.board.BoardDAO" />
<!-- pool�� ������ mbdao���� ���� -->
<jsp:setProperty name="bddao" property="pool" value="<%=pool%>" />

<!-- memberInput.jsp�� ������ �ٿ��ְ� ���� -->
<html>
<head>
<title>���ο� �۾���</title>
<link rel="stylesheet" type="text/css" href="../style.css">
<script type="text/javascript">
	function checkForm() {
		//�� �˻�(name)
		if (!f.pw.value) {
			alert("��й�ȣ�� �Է��ϼ���");
			f.pw.focus();
			return;
		} else if (f.pw.value.length < 3) {
			alert("��й�ȣ�� �� ª�׿�?");
			f.pw.select();//�ش��ؽ�Ʈ ����
			return;
		}

		//�� ����(document ���� ��ü Ȱ��)
		//f��� form�� submit ��ư�� ���� �Ͱ� ���� ó���϶�
		document.f.submit();
	}
	function cancel() {
		var check = window.confirm("���� â�� �����ðڽ��ϱ�?");
		//alert(check);
		if (check) {//true
			window.close();
		}
	}
</script>
</head>
<body>
	<div align="center">
		<form name="f" action="writePro.jsp" method="post">
			<!-- �ʿ��� �����ʹ� hidden���� ÷���Ѵ�. -->
			<h2>�۾���</h2>
			<hr color="red" width="300">
			<table width="500" class="outline">
				<tr>
					<th class="m2">�����</th>
					<td class="m3"><input type="text" name="writer" class="box"
						maxlength="15" size="10"></td>
				</tr>
				<tr>
					<th class="m2">����</th>
					<td class="m3"><input type="text" name="title" class="box"
						maxlength="15" size="10"></td>
				</tr>
				<tr>
					<th class="m2" rowspan="10">����</th>
					<td class="m3" rowspan="10"><textarea name="content" class="box"></textarea></td>
				</tr>
				<tr>
				</tr>
				<tr>
				</tr>
				<tr>
				</tr>
				<tr>
				</tr>
				<tr>
				</tr>
				<tr>
				</tr>
				<tr>
				</tr>
				<tr>
				</tr>
				<tr>
				</tr>
				<tr>
				</tr>
				<tr>
					<th class="m2">��й�ȣ</th>
					<td class="m3"><input type="password" name="pw" class="box"
						maxlength="20" size="20"></td>
				</tr>
				<tr>
					<th class="m2" colspan="2"><input type="button" value="���"
						onclick="checkForm();"> <input type="button" value="���"
						onclick="cancel();"></th>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>



















