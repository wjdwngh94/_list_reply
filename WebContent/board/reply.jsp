<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- reply.jsp : ��� ���� ������ -->
<%
	request.setCharacterEncoding("euc-kr");//title
	String tmp = request.getParameter("no");
	int no = 0;
	try{
		no = Integer.parseInt(tmp);
		if(no<=0) throw new Exception();
	}catch(Exception e){
		response.sendRedirect("write.jsp");
		return;
	}
%>
<%@ include file="/top.jsp"%>
<script type="text/javascript">
	function formCheck(){
		//f��� �̸��� form�� �˻�(���δ�)
		if(!f.writer.value){
			alert("�ۼ��ڸ� �Է��ϼ���");
			f.writer.focus();
			return false;//����
		}else if(!f.title.value){
			alert("������ �Է��ϼ���");
			f.title.focus();
			return false;//����
		}else if(!f.content.value){
			alert("������ �Է��ϼ���");
			f.content.focus();
			return false;//����
		}else if(!f.pw.value){
			alert("��й�ȣ�� �Է��ϼ���");
			f.pw.focus();
			return false;//����
		}
		
		//return true;//������ ����Ѵ�(���� ����)
	}
</script>
<div align="center">
	<h1>�� �� �� ��</h1>
	<form name="f" action="replyPro.jsp" method="post"
				onsubmit="return formCheck();">
	<!-- onsubmit : submit�� �����ϸ� �߻��Ǵ� �̺�Ʈ
			return formCheck() ��� ������ 
			formCheck() �� ��ȯ���� ���� �����ϰڴٴ� �� -->
	<input type="hidden" name="no" value="<%=no%>">
	<input type="hidden" name="ref" 
			value="<%=request.getParameter("ref")%>">
	<input type="hidden" name="re_step" 
			value="<%=request.getParameter("re_step")%>">
	<input type="hidden" name="re_level" 
			value="<%=request.getParameter("re_level")%>">
	<table class="outline" width="650">
	<tr>
		<th class="m2" width="100">�ۼ���</th>
		<td class="m3">
		<input type="text" name="writer" maxlength="10"
		size="10" class="box">
		</td>
	</tr>
	<tr>
		<th class="m2" width="100">����</th>
		<td class="m3">
		<input type="text" name="title" maxlength="33"
		size="50" class="box"
		value="[Re] <%=request.getParameter("title")%>">
		</td>
	</tr>
	<tr>
		<th class="m2" width="100">����</th>
		<td class="m3">
		<textarea name="content" class="box" rows="10"
		cols="55"></textarea>
		</td>
	</tr>
	<tr>
		<th class="m2" width="100">��й�ȣ</th>
		<td class="m3">
		<input type="password" name="pw" maxlength="15"
		size="15" class="box">
		</td>
	</tr>
	<tr>
		<th class="m2" colspan="2">
			<input type="submit" value="���">
			<input type="button" value="���"
					onclick="location.href='list.jsp';">
		</th>
	</tr>
	</table>
	</form>
</div>
<%@ include file="/bottom.jsp"%>

















