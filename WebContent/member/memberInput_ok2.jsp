<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- memberInput_ok.jsp -->
<!-- 
	memberInput.jsp���� �Ѿ�� �����͸� ������(8��)
	
	=========MemberDAO�� �����ϴ� �۾�=========
	1.���̵� �ߺ� �˻� ����
	
	2.ȸ�� ���� ó��(������ ��� ������ normal�� ����)
	
	===================================
	
	ó�� ����� ����ڿ��� �˷��� ��
	1. ������ �Ǿ��ٸ� â �ݱ�
	2. ������ �����Ǿ��ٸ� ���� �Է� �������� �ǵ��ư���	
 -->
 <%@ page import="my.member.*" %>
<%
		//������ ����
		request.setCharacterEncoding("euc-kr");
		
		//MemberDTO ���� �Ŀ� �����Ͽ� ó��
		MemberDTO mbdto = new MemberDTO();
		mbdto.setName(request.getParameter("name"));
		mbdto.setId(request.getParameter("id"));
		mbdto.setPw(request.getParameter("pw"));
		mbdto.setBirth(request.getParameter("birth"));
		mbdto.setGender(request.getParameter("gender"));
		mbdto.setPost(request.getParameter("post"));
		mbdto.setAddr1(request.getParameter("addr1"));
		mbdto.setAddr2(request.getParameter("addr2"));
		mbdto.setPower("normal");
		
		//�ʿ��ϴٸ� ��ȿ�� �˻�
		if(mbdto.getId() == null || mbdto.getId().trim().equals("")){
			response.sendRedirect("memberInput.jsp");
			return;
		}
		
		MemberDAO mbdao = new MemberDAO();
		boolean check = mbdao.checkMember(mbdto.getId()); 
		//true : ����, false : ����
		if(!check){//check == false%>
		<script type="text/javascript">
		alert("�̹� ������� ���̵��Դϴ�.");
		//location.href="memberInput.jsp";
		history.back();//�ڷ� 1������ �̵�
		</script>
<%		return;		
		}
		
		//���� ó��
		boolean result = mbdao.insertMember(mbdto); 
		if(result){%>
		<script type="text/javascript">
			alert("������ ���������� �Ϸ�Ǿ����ϴ�\n�α����ϼ���");
			window.close();
		</script>
<%	}else{%>
		<script type="text/javascript">
			alert("���� ó�� �������� ���� �߻�...\n��� �� �ٽ� �õ�");
			history.back();
		</script>
<%	}%>
 
 
 
 
 
 
 
 
 
 
 
 
 
 