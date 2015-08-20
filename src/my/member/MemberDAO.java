package my.member;

import java.sql.*;
import java.util.*;

import my.member.MemberDTO;

public class MemberDAO {
	// ��� ���� : DB����� ���õ� ��ü �Ǵ� �������� �����Ѵ�.
	private String driverClassName = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "jsp1";
	private String pass = "jsp1";

	private Connection con; // Connect�� �ҷ��� ���� ���� ���̹Ƿ� �ʱⰪ�� NULL�̴�.
	private PreparedStatement ps;
	private ResultSet rs;

	public MemberDAO() {
	}

	public boolean insertMember(MemberDTO mbdto) throws SQLException {
		// throw�� ��� ������ catch�� �ƴ� finally
		String sql = "insert into member values(member_seq.nextval,?,?,?,?,sysdate,?,?,?,?,?)";
		try {
			connect();
			// setter getter�� ����� �а��� Ȱ���Ѵ�. !!

			ps = con.prepareStatement(sql);
			ps.setString(1, mbdto.getId());
			ps.setString(2, mbdto.getPw());
			ps.setString(3, mbdto.getName());
			ps.setString(4, mbdto.getBirth());
			ps.setString(5, mbdto.getGender());
			ps.setString(6, mbdto.getPost());
			ps.setString(7, mbdto.getAddr1());
			ps.setString(8, mbdto.getAddr2());
			ps.setString(8, mbdto.getPower());

			// ������ ��� ��ȯ
			int result = ps.executeUpdate();
			if (result > 0)
				return true;
			else
				return false;
		} finally { // ������ ����ϱ� ���Ͽ�
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

	public void connect() {
		try {
			Class.forName(driverClassName); // ojdbc6.jar�� ã�� ��
			// ClassNotFountEx
			con = DriverManager.getConnection(url, user, pass); // SQLEx
		} catch (Exception e) {
			System.out.println("���� �߻�!!");
		}
	}

	// ���� �޼ҵ� : ����� �ڿ��� ��� ��� ó��
	public void close() {
		// ����� ���Ѱ� NULL
		try {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (con != null)
				con.close();
		} catch (SQLException e) {
			System.out.println("DB���� �������� ���� �߻�");
		}
	}
}
