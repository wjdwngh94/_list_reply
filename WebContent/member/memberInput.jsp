<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<html>
<head>
	<title>ȸ�� ����</title>  
	<link rel="stylesheet" type="text/css" href="../style.css">
	<script type="text/javascript">
		function checkForm(){
			//�� �˻�(name)
			//alert(f.name.value);
			if(f.name.value==''){
				alert("�̸��� �Է� ���߳׿�?");
				f.name.focus();
				return;
			}else if(!f.id.value){//f.id.value==''
				alert("���̵� �Է��ϼ���");
				f.id.focus();
				return;
			}else if(!f.pw.value){
				alert("��й�ȣ�� �Է��ϼ���");
				f.pw.focus();
				return;
			}else if(!f.birth.value){
				alert("��������� �Է��ϼ���");
				f.birth.focus();
				return;
			}else if(f.id.value.length < 3){
				alert("���̵� �� ª�׿�?");
				f.id.focus();
				return;
			}else if(f.pw.value.length < 3){
				alert("��й�ȣ�� �� ª�׿�?");
				f.pw.select();//�ش��ؽ�Ʈ ����
				return;
			}
			
			//�� ����(document ���� ��ü Ȱ��)
			//f��� form�� submit ��ư�� ���� �Ͱ� ���� ó���϶�
			document.f.submit();
		}
		function cancel(){
			var check = window.confirm("���� â�� �����ðڽ��ϱ�?");
			//alert(check);
			if(check){//true
				window.close();
			}
		}
		function onlyNum(){
			//event : javascript�� �̺�Ʈ ������ ������ �ִ� ��ü
			//alert(event.keyCode);
			var key = event.keyCode;
			if(key>=48 && key <= 57){
				event.returnValue = true;//���
			}else{
				//event.returnValue = false;//����
				event.preventDefault();
			}
		}
	</script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
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
	                if(data.userSelectedType === 'R'){
	                    //���������� ���� ��� �߰��Ѵ�.
	                    if(data.bname !== ''){
	                        extraAddr += data.bname;
	                    }
	                    // �ǹ����� ���� ��� �߰��Ѵ�.
	                    if(data.buildingName !== ''){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // �������ּ��� ������ ���� ���ʿ� ��ȣ�� �߰��Ͽ� ���� �ּҸ� �����.
	                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
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
	<hr color="red" width="300"> 
	<h2>ȸ�� ���� ���� �Է�</h2> 
	<hr color="red" width="300">
	<table width="500" class="outline">
	<tr>
		<th class="m2">�̸�</th>
		<td class="m3">
			<input type="text" name="name" class="box"
			maxlength="5" size="10"> 
		</td>
	</tr>
	<tr>
		<th class="m2">���̵�</th>
		<td class="m3">
			<input type="text" name="id" class="box"
			maxlength="20" size="20"
			style="ime-mode : disabled;"
			placeholder="�ִ� 20��">
		</td>
	</tr>
	<tr>
		<th class="m2">��й�ȣ</th>
		<td class="m3">
			<input type="password" name="pw" class="box"
			maxlength="20" size="20" placeholder="�ִ� 20��">
		</td>
	</tr>
	<tr>
		<th class="m2">�������</th>
		<td class="m3">
			<input type="text" name="birth" class="box"
			maxlength="8" size="8" onkeypress="onlyNum();"
			style="ime-mode : disabled;"><!-- IE�� �ѱ۱��� �Ӽ� -->
			���� : 20010101	
		</td>
	</tr>
	<tr>
		<th class="m2">����</th>
		<td class="m3">
			<select name="gender" class="box">
				<option value="����">����
				<option value="����">����
			</select>	
		</td>
	</tr>
	<tr>
		<th class="m2" rowspan="3">�ּ�</th>
		<td class="m3">
			<input type="text" id="sample6_postcode"
			name = "post" placeholder="�����ȣ"
			maxlength="6" size="6" class="box" readonly
			onclick="sample6_execDaumPostcode()">
			<!-- disabled�� ��� ��� ���� : ���� �ȵ� -->
			<input type="button" value="�����ȣ ã��"
			onclick="sample6_execDaumPostcode()">
		</td>
	</tr>
	<tr>
		<td class="m3"> 
			<input type="text" id="sample6_address" 
			placeholder="�ּ�" name="addr1" class="box"
			maxlength="50" size="40" readonly>
		</td>
	</tr>
	<tr>
		<td class="m3">
			<input type="text" id="sample6_address2" 
			placeholder="���ּ�" name="addr2" class="box"
			maxlength="50" size="40">
		</td>
	</tr>
	<tr>
		<th class="m2" colspan="2">
		<input type="button" value="����"
		onclick="checkForm();">
		<input type="button" value="���"
		onclick="cancel();">
		</th>
	</tr>
	</table>	
	</form>	 
</div> 
</body>
</html>






