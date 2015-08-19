package my.member;

import java.sql.*;
import java.util.*;


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
