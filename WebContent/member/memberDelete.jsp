<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- memberDelete.jsp : no ���۹޾Ƽ� �ش��ϴ� ȸ���� ���� -->
<!-- ConnectionPoolBean�� application ������ ���� -->
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" 
													scope="application"/>
<!-- mbdao��� ���� ���� -->													
<jsp:useBean id="mbdao" class="my.member.MemberDAO"/>
<!-- pool�� ������ mbdao���� ���� -->
<jsp:setProperty name="mbdao" property="pool"
												value="<%=pool%>"/>
<%
	String tmp = request.getParameter("no");
	int no = 0;
	try{
		no = Integer.parseInt(tmp);//NumberFormatException
		if(no<=0) throw new Exception();//���� ���� ó��
	}catch(Exception e){
		//���� �߻���(tmp�� ���ڷ� �ٲ� �� ���� ���)
		response.sendRedirect("memberList.jsp");
		return;
	}
	boolean result = mbdao.deleteMember(no);
	String msg="";
	if(result){
		msg="Ż��ó���� ���������� �Ϸ�Ǿ����ϴ�.";
	}else{
		msg="Ż��ó�� �� ������ �߻��Ͽ����ϴ�.";
	}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="memberList.jsp";
</script>













