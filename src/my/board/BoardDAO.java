package my.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import my.db.ConnectionPoolBean;

public class BoardDAO {

	// PC�� ������ �˰� ������ �ȴ�.
	private ConnectionPoolBean pool;

	// ������ setter �޼ҵ�
	public void setPool(ConnectionPoolBean pool) {
		this.pool = pool;
	}

	private Connection con;

	private PreparedStatement ps;
	private ResultSet rs;

	// ������ : �⺻������ �⺻�����ڴ� ����� �ε��� �Ѵ�.
	public BoardDAO() {
	}

	// ��� �޼ҵ�

	// ���� �޼ҵ� : ����̹� �˻�->�α��� ���� ����
	public void connect() {
		try {
			con = pool.getConnection();
		} catch (Exception e) {
			System.out.println("DB ���� �������� ���� �߻�");
		}
	}

	// ���� �޼ҵ� : ����� �ڿ��� ��� ���ó��
	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (con != null)
				pool.returnConnection(con);// ���� �ݳ�
		} catch (SQLException e) {
			System.out.println("DB ���� ���� �������� ���� �߻�");
		}
	}

	
	public boolean insertBoard(BoardDTO bddto) throws SQLException {
		String sql = "insert into board values("
				+ "board_seq.nextval,?,?,?,?,sysdate,?,?)";
		try {
			connect();
			ps = con.prepareStatement(sql);
			// ����ǥ 9��
			ps.setString(1, bddto.getWriter());
			ps.setString(2, bddto.getTitle());
			ps.setString(3, bddto.getContent());
			ps.setString(4, bddto.getPw());
			ps.setInt(5, bddto.getReadcount());
			ps.setInt(6, bddto.getRecommand());

			int result = ps.executeUpdate();
			if (result > 0)
				return true;
			else
				return false;
		} finally {
			close();
		}
	}

	public ArrayList<BoardDTO> listBoard() throws SQLException {
		String sql = "select * from board order by no asc";
		try {
			connect();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			// rs - > ArrayList(��ȯ)
			ArrayList<BoardDTO> list = makeList(rs);
			return list;
		} finally {
			close();
		}
	}

	public ArrayList<BoardDTO> makeList(ResultSet rs) throws SQLException {
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();

		while (rs.next()) {
			// 1.������ ����
			int no = rs.getInt("no");
			String writer = rs.getString("writer");
			String title = rs.getString("title");
			String content = rs.getString("content");
			String pw = rs.getString("pw");
			String regdate = rs.getString("regdate");
			int readcount = rs.getInt("readcount");
			int recommand = rs.getInt("recommand");

			// 2.DTO����
			BoardDTO bddto = new BoardDTO(no, writer, title, content, pw, regdate, readcount, recommand);
			// 3.ArrayList���
			// int no = rs.getInt("no");
			list.add(bddto);
		}
		return list;
	}

	// MemberDTO info = mbdao.getMember(no);
	public BoardDTO getBoard(int no) throws SQLException {
		String sql = "";
		try {
			connect();
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			rs = ps.executeQuery();// ������ ����?? 0 �� �Ǵ� 1��

			ArrayList<BoardDTO> list = makeList(rs);
			if (list == null || list.size() == 0) // �����Ͱ� ������
				return null;
			else
				// �����Ͱ� ������? 0���� ������ ��ȯ
				return list.get(0);
			/*
			 * if(rs.next()){ ........ 10 �� ��� �ȴ�. }
			 */
		} finally {
			close();
		}
	}

	// boolean result = mbdao.editMember(mbdto);
	public boolean editBoard(BoardDTO bddto) throws SQLException {
	
		String sql = "update board set title=? content=? where no=? and pw=?";
		try {
			connect();
			ps = con.prepareStatement(sql);
			ps.setString(1, bddto.getTitle());
			ps.setString(2, bddto.getContent());
			ps.setInt(3, bddto.getNo());
			ps.setString(4, bddto.getPw());

			int result = ps.executeUpdate();
			if (result > 0)
				return true;
			else
				return false;
		} finally {
			close();
		}
	}

	// ���°� ��� - return 1,2,3��ſ� �������� ���Ͽ� ����Ѵ�.
	public static final int OK = 1;
	public static final int NOK = 2;
	public static final int ERROR = 3;

	public int login(int no, String pw) {
		String sql = "";
		try {
			connect();
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			ps.setString(2, pw);
			rs = ps.executeQuery();
			if (rs.next()) { // ���̵� ������
				return OK; // �α��� ����
			} else {
				return NOK; // ��������
			}

		} catch (SQLException e) {
			return ERROR; // ��������
		} finally {

			close();
		}
	}
}
