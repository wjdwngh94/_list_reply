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
	//���� �� ���� ���ϴ� �Լ��� ����� �ش�
	function onlyA() {
		var key = event.keyCode;
		if ((key >= 65 && key <= 90) || (key >= 97 && key <= 122)
				|| (key >= 48 && key <= 57)) { //ASCII CODE���̿��Ѵ�.
			event.returnValue = true;
			//���
		} else {
			//event.returnValue = false; //�̹������ �ɷ��� �� �ִ� ���� explorer10�����̴�.
			event.preventDefault();
			//����
		}
	}
	function onlyNum() {
		//alert("onluNum");
		//event : javascript�� �̺�Ʈ ������ ������ �ִ� ��ü
		//alert(event.keyCode);
		var key = event.keyCode;
		if (key >= 48 && key <= 57) { //ASCII CODE���̿��Ѵ�.
			event.returnValue = true;
			//���
		} else {
			//event.returnValue = false; //�̹������ �ɷ��� �� �ִ� ���� explorer10�����̴�.
			event.preventDefault();
			//����
		}
	}
	function checkForm() {
		//Form �˻�(name) - form�� �������϶��� ���δٸ��̸��� �ο��ؼ� �˻��Ѵ�.
		//���� �˻� (DOM����)
		if (f.name.value == '') {
			alert("�̸��� �Է����� �����̳׿�");
			f.name.focus(); //Ŀ���� name box������ �̵��Ѵ�.
			return;
		} else if (!f.id.value) {
			alert("���̵� �Է����� �����̳׿�");
			f.id.focus();
			return;
		} else if (!f.pw.value) {
			alert("�н����带 �Է����� �����̳׿�");
			f.pw.focus();
			return;
		} else if (!f.birth.value) {
			alert("��������� �Է����� �����̳׿�");
			f.birth.focus();
			return;
		} else if (f.id.value.length < 3) {
			alert("���̵� �� ª�׿�?");
			f.id.focut();
		} else if (f.pw.value.length < 3) {
			alert("�н����尡 �� ª�׿�?");
			//f.pw.focus(); 
			f.pw.select();//�ش� �ؽ�Ʈ�� �������ش�(��ó��)
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

<script src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

						// �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
						// �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
						var fullAddr = ''; // ���� �ּ� ����
						var extraAddr = ''; // ������ �ּ� ����

						// ����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
						if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
							fullAddr = data.roadAddress;

						} else { // ����ڰ� ���� �ּҸ� �������� ���(J)
							fullAddr = data.jibunAddress;
						}

						// ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����Ѵ�.
						if (data.userSelectedType === 'R') {
							//���������� ���� ��� �߰��Ѵ�.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// �ǹ����� ���� ��� �߰��Ѵ�.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// �������ּ��� ������ ���� ���ʿ� ��ȣ�� �߰��Ͽ� ���� �ּҸ� �����.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
						document.getElementById('sample6_postcode').value = data.zonecode; //5�ڸ� �������ȣ ���
						document.getElementById('sample6_address').value = fullAddr;

						// Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
						document.getElementById('sample6_address2').focus();
					}
				}).open();
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
					<td class="m3"><input type="text" name="name" class="box"
						maxlength="15" size="17"> <!-- maxlength�� ����Ͽ� �ִ��Է°��� �����Ѵ�. -->
					</td>
				</tr>
				<tr>
					<th class="m2">���̵�</th>
					<td class="m3"><input type="text" name="id" class="box"
						maxlength="20" size="23" onkeypress="onlyA();"
						style="IME-MOD: disabled;" placeholder="�ִ� 20��"></td>
				</tr>
				<tr>
					<th class="m2">��� ��ȣ</th>
					<td class="m3"><input type="password" name="pw" class="box"
						maxlength="20" size="23" style="IME-MOD: disabled;"
						onkeypress="onlyA();" placeholder="�ִ� 20��"> <!-- type�� password�� �����Ǹ� �Է½� ������ �ʴ´�. -->
						<!-- placeholder�� ����Ͽ� �Է����� �ڽ��� �ش� �޼����� ����. --></td>
				</tr>
				<tr>
					<th class="m2">���� ����</th>
					<td class="m3"><input type="text" name="birth" class="box"
						maxlength="8" size="11" onkeypress="onlyNum();"
						style="ime-mod: disabled;"> <!-- size �� �Է� �ڽ��� ũ�⸦ �����Ѵ�. -->
						<!-- 
						onkeydown:�Է°��� ��� ���ڷ� ���� 
						onkeyup:���ڰ� �ö��� �� 
						onkeypress 
						--> <!-- ���ͳ� exproler�� �ѱ��Է� ���� style="ime-mod : disabled;" -->
						����:20010101</td>
				<tr>
					<th class="m2">����</th>
					<td class="m3"><select name="gender" class="box">
							<option value="����">����</option>
							<option value="����">����</option>
					</select></td>

				</tr>
				<tr>
					<th class="m2" rowspan="3">�����ȣ</th>
					<td class="m3"><input type="text" id="sample6_postcode"
						placeholder="�����ȣ" maxlength="6" size="8" class="box" readonly
						onclick="sample6_execDaumPostcode()"> <!-- �б����� readonly�� ����Ͽ� ������ �����Ѵ�. -->
						<!-- disabled�� ��� ������ ������ �� ������ ���۶��� ���� �ʴ´�. --> <input
						type="button" onclick="sample6_execDaumPostcode()" value="�����ȣ ã��"></td>
				</tr>
				<tr>
					<td class="m3"><input type="text" id="sample6_address"
						placeholder="�ּ�" name="addr1" class="box" maxlength="50" size="40"
						readonly></td>
				</tr>
				<tr>
					<td class="m3"><input type="text" id="sample6_address2"
						placeholder="���ּ�" name="addr2" maxlength="50" size="40"></td>
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