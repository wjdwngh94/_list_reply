<%@page import="my.board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!-- ConnectionPoolBean�� application ������ ���� -->
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean"
	scope="application" />

<jsp:useBean id="bddao" class="my.board.BoardDAO" />

<jsp:setProperty name="bddao" property="pool" value="<%=pool%>" />

<%@ include file="../top.jsp"%>

<script type="text/javascript">
			function openWrite(){
				//��â�� �����ִ� �ڵ�
				//window.open("�ּ�","�̸�","���°�");
				window.open("<%=request.getContextPath()%>/board/write.jsp", "",
				"width=600, height=700");
	}
</script>

<div align="center">

	<a href="javascript:openWrite();">�۾���</a>
	
	<table class="outline" width="600">
		<!-- ���� -->

		<tr>
			<th class="m2">��ȣ</th>
			<th class="m2">����</th>
			<th class="m2">�ۼ���</th>
			<th class="m2">�ۼ���</th>
			<th class="m2">��ȸ��</th>
			<th class="m2">��õ��</th>
		</tr>
		<!-- ������ -->

		<%
			ArrayList<BoardDTO> list = bddao.listBoard();
			for (BoardDTO bddto : list) {
		%>
		<tr>
			<th class="m3"><%=bddto.getNo()%></th>
			<th class="m3"><%=bddto.getTitle()%></th>
			<th class="m3"><%=bddto.getWriter()%></th>
			<th class="m3"><%=bddto.getRegdate()%></th>
			<th class="m3"><%=bddto.getReadcount()%></th>
			<th class="m3"><%=bddto.getRecommand()%></th>
		</tr>
		<%
			}
		%>
	</table>
	<br>
</div>
<%@ include file="../bottom.jsp"%>


