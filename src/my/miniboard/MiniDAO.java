package my.miniboard;

import java.sql.*;
import java.util.ArrayList;

//DAO : DATA ACCESS OBJEC ������ ���� ��ü
//�ù� ��� ������ Ŭ����
//������ ������ ������ִ� ���

//DB����� ���õ� ��� ������ �̰����� �Ű� ����.

public class MiniDAO {
	// ��� ���� : DB����� ���õ� ��ü �Ǵ� �������� �����Ѵ�.
	private String driverClassName = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "jsp1";
	private String pass = "jsp1";

	private Connection con; // Connect�� �ҷ��� ���� ���� ���̹Ƿ� �ʱⰪ�� NULL�̴�.
	private PreparedStatement ps;
	private ResultSet rs;

	// ������ : �⺻������ �⺻ �����ڴ� ����� �ε��� �Ѵ�.
	public MiniDAO() {
	}

	// ��� �޼ҵ� : ���ֻ���ϴ� �͵�(����̹� �˻�, �α���, �ڿ� �ݳ�...)
	// ���� �޼ҵ� : ����̹� �˻� -> �α��� ���� ����
	public void connect() {
		// JSP������ _jspService�� �����Ǳ� ������ �׾ȿ�
		// try catch�� �ɸ��� �Ǿ� �ִ�.
		// ������ JAVA ������ ���������� ó���� ���� ���� ������
		// ���� ó���� ����� �Ѵ�.

		// SQLException : �Է� ������ �߸��Ǿ��� ��
		try {
			Class.forName(driverClassName); // ClassNotFountEx
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

	// insert���� ó��
	// int result = dao.insert(writer,content);
	// int insert(String, String)
	public int inset(String writer, String content) throws SQLException {
		// throw�� ��� ������ catch�� �ƴ� finally
		String sql = "insert into miniboard values(miniboard_seq.nextval,?,?,sysdate)";
		try {
			connect();
			ps = con.prepareStatement(sql);
			// ����ǥ�� 2���̴�.
			ps.setString(1, writer);
			ps.setString(2, content);

			// ������ ��� ��ȯ
			int result = ps.executeUpdate();
			return result;
		} finally { // ������ ����ϱ� ���Ͽ�
			close();
		}
	}

	// list���� ���ó��
	// ArrayList<MiniDTO> list = dao.list();
	// ArrayList<MiniDTO> list()
	public ArrayList<MiniDTO> list() throws SQLException {
		String sql = "select * from miniboard order by no desc";
		try {
			connect();
		} finally {
			close();
		}
	}
}
