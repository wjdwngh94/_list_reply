<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//������ Ȯ�� : ������.getAttribute("�̸�"); -> ��(Object)
	//Integer data1 = a;
	Integer data2 = (Integer)request.getAttribute("data");
	Integer data3 = (Integer)session.getAttribute("data");
	Integer data4 = (Integer)application.getAttribute("data");
%>
<h1>page ������ Ȯ�� �Ұ�</h1>
<h1>request : <%=data2%></h1>
<h1>session : <%=data3%></h1>
<h1>application : <%=data4%></h1>
<a href="scope3.jsp">���� ������</a><br>