<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- pw.jsp : ��й�ȣ �Է� ������ -->
<%
	//��ȣ �ް�
	String tmp = request.getParameter("no");
	int no = 0;
	//���� ������ �ּ�
	String next = request.getParameter("next");
	try{
		no = Integer.parseInt(tmp);
		if(no<=0) throw new Exception();
		if(next==null||next.trim().equals(""))
				throw new Exception();
	}catch(Exception e){
		response.sendRedirect("list.jsp");
		return;
	}
%>
<%@ include file= "/top.jsp"%>
<script type="text/javascript">
	function checkForm(){
		if(!f.pw.value){
			alert("��й�ȣ �Է�");
			f.pw.focus();
			return;
		}
		document.f.submit();//����
	}
</script>
<div align="center">
	<h2>��й�ȣ �Է�</h2>
	<form name="f" action="pwPro.jsp" method="post">
	
	<!-- ���� ���������� ���۵� �����͵鵵 hidden���� ÷�� -->
	<input type="hidden" name="no" value="<%=no%>">
	<input type="hidden" name="next" value="<%=next%>">
	
	<table class="outline" width="300">
		<tr>
			<th class="m3">
			<input type="password" name="pw" class="box">
			<input type="button" value="Ȯ��"
				onclick="checkForm();">
			</th>
		</tr>
	</table>
	</form>
</div>
<%@ include file="/bottom.jsp" %>










