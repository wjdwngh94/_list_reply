<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- editPro.jsp : ���� ó�� ������ -->

<%	request.setCharacterEncoding("euc-kr"); %>

<!-- BoardDTO ��ü �����Ͽ� ������ ���� -->
<jsp:useBean id="bdto" class="my.board.BoardDTO"/>
<jsp:setProperty name="bdto" property="*"/>

<jsp:useBean id="bdao" class="my.board.BoardDAO"/>
<%
	//System.out.println(bdto.getNo());
	//System.out.println(bdto.getWriter());
	//System.out.println(bdto.getTitle());
	//System.out.println(bdto.getContent());
	
	boolean result = bdao.editBoard(bdto); 
	if(result){%>
	<script type="text/javascript">
		alert("�Խñ� ���� �Ϸ�!");
		location.href="content.jsp?no=<%=bdto.getNo()%>";
	</script>
<%}else{ %>
	<script type="text/javascript">
		alert("�Խñ� ���� ����...");
		history.back();
	</script>
<%} %>


















