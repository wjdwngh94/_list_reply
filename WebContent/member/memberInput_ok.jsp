<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- memberInput_ok.jsp -->
<%@ page import="my.member.*" %>
<!-- �����Ͱ� 10������ 10���� �Ἥ �����ų�? �׷�����... -->
<!-- jsp �׼��±׸� Ȱ���Ͽ� �����͸� �ڵ����� ���� -->
<%	request.setCharacterEncoding("euc-kr"); %>

<!-- MemberDTO ���� -->
<jsp:useBean id="mbdto" class="my.member.MemberDTO"/>

<!-- request���� ���۵Ǵ� ��� �����͸� mbdto���� ���� -->
<jsp:setProperty name="mbdto" property="*"/>

<%		
		//������ ���� ����
		mbdto.setPower("normal");//�Ϲ�ȸ������ ����

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
			//�θ�â�� �ּҸ� login �������� ����
			window.opener.parent.location.href=
			"<%=request.getContextPath()%>/login/login.jsp";
			window.close();
		</script>
<%	}else{%>
		<script type="text/javascript">
			alert("���� ó�� �������� ���� �߻�...\n��� �� �ٽ� �õ�");
			history.back();
		</script>
<%	}%>
 
 
 
 
 
 
 
 
 
 
 
 
 
 