<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- login.jsp -->
<%@include file="../top.jsp"%>
<script type="text/javascript">
	function loginCheck() {
		if (!f.id.value) {
			alert("���̵� �Է��ϼ���.");
			f.id.focus();
			return;
		}
		if (!f.pw.value) {
			alert("��й�ȣ�� �Է��ϼ���.");
			f.pw.focus();
			return;
		}
		document.f.submit();
	}
</script>
<div align="center">
	<br> <img src="../img/bottom.gif" width="570" height="40"
		border="0" alt=""> <br>
	<p />
	<img src="../img/tm_login.gif" width="100" height="13" border="0"
		align="center" alt="ȸ�� �α���">
	<form name="f" action="login_ok.jsp" method="post">
		<table width="60%" align="center" border="0" height="120">
			<tr>
				<td align="right" width="30%"><img src="../img/id01.gif"
					width="28" height="11" border="0" alt="���̵�"> &nbsp;&nbsp;</td>
				<td width="40%"><input type="text" name="id"></td>
				<td rowspan="2" width="30%" valign="middle"><a
					href="javascript:loginCheck()"> <img src="../img/bt_login.gif"
						border="0" alt="�α���">&nbsp;&nbsp;<br> <!-- &nbsp ���⸦ �ѹ� �� �ϰڴ� - ���� ��� ���� -->
				</a> <nobr>
						<!-- br�±װ� ������� �ʴ� ���� // br�� �ĵ� ������ �ȵȴ�.
						// �� ��Ʋ���� ������ �� �ִ�. -->
						<input type="checkbox" name="saveId"> <font face="����"
							size="2">���̵� ����ϱ�</font>
					</nobr></td>
			</tr>
			<tr>
				<td align="right"><img src="../img/pwd.gif" width="37"
					height="11" border="0" alt="��й�ȣ"> &nbsp;&nbsp;</td>
				<td width="40%"><input type="password" name="pw"></td>
			</tr>
			<tr>
				<td colspan="3" align="center"><a
					href="javascript:openMember()"> <img src="../img/bt_join.gif"
						width="60" height="22" border="0" alt="ȸ������">
				</a> <a href="javascript:searchMember('id')"> <img
						src="../img/bt_search_id.gif" width="60" height="22" border="0"
						alt="���̵�ã��">
				</a> <a href="javascript:searchMember('pw')"> <img
						src="../img/bt_search_pw.gif" width="60" height="22" border="0"
						alt="��й�ȣ ã��">
				</a></td>
			</tr>
		</table>
	</form>
</div>
<%@include file="../bottom.jsp"%>