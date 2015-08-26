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
 <%@ page import="my.member.*" %>
<!-- ConnectionPoolBean�� application ������ ���� -->
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" 
													scope="application"/>
<!-- mbdao��� ���� ���� -->													
<jsp:useBean id="mbdao" class="my.member.MemberDAO"/>
<!-- pool�� ������ mbdao���� ���� -->
<jsp:setProperty name="mbdao" property="pool"
												value="<%=pool%>"/>
 <%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String saveId = request.getParameter("saveId");//on | null
	if(id==null||id.trim().equals("")||
						pw==null||pw.trim().equals("")){
		response.sendRedirect("login.jsp");
		return;
	}
	
	//1 : ����, 2 : �������� , 3 : ��������
	int result = mbdao.login(id, pw); 
	String msg="", url="";
	if(result==MemberDAO.OK){//�α��� ����, index.jsp�� �̵�
		msg = id+"�� ȯ���մϴ�.";
		//url = "../index.jsp";
		url = request.getContextPath()+"/index.jsp";
		
		//���� �α��� ��� ó�� ����
		session.setAttribute("login", "ok");
		session.setAttribute("userId", id);
		
		Cookie ck = new Cookie("saveId", id);
		if(saveId!=null){//���̵� �����ϱⰡ üũ�Ǿ� ������
			ck.setMaxAge(1*24*60*60);
		}else{
			ck.setMaxAge(0);
		}
		response.addCookie(ck);
	}else if(result==MemberDAO.NOK){//���� ����, login.jsp�� �̵�
		msg = "�Է��Ͻ� ������ �߸��Ǿ����ϴ�.";
		url = "login.jsp";
	}else if(result==MemberDAO.ERROR){//���� ����, login.jsp�� �̵�
		msg = "ó�� �������� ������ ������ϴ�.";
		url = "login.jsp";
	}
 %>
 <script type="text/javascript">
 	alert("<%=msg%>");
 	location.href="<%=url%>";
 </script>
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 