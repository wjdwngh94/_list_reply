<%@page import="java.util.ArrayList"%>
<%@page import="my.miniboard.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- list.jsp : ��� ������ -->
<%
	//DAO ���� �� DB ����� �����δ� ��������� �����Ѵ�.
	MiniDAO dao = new MiniDAO();
	//resultSet�� �����ϸ� �����Ͱ� ����� �˼��� ����.
	ArrayList<MiniDTO> list = dao.list(); //�Խñ��� ����ִ� ArrayList

	//list�� �� �ִ� ������ ȭ�鿡 ���
%>