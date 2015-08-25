<%@page import="my.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- 
	login_ok.jsp : �α����� ������ ó���ϴ� ������
	
	���۵Ǿ��� ���̵�� ��й�ȣ�� �α��� ó���� �����ϼ���
	1. �α��� ���� : ���̵�� ��й�ȣ ��� ��ġ�ϴ� ���
		- �α��� ó�� �� index.jsp�� �̵�
	2. �α��� ���� : 
		- ���� ���� : ���̵� �Ǵ� ��й�ȣ �� �ϳ��� ������ ���
		- ���� ���� : SQLException�� �߻��� ���
		- login.jsp�� �̵�
	ó���� MemberDAO�� �̿��ϼ���
 -->
<jsp:useBean id="mbdao" class="my.member.MemberDAO" />
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String saveId = request.getParameter("saveId");//on | null
	if (id == null || id.trim().equals("") || pw == null
			|| pw.trim().equals("")) {
		response.sendRedirect("login.jsp");
		return;
	}

	//1 : ����, 2 : �������� , 3 : ��������
	int result = mbdao.login(id, pw);
	String msg = "", url = "";
	//if (result == 1)��ſ� �� Ȱ��� �������� ���� �Ʒ��� ���� ����Ѵ�(import�).
	if (result == MemberDAO.OK) {//�α��� ����, index.jsp�� �̵�
		msg = id + "�� ȯ���մϴ�.";
		//url = "../index.jsp";
		url = request.getContextPath() + "/index.jsp";

		//���� �α��� ��� ó�� ���� - session�� �߰��� ������
		session.setAttribute("login", "ok"); //�α��� ����
		session.setAttribute("userId", "id"); //�α��� ������ id
		//top.jsp�� ������� ����Ǳ� ������ �װ��� login������ ����� �д�.
		if (saveId != null) { //���̵� �����ϱⰡ üũ�Ǿ� ������
			Cookie ck = new Cookie("saveId", id); //id����
			ck.setMaxAge(1 * 24 * 60 * 60);
			response.addCookie(ck);
		}
	} else if (result == MemberDAO.NOK) {//���� ����, login.jsp�� �̵�
		msg = "�Է��Ͻ� ������ �߸��Ǿ����ϴ�.";
		url = "login.jsp";
	} else if (result == MemberDAO.ERROR) {//���� ����, login.jsp�� �̵�
		msg = "ó�� �������� ������ ������ϴ�.";
		url = "login.jsp";
	}
%>
<script type="text/javascript">
 	alert("<%=msg%>");
 	location.href="<%=url%>
	";
</script>















