<%@page import="my.member.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	//������ ����
	request.setCharacterEncoding("euc-kr");

	//MemberDTO �����Ŀ� �����Ͽ� ó��
	MemberDAO dao = new MemberDAO();
	MemberDTO mbdto = new MemberDTO();

	mbdto.setName(request.getParameter("name"));
	mbdto.setId(request.getParameter("id"));
	mbdto.setGender(request.getParameter("gender"));
	mbdto.setBirth(request.getParameter("birth"));
	mbdto.setPw(request.getParameter("pw"));
	mbdto.setPost(request.getParameter("post"));
	mbdto.setAddr1(request.getParameter("addr1"));
	mbdto.setAddr2(request.getParameter("addr2"));
	mbdto.setPower("normal");

	if (mbdto.getId() == null || mbdto.getId().trim().equals("")) {
		response.sendRedirect("memberInput.jsp");
		return;
	}
	boolean check = dao.find(mbdto.getId());
	if (!check) {
%>

<script type="text/javascript">
	alert("�̹� ������� ���̵� �Դϴ�.");
	history.back(); //�ڷ� 1������ �̵� response.sendRedirect(); �� ����
</script>
<%
	return;
	} else {
		//����ó�� �Ѵ�.
		boolean result = mbdto.insertMember(mbdto);
		if (result) {
%>
<script type="text/javascript">
	alert("�Խñ� �Է� ����");
	window.close();
</script>
<%
	} else {
%>
<script type="text/javascript">
	alert("�Խñ� �Է� ����...");
	history.back();
</script>
<%
	}
	}
%>

