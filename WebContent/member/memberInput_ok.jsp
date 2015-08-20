<%@page import="my.member.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- �����Ͱ� 10������ 10���� �Ἥ ���� ����?? -->
<!-- jsp �׼� �ױ׸� Ȱ���Ͽ� �����͸� �ڵ����� ���� -->
<!-- jsp�׼� �ױ� : jsp�� �̸����� �����ϴ� �±� -->
<!-- 
	1.jsp : useBean - ��ü ���� �ױ��̴�.
		(��� ��) 
		<jsp : useBean id="��ü��" class="Ŭ���� ���" scope="��������"/>
		id : ����� ��ü�� �̸��� ��������� ����
		class : ��ü ������ Ŭ���� ��θ� �� ���´�.(�������� ����) - import���ʿ�
		scope : ��ü�� ������ ����(����)
		
		(���� ����) ��ü ������ �ش� Ŭ������ �⺻ �����ڸ� ȣ���Ͽ� ��ü�� �����Ѵ�.
		�⺻�����ڰ� ���� Ŭ������ useBean �� ����� �� ����.
		(����) scope ��������, setProperty �̿� ����
		
	2. jsp : setProperty - ������ ���� �±� �̴�.
		(��� ��)
		<jsp : setProperty name = "��ü��" property="�׸�" value="��"/>
		name : �̹� ������� ��ü�� �̸� 
		property : ������ �׸� �̸�, �� ������� �Ÿ� *
		value : ������ ������ / ���������� request���� ã�� �����ϳ�.
		
		(����)
		-�ƹ��� ���Ƶ� �׸� ������ �� �˾Ƽ� ����ִ´�.
		-int������ ��� int�� �ڵ� ��ȯ�� �ش�.
		
		(���� ����) ���� name="mbdto" property="id"��� �ݵ�� mbdto�ȿ� setId()�� �����ؾ� �Ѵ�.
				-�׷��� getter setter�� �ڵ����� ����� �ִ°��� ����.
				
	3. jsp : getProperty - ������ Ȯ�� �±� �̴�.
	-->

<%
	MemberDAO dao = new MemberDAO();
%>
<!-- MemberDTO create -->
<jsp:useBean id="mbdto" class="my.member.MemberDTO" />

<!-- request���� ���۵Ǵ� ��� �����͸� mbdto���� �����Ѵ�. -->

<jsp:setProperty name="mbdto" property="*" />

<%
	//������ ����
	request.setCharacterEncoding("euc-kr");

	//MemberDTO �����Ŀ� �����Ͽ� ó��
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
	alert("���� ����");
	//�θ�â�� �ּҸ� login �������� ����
	window.opener.parent.location.href="<%=request.getContextPath()%>
	/ login / login.jsp";
	//�θ�â(���� ���� ��)�� �ּҸ� ����
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

