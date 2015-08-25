package my.db;

import java.sql.*;
import java.util.*;

public class ConnectionPoolBean {
	private String url, user, pass;
	private Hashtable<Connection, Boolean> ht;// pool�� �����
	private int increment;// pool�忡 con��ü�� �� �Է�������Ҷ� �� ũ��

	public ConnectionPoolBean() throws ClassNotFoundException, SQLException {
		increment = 3;// pool�忡 con��ü�� �� �ʿ��ϸ� 3�� ���� ��Ű�� ����
		ht = new Hashtable<Connection, Boolean>(5);// pool�忡 5���� ��ü�� �ֱ� ����
		url = "jdbc:oracle:thin:@localhost:1521:xe";
		user = "web";
		pass = "web";
		Class.forName("oracle.jdbc.driver.OracleDriver");

		// Connection 5�� ����
		for (int i = 0; i < 5; ++i) {
			Connection con = DriverManager.getConnection(url, user, pass);
			ht.put(con, Boolean.FALSE);// ��� con��ü�� ����
		}
	}

	public synchronized Connection getConnection() throws SQLException {
		// getConnection�� �մ��� ���� �� connection�� �뿩���ִ� method�̴�.
		Enumeration<Connection> enkey = ht.keys();
		Connection con = null;
		while (enkey.hasMoreElements()) { // �� ������
			con = enkey.nextElement();
			Boolean b = ht.get(con);
			if (b == Boolean.FALSE) { // ����ִ� ��ǻ�͸� ������
				ht.put(con, Boolean.TRUE);// true�� ����
				return con;
			}
		}
		for (int i = 0; i < increment; ++i) { // ���ڸ��� ���� ��쿡�� increment��ŭ �߰��Ѵ�.
			Connection con2 = DriverManager.getConnection(url, user, pass);
			ht.put(con2, Boolean.FALSE);
		}
		return getConnection();
		// �߰� increment��ŭ ������ �� ���ȣ��
	}

	// �մ��� ������ �����ϸ� Connection�� ȸ���Ͽ� �����ϴ� �޼ҵ��̴�.
	public void returnConnection(Connection returnCon) throws SQLException {
		Connection con = null;
		Enumeration<Connection> enkey = ht.keys();
		while (enkey.hasMoreElements()) {
			con = enkey.nextElement();
			if (returnCon == con) {
				ht.put(con, Boolean.FALSE);
				break;
			}
		}
		removeCon();
	}

	public void removeCon() throws SQLException {
		int count = 0;// ��� ��ü ���� ī��Ʈ ����
		Connection con = null;
		Enumeration<Connection> enkey = ht.keys();
		while (enkey.hasMoreElements()) {
			con = enkey.nextElement();
			Boolean b = ht.get(con);
			if (b == Boolean.FALSE) {
				count++;
				if (count > 5) {
					ht.remove(con);
					con.close();
				}
			}
		}
	}

	//������
	public void closeAll() throws SQLException {
		Connection con = null;
		Enumeration<Connection> enkey = ht.keys();
		while (enkey.hasMoreElements()) {
			con = enkey.nextElement();
			con.close();
		}
	}
}
