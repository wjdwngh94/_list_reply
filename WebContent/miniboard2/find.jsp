<%@page import="java.util.*"%>
<%@page import="my.miniboard.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- list.jsp : ��� ������ -->
<%
	//�˻��� �����ϱ�
	request.setCharacterEncoding("euc-kr");
	String name = request.getParameter("name");
	if (name == null || name.trim().equals("")) {
		response.sendRedirect("home.jsp");//�ѾƳ��ڴ�.
		return;
	}

	//DB ���� �� ������ �������� = MiniDAO���Ѽ� ó��
	MiniDAO dao = new MiniDAO();

	//name�� �ǳ��ְ� find�� �ްڴ�
	//�� �˻�� �ǳ��ְ� �˻����(ArrayList<�Խñ�-MiniDTO>)�� �޾ƾ��Ѵ�.

	ArrayList<MiniDTO> find = dao.find(name);
	//java.util.ArrayList<MiniDTO> find = dao.find(name);�� ����(import)

	//list�� �� �ִ� ������ ȭ�鿡 ���
%>

<%@ include file="/top.jsp"%>

<!-- / ó���� �ϸ� ������ ó�� �ȴ�. -->
<div align="center">

	<!-- ��� -->
	<%
		if (find == null || find.size() == 0) {
			//list�� ���°��� ����ִ� ���
	%>
	<h1>�Խñ��� �����ϴ�.</h1>
	<%
		} else {
	%>
	<table border="1" width="600">
		<tr>
			<th>��ȣ</th>
			<th>�ۼ���</th>
			<th width="40%">����</th>
			<th>�����</th>
		</tr>
		<!-- ���� : ArrayList<MiniDTO> list���� ���� ���� -->
		<%
			for (MiniDTO dto : find) //Ȯ�� for��
				/*for(int i=0; i<list.size(); ++i){
					MiniDTO dto = list.get(i);
					//���� ���
				}*/{
		%>
		<tr>
			<th><%=dto.getNo()%></th>
			<th><%=dto.getWriter()%></th>
			<th><%=dto.getContent()%></th>
			<th><%=dto.getRegdate()%></th>
		</tr>
		<%
			}
		%>
	</table>
	<%
		}
	%>
</div>
<h5 align="right">
	��<%=find.size()%>���� �����Ͱ� �ֽ��ϴ�.
	</h3>
	<%@ include file="/bottom.jsp"%>