package my.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardDAO {
	// ConnectionPoolBean ��� �̻��

	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;

	private String driverClassName = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "jsp1";
	private String pass = "jsp1";

	public BoardDAO() {
	}

	// ����޼ҵ� : �α��α���
	public void connect() {
		try {
			Class.forName(driverClassName);
			con = DriverManager.getConnection(url, user, pass);
		} catch (Exception e) {
			// System.out.println("���� ����");
			e.printStackTrace();// ����ó�� ���Ѱ�ó�� ���
		}
	}

	// �ڿ��ݳ��޼ҵ�
	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (con != null)
				con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// ������ �۾����� �޼ҵ� ������ ó��

	// ����� ������ re_step��꿡 ������ ����� �Ѵ�.
	// boolean result = bdao.insertReply(bdto);
	public boolean insertReply(BoardDTO bdto) throws SQLException {
		String sql = "select (select min(re_step) from board "
				+ "where ref=? and re_level=? and re_step>?) "
				+ "as min, (select max(re_step) from board "
				+ "where ref=? and re_level>? and re_step>?) "
				+ "as max from dual";
		try {
			connect();
			ps = con.prepareStatement(sql);
			ps.setInt(1, bdto.getRef());
			ps.setInt(2, bdto.getRe_level());
			ps.setInt(3, bdto.getRe_step());

			ps.setInt(4, bdto.getRef());
			ps.setInt(5, bdto.getRe_level());
			ps.setInt(6, bdto.getRe_step());

			rs = ps.executeQuery(); // rs���� min�̶�� �׸�, max��� �ΰ��� �׸��� �ִ�.
			rs.next();
			int row = 0; // ���� re_step�� ���� ���� ���� �ΰڴ�.
			if (rs.getInt("min") > 0) {
				// 1�� ������ ����� ������
				// ���� ��� 5��� ����� ��������
				row = rs.getInt("min");

				// re_step�� 5�� �ۺ��� ��� re_step 1�� ���� ���� ����
				sql = "update board set re_step = re_step +1 "
						+ "where ref=? and re_step>=?";
				ps = con.prepareStatement(sql);
				ps.setInt(1, bdto.getRef());
				ps.setInt(2, row);
				int result = ps.executeUpdate();
				// �� �� ������ �߰� �Ѵ�.
			} else {
				// 1�� ������ ����� ������
				// 2�� ������ ����� Ȯ���Ѵ�.
				if (rs.getInt("max") > 0) {
					// 2�� ������ ����� �ִٸ�

					// ����� +1 �� re_step��ġ�� ������ �߰�
					row = rs.getInt("max") + 1;
				} else {// 2�� ������ ����� ���ٸ�(��� ����)
					// ������ + 1
					row = bdto.getRe_step() + 1;
				}
			}
			// ������ �߰�
			sql = "insert into board values(board_seq.nextval,"
					+ "?,?,?,?,sysdate,0,0,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, bdto.getWriter());
			ps.setString(2, bdto.getTitle());
			ps.setString(3, bdto.getContent());
			ps.setString(4, bdto.getPw());
			ps.setInt(5, bdto.getRef());// ref
			ps.setInt(6, row);// re_step�� ���� ��(row)
			ps.setInt(7, bdto.getRe_level() + 1);// re_level

			int result = ps.executeUpdate();
			if (result > 0)
				return true;
			else
				return false;

		} finally {
			close();
		}
	}

	// boolean result = bdao.insertBoard(bdto);
	// ������ ������ ref�� �������� �Ѵ�.
	public boolean insertBoard(BoardDTO bdto) throws SQLException {
		String sql = "insert into board values(board_seq.nextval,"
				+ "?,?,?,?,sysdate,0,0,?,?,?)";
		try {
			int max = findNumber() + 1; // ����ū no�� ã�Ƽ� + 1
			connect();
			ps = con.prepareStatement(sql);
			ps.setString(1, bdto.getWriter());
			ps.setString(2, bdto.getTitle());
			ps.setString(3, bdto.getContent());
			ps.setString(4, bdto.getPw());
			ps.setInt(5, 1);// ref
			ps.setInt(6, 0);// re_step
			ps.setInt(7, 0);// re_level
			int result = ps.executeUpdate();
			if (result > 0)
				return true;
			else
				return false;
		} finally {
			close();
		}
	}

	// int no = bdao.findNumber();
	public int findNumber() throws SQLException {
		String sql = "select max(no) from board";
		try {
			connect();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();// �����Ͱ� �ݵ�� 1���� �ִ�
			rs.next();// ������ �����Ƿ� �̵��϶�!
			int max = rs.getInt(1);
			return max;
		} finally {
			close();
		}
	}

	public ArrayList<BoardDTO> searchBoard(String search, String searchString,
			int start, int end) throws SQLException {
		String sql = "select * from (select rownum rn, "
				+ "A.* from (select * from board where " + search
				+ " like ? order by ref desc, re_step asc)A) "
				+ "where rn between ? and ?";
		try {
			connect();
			ps = con.prepareStatement(sql);
			ps.setString(1, "%" + searchString + "%");
			ps.setInt(2, start);
			ps.setInt(3, end);
			rs = ps.executeQuery();
			// ArrayList<BoardDTO>�� ����
			ArrayList<BoardDTO> list = makeList(rs);
			return list;
		} finally {
			close();
		}
	}

	// list = bdao.searchBoard(search, searchString);//�˻�
	public ArrayList<BoardDTO> searchBoard(String search, String searchString)
			throws SQLException {
		String sql = "select * from board where " + search
				+ " like ? order by no desc";
		try {
			connect();
			ps = con.prepareStatement(sql);
			ps.setString(1, "%" + searchString + "%");
			rs = ps.executeQuery();
			// ArrayList<BoardDTO>�� ����
			ArrayList<BoardDTO> list = makeList(rs);
			return list;
		} finally {
			close();
		}
	}

	public ArrayList<BoardDTO> listBoard(int start, int end)
			throws SQLException {
		String sql = "select * from (select rownum rn, "
				+ "A.* from (select * from board order "
				+ "by ref desc, re_step asc)A) where rn between ? and ?";
		try {
			connect();
			ps = con.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			ArrayList<BoardDTO> list = makeList(rs);
			return list;
		} finally {
			close();
		}
	}

	// list = bdao.listBoard();//���
	public ArrayList<BoardDTO> listBoard() throws SQLException {
		String sql = "select * from board order by no desc";
		try {
			connect();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList<BoardDTO> list = makeList(rs);
			return list;
		} finally {
			close();
		}
	}

	// ArrayList<BoardDTO> list = makeList(rs);
	public ArrayList<BoardDTO> makeList(ResultSet rs) throws SQLException {
		// 1. ����� ����
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();

		// 2. rs���� ������ �̵�
		while (rs.next()) {
			// 2-1. ������ ����
			int no = rs.getInt("no");
			String writer = rs.getString("writer");
			String title = rs.getString("title");
			String content = rs.getString("content");
			String pw = rs.getString("pw");
			String regdate = rs.getString("regdate");
			int readcount = rs.getInt("readcount");
			int recommand = rs.getInt("recommand");
			// ��� ���� �׸� �߰��� ����
			int ref = rs.getInt("ref");
			int re_step = rs.getInt("re_step");
			int re_level = rs.getInt("re_level");

			// 2-2. ������ ����
			BoardDTO bdto = new BoardDTO(no, writer, title, content, pw,
					regdate, readcount, recommand, ref, re_step, re_level);

			// 2-3. ������ ���(list)
			list.add(bdto);
		}

		// 3. list ��ȯ
		return list;
	}

	// BoardDTO bdto = bdao.getBoard(no);
	public BoardDTO getBoard(int no) throws SQLException {
		String sql = "select * from board where no=?";
		try {
			connect();
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			rs = ps.executeQuery();// ������ 1�� �Ǵ� 0��
			ArrayList<BoardDTO> list = makeList(rs);
			// list�� �����Ͱ� �������� ������ �ȴ�
			if (list == null || list.size() == 0) {
				return null;
			}
			BoardDTO bdto = list.get(0);
			return bdto;
		} finally {
			close();
		}
	}

	// bdao.plusCount(no);
	public void plusCount(int no) throws SQLException {
		String sql = "update board " + "set readcount = readcount+1 "
				+ "where no=?";
		try {
			connect();
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			int result = ps.executeUpdate();
		} finally {
			close();
		}
	}

	// boolean result = bdao.checkPw(no, pw);
	public boolean checkPw(int no, String pw) throws SQLException {
		String sql = "select no from board where no=? and pw=?";
		// select pw from board where no=?
		// select no from board where no=? and pw=?
		try {
			connect();
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			ps.setString(2, pw);
			rs = ps.executeQuery();
			return rs.next();
		} finally {
			close();
		}
	}

	// boolean result = bdao.deleteBoard(no);
	public boolean deleteBoard(int no) throws SQLException {
		String sql = "delete board where no=?";
		try {
			connect();
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			int result = ps.executeUpdate();
			if (result > 0)
				return true;
			else
				return false;
		} finally {
			close();
		}
	}

	// boolean result = bdao.editBoard(bdto);
	public boolean editBoard(BoardDTO bdto) throws SQLException {
		String sql = "update board set title=?, content=? " + "where no=?";
		try {
			connect();
			ps = con.prepareStatement(sql);
			ps.setString(1, bdto.getTitle());
			ps.setString(2, bdto.getContent());
			ps.setInt(3, bdto.getNo());
			int result = ps.executeUpdate();
			if (result > 0)
				return true;
			else
				return false;
		} finally {
			close();
		}
	}

	// int count = bdao.getBoardCount();
	public int getBoardCount() throws SQLException {
		String sql = "select count(*) from board";
		try {
			connect();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();// ������ ������ 1��
			rs.next();
			int count = rs.getInt(1);
			return count;
		} finally {
			close();
		}
	}
}
