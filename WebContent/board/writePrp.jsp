<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="my.board.*"%>
<%
	//������ ����
	request.setCharacterEncoding("euc-kr");

	//MemberDTO ���� �Ŀ� �����Ͽ� ó��
	BoardDTO bddto = new BoardDTO();
	bddto.setWriter(request.getParameter("writer"));
	bddto.setTitle(request.getParameter("title"));
	bddto.setContent(request.getParameter("content"));
	bddto.setPw(request.getParameter("pw"));
	//�ʿ��ϴٸ� ��ȿ�� �˻�
	if (bddto.getWriter() == null
			|| bddto.getWriter().trim().equals("")) {
		response.sendRedirect("boardInput.jsp");
		return;
	}

	BoardDAO bddao = new BoardDAO();
	//���� ó��
	boolean result = bddao.insertBoard(bddto);
	if (result) {
%>
<script type="text/javascript">
	alert("����� �Ϸ�Ǿ����ϴ�.");
	window.close();
</script>
<%
	} else {
%>
<script type="text/javascript">
	alert("�Խñ� ��� �������� ���� �߻�...\n��� �� �ٽ� �õ�");
	history.back();
</script>
<%
	}
%>













