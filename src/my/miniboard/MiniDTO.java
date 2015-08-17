package my.miniboard;

//DTO : DATA TRANSFER OBJECT ���� ������ �����ϴ� Ŭ����
//������ ���̽��� �����ϴ� �׸���� ��ƾ� ������ DB�� �Ȱ��� ���·� �����.
//�Ϲ������� DAO�� DTO�� DB TABLE�� ���� ���� �����.
public class MiniDTO {
	private int no;
	private String writer;
	private String content;
	private String regdate;

	//������ �ڵ� �ϼ� : �⺻�����ڿ� ��� �Ű������� ���� ������
	//Source -> Generator Constructor using fields
	
	//Setter & Getter : ��� setter/getter �⺻������ ������ �ɷ�����.
	//Source -> Generator Getters and Setters
	
	public MiniDTO(int no, String writer, String content, String regdate) {
		super();
		this.no = no;
		this.writer = writer;
		this.content = content;
		this.regdate = regdate;
	}
	public MiniDTO() {
		super();
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
}
