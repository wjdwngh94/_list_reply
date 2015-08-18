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

	// find���� �˻�ó��
	public ArrayList<MiniDTO> find(String writer1) throws SQLException {
		String sql = "select * from miniboard where writer like ? or content like ? order by no asc";// ������
		try {
			connect();
			ps = con.prepareStatement(sql);
			// ����ǥ ����
			ps.setString(1, "%"+writer1+"%");// ���� �˻�
			ps.setString(2, "%"+writer1+"%");// ���� �˻�
			rs = ps.executeQuery();
			//�����ʹ� ���� rs�� �ִ�
			//list�� find�� rs�� ����� ���Դ�.
			
			
			ArrayList<MiniDTO> find = new ArrayList<MiniDTO>();
			while (rs.next()) {
				int no = rs.getInt("no");
				String writer = rs.getString("writer");
				String content = rs.getString("content");
				String regdate = rs.getString("regdate");
				MiniDTO dto = new MiniDTO(no, writer, content, regdate);
				find.add(dto);
			}
			return find;
		} finally {
			close();
		}
	}

	
	// delete���� ����ó��
	// int result = dao.delete(writer);
	// int delete(String)
	public boolean delete(String writer) throws SQLException {
		String sql = "delete miniboard where writer=?";
		// "delete [table name] where [����];

		try {
			connect();
			// ��ɹ��� ����ְ�
			ps = con.prepareStatement(sql);

			// ��ɹ��� ? �� ������ ���ڸ��� writer�� ä�� �־��
			ps.setString(1, writer);
			int result = ps.executeUpdate();// Update�� int������ ��ȯ���� ������.
			if (result > 0)
				return true;
			else
				return false;
		} finally {
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
			ps = con.prepareStatement(sql);
			// ����ǥ ����
			rs = ps.executeQuery();// select�� ���� ���

			// ȸ���� ������ ������ ����� ���Ϸΰ����ٴ޶�� �߱⶧����
			// �μ⹰�� �ƴ� ���Ϸ� �����ؼ� ��������.

			// �����ʹ� ���� rs�� ������ ������ �������� ���°� ArrayList<MiniDTO> ������
			// ��ȯ�۾��� �ʿ��ϴ�(ResultSet-> ArrayList<MiniDTO>)

			// ���忡 ���Ǵ� Ŭ���� DTO
			// 1. �Ű��� ArrayList ����
			ArrayList<MiniDTO> list = new ArrayList<MiniDTO>();

			// 2.rs�� ������ ��ü�� list�� �̵�
			// rs�� ���� ȭ��ǥ�� �̵�
			while (rs.next()) {

				// 1.rs���� ������ ����(4��)
				// ������ �����Ϳ� �̸��� ���δ�.
				int no = rs.getInt("no");
				String writer = rs.getString("writer");
				String content = rs.getString("content");
				String regdate = rs.getString("regdate");

				// 2.�����ϰ�
				MiniDTO dto = new MiniDTO(no, writer, content, regdate);

				// 3.�߰��ϰ�
				list.add(dto);
			}

			return list;
			// �ϼ��� list��ȯ
		} finally {
			close();
		}
	}
}
