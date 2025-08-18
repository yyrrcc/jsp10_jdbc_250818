package jsp10_jdbc_250818.dto;

// DTO (Data Transfer Object) : 데이터를 전달하기 위한 객체. 순수한 데이터 객체 (getter & setter 만 가진 클래스)
public class MemberDto {
	private String memberid;
	private String memberpw;
	private String membername;
	private int memberage;
	private String memberemail;
	private String memberdate;
	
	public MemberDto() {
		super();
	}

	public MemberDto(String memberid, String memberpw, String membername, int memberage, String memberemail,
			String memberdate) {
		super();
		this.memberid = memberid;
		this.memberpw = memberpw;
		this.membername = membername;
		this.memberage = memberage;
		this.memberemail = memberemail;
		this.memberdate = memberdate;
	}

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getMemberpw() {
		return memberpw;
	}

	public void setMemberpw(String memberpw) {
		this.memberpw = memberpw;
	}

	public String getMembername() {
		return membername;
	}

	public void setMembername(String membername) {
		this.membername = membername;
	}

	public int getMemberage() {
		return memberage;
	}

	public void setMemberage(int memberage) {
		this.memberage = memberage;
	}

	public String getMemberemail() {
		return memberemail;
	}

	public void setMemberemail(String memberemail) {
		this.memberemail = memberemail;
	}

	public String getMemberdate() {
		return memberdate;
	}

	public void setMemberdate(String memberdate) {
		this.memberdate = memberdate;
	}
	
	

	
	
}
