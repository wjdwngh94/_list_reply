<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- CookieȮ�� ��Ű�� �к��ؼ� �������°��̾ƴ϶� ��θ� ������ �� ���� �����Ѵ�.-->
<!-- ��ŰȮ�� -->
<%
	//	PC���� ���� �� �ִ� ��� ������ ��Ű�� �����´�.
	//	C# ��, �ٸ� ����� ��Ű�� ���� �� ����.
	// request.getCookies(); - ��� ��Ű�� �����´�. ��ȯ���´� Cookie�迭 Ȥ�� Collection�̴�.
	Cookie[] ckList = request.getCookies();
%>
<h1>��Ű�� ���� : <%=ckList.length %></h1> <!-- ��Ű�迭�� ���� : ��Ű�� ���� -->
<%
//for(int i=0; i<ckList.length;++i){
	for(Cookie ck : ckList){ //Ȯ�� for������ ���� ����� ����
	%>
	<h2>��Ű�� : <%=ck.getName() %>,
	��Ű��: <%=ck.getValue() %></h2>
	<%}
%>