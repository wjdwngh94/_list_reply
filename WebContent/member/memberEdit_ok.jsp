<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%	request.setCharacterEncoding("euc-kr"); %>
<!-- MemberDTO ���� -->
<jsp:useBean id="mbdto" class="my.member.MemberDTO"/>
<!-- �Ķ���͸� mbdto�� ���� -->
<jsp:setProperty name="mbdto" property="*"/>

<jsp:useBean id="mbdao" class="my.member.MemberDAO"/>

<%
	boolean result = mbdao.editMember(mbdto);
	if(result){%>
		<script type="text/javascript">
		alert("ȸ�� ���� ���� ����");
		window.close();
		</script>
<%}else{%>
		<script type="text/javascript">
		alert("��й�ȣ�� ���� �ʽ��ϴ�.");
		history.go(-1);//history.back();
		</script>
<%}%>

















