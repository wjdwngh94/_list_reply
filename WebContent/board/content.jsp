<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="my.board.*, java.util.*" %>
<!-- content.jsp : �Խñ� ��ȣ�� ������ ������ �����ִ� ������ -->
<jsp:useBean id="bdao" class="my.board.BoardDAO"/>
<%
	String tmp = request.getParameter("no");
	int no = 0;
	try{
		no = Integer.parseInt(tmp);
		if(no<=0) throw new Exception();
	}catch(Exception e){
		response.sendRedirect("list.jsp");
		return;
	}
	
	//�ƹ����� ��ȸ���� ������Ű�� �ȵǹǷ�...session�� �̿�
	//session�� readTable �̶�� �̸��� Set�� ����ְ�
	//������ Ȯ���Ͽ� ���� �������� �����ϰڴ�..
	
	//session���� readTable ��������.
	HashSet<Integer> readTable = 
		(HashSet<Integer>)session.getAttribute("readTable");
	
	//������ ���� �����.
	if(readTable==null){
		readTable = new HashSet<Integer>();
	}
	
	//readTable�� ���� �д� �� ��ȣ�� �ִ��� Ȯ��
	if(readTable.add(no)){//readTable.add(no) == true
		//ó�� �д� ���� ���, ��ȸ�� 1 ����
		bdao.plusCount(no);
		session.setAttribute("readTable", readTable);//����
	}
	
	//no�� �Խñ��� ��� ������ �ҷ��;� �Ѵ�.
	BoardDTO bdto = bdao.getBoard(no); 
	//null�� ��� ����
	if(bdto==null){
		response.sendRedirect("list.jsp");
		return;
	}
%>
<%@ include file="/top.jsp"%>
<script type="text/javascript">
	function sendReply(){
		alert("���� ���� �غ����̿���");
	}
	function sendRec(){
		alert("��õ ����Դϴ�.");
	}
	function sendEdit(no){
		//alert("���� ����Դϴ�.");
		location.href="pw.jsp?no="+no+"&next=edit.jsp";
	}
	function sendDel(no){
		//alert("���� ����Դϴ�.");
		location.href="pw.jsp?no="+no+"&next=delete.jsp";
	}
</script>
<div align="center">
	<h1>�� �� ��</h1>
	<table class="outline" width="650">
	<tr>
		<th class="m2" width="20%">��ȣ</th>
		<td class="m3" width="30%"><%=no%></td>
		<th class="m2" width="20%">��ȸ��</th>
		<th class="m3"><%=bdto.getReadcount()%></th>
	</tr>
	<tr>
		<th class="m2">�ۼ���</th>
		<td class="m3"><%=bdto.getWriter()%></td>
		<th class="m2">��õ��</th>
		<th class="m3"><%=bdto.getRecommand()%></th>
	</tr>
	<tr>
		<th class="m2">����</th>
		<td class="m3" colspan="3"><%=bdto.getTitle()%></td>
	</tr>
	<tr height="200">
		<th class="m2">����</th>
		<td class="m3" colspan="3" valign="top"
			style="word-break:break-all;"><!-- �ٰ��� �Ӽ� -->
		<%=bdto.getContent()%>
		</td>
	</tr>
	<tr>
		<th class="m2" colspan="4">
			<input type="button" value="�۾���"
									onclick="location.href='write.jsp';">
			<input type="button" value="��۾���"
									onclick="sendReply();">
			<input type="button" value="��õ�ϱ�"
									onclick="sendRec();">
			<input type="button" value="����"
									onclick="sendEdit(<%=no%>);">
			<input type="button" value="����"
									onclick="sendDel(<%=no%>);">
			<input type="button" value="���"
									onclick="location.href='list.jsp';">
		</th>
	</tr>
	</table>
</div>
<%@ include file="/bottom.jsp"%>

















