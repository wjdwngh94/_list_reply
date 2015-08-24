package my.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDAO {
	// ��� ���� : DB����� ���õ� ��ü �Ǵ� �������� ����
	private String driverClassName = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "jsp1";
	private String pass = "jsp1";

	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;

	// ������ : �⺻������ �⺻�����ڴ� ����� �ε��� �Ѵ�.
	public MemberDAO() {
	}

	// ��� �޼ҵ�

	// ���� �޼ҵ� : ����̹� �˻�->�α��� ���� ����
	public void connect() {
		try {
			Class.forName(driverClassName);// ClassNotFoundEx
			con = DriverManager.getConnection(url, user, pass);
			// SQLEx
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
				con.close();
		} catch (SQLException e) {
			System.out.println("DB ���� ���� �������� ���� �߻�");
		}
	}

	public boolean deleteMember(int no) throws SQLException {
		String sql = "delete member where no=?";

		try {
			connect();
			// ��ɹ��� ����ְ�
			ps = con.prepareStatement(sql);
			// ��ɹ��� ? �� ������ ���ڸ��� writer�� ä�� �־��
			ps.setInt(1, no);
			int result = ps.executeUpdate();// Update�� int������ ��ȯ���� ������.
			if (result > 0)
				return true;
			else
				return false;
		} finally {
			close();
		}
	}

	// boolean check = mbdao.checkMember(id);
	// boolean checkMember(String)
	public boolean checkMember(String id) throws SQLException {
		String sql = "select no from member where id = ?";
		try {
			connect();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {// ������ �ִ� ��� : ����
				return false;
			} else {// �����Ͱ� ���� ��� : ����
				return true;
			}
		} finally {
			close();
		}
	}

	public String loginMember(String id, String pw) throws SQLException {
		String sql = "select no from member where id = ?";
		try {
			connect();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (!rs.next()) {// ������ ���� ��� : �ȵ�
				return "�ش� id�� ���� id�Դϴ�.";
			} else {
				sql = "select no from member where id = ? and pw =?";
				ps = con.prepareStatement(sql);
				ps.setString(1, id);
				rs = ps.executeQuery();
				if (!rs.next()) {// ���� ��� : �ȵ�
					return "�ش� id�� �����ʴ� pw�Դϴ�.";
				} else {
					return "�α��ο� �����ϼ̽��ϴ�.";
				}
			}
		} finally {
			close();
		}
	}

	public boolean find(String id) throws SQLException {
		String sql = "select * from member where id = ?";// ������
		try {
			connect();
			ps = con.prepareStatement(sql);
			// ����ǥ ����
			ps.setString(1, id);
			rs = ps.executeQuery();

			if (rs.next()) {
				// �����Ͱ� �ִ� ��� : ����
				return false;
			} else {
				// �����Ͱ� ���� ��� : ����
				return true;
			}
		} finally {
			close();
		}
	}

	// boolean result = mbdao.insertMember(mbdto);
	// boolean insertMember(MemberDTO)
	public boolean insertMember(MemberDTO mbdto) throws SQLException {
		String sql = "insert into member values("
				+ "member_seq.nextval,?,?,?,?,sysdate,?,?,?,?,?)";
		try {
			connect();
			ps = con.prepareStatement(sql);
			// ����ǥ 9��
			ps.setString(1, mbdto.getId());
			ps.setString(2, mbdto.getPw());
			ps.setString(3, mbdto.getName());
			ps.setString(4, mbdto.getBirth());
			ps.setString(5, mbdto.getGender());
			ps.setString(6, mbdto.getPost());
			ps.setString(7, mbdto.getAddr1());
			ps.setString(8, mbdto.getAddr2());
			ps.setString(9, mbdto.getPower());

			int result = ps.executeUpdate();
			if (result > 0)
				return true;
			else
				return false;
		} finally {
			close();
		}
	}

	// list = mbdao.findMember(search, searchString);
	// ArrayList<MemberDTO> findMember(String,String)
	public ArrayList<MemberDTO> findMember(String search, String searchString)
			throws SQLException {

		String sql = "select * from member where" + search + " = ?";
		try {
			connect();
			ps = con.prepareStatement(sql);
			// ����ǥ �ΰ�
			ps.setString(1, search);
			ps.setString(2, searchString);
			rs = ps.executeQuery();
			ArrayList<MemberDTO> list = makeList(rs);
			return list;
		} finally {
			close();
		}
	}

	public ArrayList<MemberDTO> listMember() throws SQLException {
		String sql = "select * from member order by no asc";
		try {
			connect();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			// rs - > ArrayList(��ȯ)
			ArrayList<MemberDTO> list = makeList(rs);
			return list;
		} finally {
			close();
		}
	}

	// ArrayList<MemberDTO> list = makeList(rs);
	// ArrayList<MemberDTO> makeList(ResultSet);
	public ArrayList<MemberDTO> makeList(ResultSet rs) throws SQLException {
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();

		while (rs.next()) {
			// 1.������ ����
			int no = rs.getInt("no");
			String id = rs.getString("id");
			String pw = rs.getString("pw");
			String name = rs.getString("name");
			String birth = rs.getString("birth");
			String joindate = rs.getString("joindate");
			String gender = rs.getString("gender");
			String post = rs.getString("post");
			String addr1 = rs.getString("addr1");
			String addr2 = rs.getString("addr2");
			String power = rs.getString("power");

			// 2.DTO����
			MemberDTO mbdto = new MemberDTO(no, id, pw, name, birth, joindate,
					gender, post, addr1, addr2, power);
			// 3.ArrayList���
			// int no = rs.getInt("no");
			list.add(mbdto);
		}
		return list;
	}

	// MemberDTO info = mbdao.getMember(no);
	public MemberDTO getMember(int no) throws SQLException {
		String sql = "";
		try {
			connect();
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			rs = ps.executeQuery();// ������ ����?? 0 �� �Ǵ� 1��

			ArrayList<MemberDTO> list = makeList(rs);
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
	public boolean editMember(MemberDTO mbdto) throws SQLException {
		// 1.��й�ȣ �˻� - ����
		// [1]query2���� �˻� select pw from member where no=? �� ��й�ȣ equals �˻�
		// [2]query1���� �˻� select �ƹ��ų� from member where no=? and pw=? �Ŀ� ������ �ֳ�
		// ���� �˻�
		// 2.���� ó��
		// [1]
		// [2]update member set post=?, addr1=?, addr2=? where no=? and pw=?

		// ������ 2���� �ѹ��� ó���ϴ� ����� ����κ��� Ʋ�ȴ��� ����ڿ��� �˷��� �� ����.

		String sql = "update member set post=?, addr1=?, addr2=? where no=? and pw=?";
		try {
			connect();
			ps = con.prepareStatement(sql);
			ps.setString(1, mbdto.getPost());
			ps.setString(2, mbdto.getAddr1());
			ps.setString(3, mbdto.getAddr2());
			ps.setInt(4, mbdto.getNo());
			ps.setString(5, mbdto.getPw());

			int result = ps.executeUpdate();
			if (result > 0)
				return true;
			else
				return false;
		} finally {
			close();
		}
	}
}
