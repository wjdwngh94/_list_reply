<%@page import="my.member.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- login_ok.jsp - login �� ������ ó���ϴ� page -->
<!-- ���۵Ǿ��� ���̵�� ��й�ȣ�� ������ �α��� ó���� �����ϼ���
1. �α��� ���� - ���̵�� ��й�ȣ ��� ��ġ�� ��� : index.jsp�� �̵���Ų��.
2. �α��� ���� - ��������(���̵� �Ǵ� ��й�ȣ �� �ϳ��� ����) ���� ����(SQLException�߻�) : login.jsp�� �̵�
		ó���� MemberDAO�� �̿��Ѵ�.
		-->

<!-- MemberDTO ���� -->

<%
	request.setCharacterEncoding("euc-kr");

	//MemberDTO ���� �Ŀ� �����Ͽ� ó��
	MemberDTO mbdto = new MemberDTO();
	mbdto.setId(request.getParameter("id"));
	mbdto.setPw(request.getParameter("pw"));

	if (mbdto.getId() == null || mbdto.getId().trim().equals("")) {
		if (mbdto.getPw() == null || mbdto.getPw().trim().equals("")) {
			response.sendRedirect("login.jsp");
		}
	}

	MemberDAO mbdao = new MemberDAO();
	String word = mbdao.loginMember(mbdto.getId(), mbdto.getPw());
	//true : ����, false : ����
%>
<script type="text/javascript">
		alert("<%=word%>");
			</script>
<%
		//���� ó��
	boolean result = mbdao.insertMember(mbdto);
	if (result) {
%>
<script type="text/javascript">
			alert("������ ���������� �Ϸ�Ǿ����ϴ�\n�α����ϼ���");
			//�θ�â�� �ּҸ� login �������� ����
			window.opener.parent.location.href=
			"<%=request.getContextPath()%>
	/login/login.jsp";
	window.close();
</script>
<%
	} else {
%>
<script type="text/javascript">
	alert("���� ó�� �������� ���� �߻�...\n��� �� �ٽ� �õ�");
	history.back();
</script>
<%
	}
%>


