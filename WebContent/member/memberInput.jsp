<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- ���� 
	1.��� �ʼ��Է��׸��� �˻� �� ���� �߻��� ���� ����
	2.�Է� �׸��� ���̸� ����
	3.�Է�â ũ�⵵ ���̿� �°� ����
	4.������� ���� ��� ���ڸ� �Է� �����ϵ��� ����
	5.id�� �ѱ��� �Էµ��� �ʵ��� �����Ѵ� -->
<html>
<head>
<title>ȸ�� ����</title>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/style.css">
<script type="text/javascript">
	function checkForm() {
		//Form �˻�(name) - form�� �������϶��� ���δٸ��̸��� �ο��ؼ� �˻��Ѵ�.
		//���� �˻� (DOM����)
		if (f.name.value == '') {
			alert("�̸��� �Է����� �����̳׿�");
			f.name.focus(); //Ŀ���� name box������ �̵��Ѵ�.
			return;
		}
		//Form ����(document ���� ���� ��ü)
		//f��� form�� submiot��ư�� ���� �� �˻縦 �Ѵ�.
		document.f.submit();
	}
	function cancel() {
		var check = window.confirm("������ â�� �����ðڽ��ϱ�?"); //true(Ȯ��) false(���)
		if (check) {
			//true
			window.close();
		}
	}
</script>
</head>
<body>
	<div align="center">
		<form name="f" action="memberInput_ok.jsp" method="post">
			<!-- get�����ϸ� �Է°��� �ּҿ� �������� post�� �Ѵ�. -->

			<hr color="red" width="300">
			<!-- �� �߱� -->
			<h2>ȸ�� ���� ���� �Է�</h2>
			<hr color="red" width="300">
			<!-- �� �߱� -->

			<table width="500" class="outline">
				<tr>
					<th class="m2">�̸�</th>
					<td class="m3"><input type="text" name="name" class="box">
					</td>
				</tr>
				<tr>
					<th class="m2">���̵�</th>
					<td class="m3"><input type="text" name="id" class="box">
					</td>
				</tr>
				<tr>
					<th class="m2">��� ��ȣ</th>
					<td class="m3"><input type="password" name="pw" class="box">
						<!-- type�� password�� �����Ǹ� �Է½� ������ �ʴ´�. --></td>
				</tr>
				<tr>
					<th class="m2">���� ����</th>
					<td class="m3"><input type="text" name="birth" class="box">
						���� : 20010101</td>
				<tr>
					<th class="m2">����</th>
					<td class="m3"><select name="gender" class="box">
							<option value="����">����</option>
							<option value="����">����</option>
					</select></td>
				</tr>
				<tr>
					<th class="m2" rowspan="3">�����ȣ</th>
					<td class="m3">�����ȣ �Է�â [��ư]</td>
				</tr>
				<tr>
					<td class="m3">�⺻�ּ� �Է�â</td>
				</tr>
				<tr>
					<td class="m3">���ּ� �Է�â</td>
				</tr>
				<tr>
					<th class="m2" colspan="2"><input type="button" value="����"
						onclick="checkForm();"> <!-- on~ : ~���� �� --> <input
						type="button" value="���" onclick="cancel();"></th>

				</tr>
			</table>
		</form>
	</div>
</body>
</html>