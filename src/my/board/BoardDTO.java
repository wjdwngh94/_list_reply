package my.board;

import java.text.SimpleDateFormat;
import java.util.Date;

public class BoardDTO {
	//DB ���� ����
	private int no;
	private String writer;
	private String title;
	private String content;
	private String pw;
	private String regdate;
	private int readcount;
	private int recommand;
	public BoardDTO() {
		super();
	}
	public BoardDTO(int no, String writer, String title, String content,
			String pw, String regdate, int readcount, int recommand) {
		super();
		this.no = no;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.pw = pw;
		this.regdate = regdate;
		this.readcount = readcount;
		this.recommand = recommand;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getRecommand() {
		return recommand;
	}
	public void setRecommand(int recommand) {
		this.recommand = recommand;
	}
	//�����̸� �ð���, ������ �ۼ������� ��¥�� ��ȯ�ϴ� �޼ҵ�
	public String getTime(){
		//���� �ð��� ���
		Date date = new Date();
		SimpleDateFormat form = 
				new SimpleDateFormat("yyyy-MM-dd");
		String today = form.format(date);
		
		//����� regdate�� ��
		//2015-08-27 14:20:14.0
		String[] arr = regdate.split(" ");
		//arr[0] = "2015-08-27"
		//arr[1] = "14:20:14.0"
		if(today.equals(arr[0])){//������
			return arr[1].substring(0, 5);//�ð� ��ȯ
		}else{//�ٸ���
			return arr[0];//��¥ ��ȯ
		}
	}
}














