<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- edit.jsp -->
<jsp:useBean id="bdao" class="my.board.BoardDAO"/>
<%
	//���۹�� ����
	String method = request.getMethod();

	//�Ķ���� ����
	String tmp = request.getParameter("no");
	int no = 0;
	String check = request.getParameter("check");
	try{
		no = Integer.parseInt(tmp);				//���ڰ� �ƴϸ�
		if(no<=0) throw new Exception();	//0 ���ϸ� 
		if(!method.equals("POST"))				//POST����� �ƴϸ�
					throw new Exception();
		if(check==null||!check.equals("ok"))	//�������� ok�� �ƴϸ�
					throw new Exception();
	}catch(Exception e){
		response.sendRedirect("list.jsp");
		return;
	}
	
	//no�� ������ �Խñ� 1���� ������ ��� �ҷ��´�.
	my.board.BoardDTO bdto = bdao.getBoard(no);
%>
<%@ include file="/top.jsp"%>
<script type="text/javascript">
	function formCheck(){
		//f��� �̸��� form�� �˻�(���δ�)
		if(!f.title.value){
			alert("������ �Է��ϼ���");
			f.title.focus();
			return false;//����
		}else if(!f.content.value){
			alert("������ �Է��ϼ���");
			f.content.focus();
			return false;//����
		}
		
		//return true;//������ ����Ѵ�(���� ����)
	}
</script>
<div align="center">
	<h1>�� �� ��</h1>
	<form name="f" action="editPro.jsp" method="post"
				onsubmit="return formCheck();">
	<!-- onsubmit : submit�� �����ϸ� �߻��Ǵ� �̺�Ʈ
			return formCheck() ��� ������ 
			formCheck() �� ��ȯ���� ���� �����ϰڴٴ� �� -->
	<input type="hidden" name="no" value="<%=no%>">
	<table class="outline" width="650">
	<tr>
		<th class="m2" width="100">�ۼ���</th>
		<td class="m3">
		<input type="text" name="writer" maxlength="10"
		size="10" class="box" readonly
		value="<%=bdto.getWriter()%>">
		</td>
	</tr>
	<tr>
		<th class="m2" width="100">����</th>
		<td class="m3">
		<input type="text" name="title" maxlength="33"
		size="50" class="box" value="<%=bdto.getTitle()%>">
		</td>
	</tr>
	<tr>
		<th class="m2" width="100">����</th>
		<td class="m3">
		<textarea name="content" class="box" rows="10"
		cols="55"><%=bdto.getContent()%></textarea>
		</td>
	</tr>
	<tr>
		<th class="m2" colspan="2">
			<input type="submit" value="����">
			<input type="button" value="���"
		onclick="location.href='content.jsp?no=<%=no%>'">
			<input type="button" value="���"
					onclick="location.href='list.jsp';">
		</th>
	</tr>
	</table>
	</form>
</div>
<%@ include file="/bottom.jsp"%>

















