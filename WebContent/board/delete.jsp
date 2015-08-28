<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- delete.jsp : �Խñ� ���� -->
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
	
	//no�� ����� ��ȣ�� ���� �����Ѵ�.
	boolean result = bdao.deleteBoard(no);
	if(result){//���� : list.jsp%>
		<script type="text/javascript">
			alert("�� ���� ����!");
			location.href="list.jsp";
		</script>
<%}else{//���� : content.jsp (+no)%>
		<script type="text/javascript">
			alert("�� ���� ����...");
			location.href="content.jsp?no=<%=no%>";
		</script>
<%}%>

























