<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- pwPro.jsp : ��й�ȣ Ȯ�� -->
<jsp:useBean id="bdao" class="my.board.BoardDAO"/>
<%
	//��ȣ �ް�
	String tmp = request.getParameter("no");
	int no = 0;
	//���� ������ �ּ�
	String next = request.getParameter("next");
	//��й�ȣ
	String pw = request.getParameter("pw");
	try{
		no = Integer.parseInt(tmp);
		if(no<=0) throw new Exception();
		if(next==null||next.trim().equals(""))
				throw new Exception();
		if(pw==null||pw.trim().equals(""))
				throw new Exception();
	}catch(Exception e){
		response.sendRedirect("list.jsp");
		return;
	}
	
	//BoardDAO�� ��ü���� ��й�ȣ �˻� ��û
	boolean result = bdao.checkPw(no, pw);
	if(result){//true, ��й�ȣ ��ġ, next�� ����(no ÷��)
		//response.sendRedirect(next+"?no="+no);%>
	<!-- post����� �̿��ϱ� ���� form�� ����� ���� -->
	<form name="f" action="<%=next%>" method="post">
	<input type="hidden" name="no" value="<%=no%>">
	<!-- ������ ���õ� �� -->
	<input type="hidden" name="check" value="ok">
	</form>
	<script type="text/javascript">
		document.f.submit();//post��� ����
	</script>
<%}else{//false, ��й�ȣ ����ġ%>
		<script type="text/javascript">
			alert("��й�ȣ�� ���� �ʽ��ϴ�.");
			history.back();//�ڷ� 1������
		</script>
<%}%>




















