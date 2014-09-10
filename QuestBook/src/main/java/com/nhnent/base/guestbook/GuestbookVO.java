package com.nhnent.base.guestbook;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;


public class GuestbookVO {
    private Integer id;
	@NotNull
	@Size(min=1, max=10000, message="내용을 입력하세요.")
    private String content;
	@NotNull
	@Size(min=1, max=30, message="이름은 1~30자 이내로 작성하세요.")
    private String name;
	@NotNull
	@Size(min=1, max=30, message="비밀번호는 1~30자 이내로 작성하세요.")
    private String pwd;
	@NotNull
	@Size(min=1, max=50, message="이메일은 1~50자 이내로 작성하세요.")
    @Pattern(regexp="^[_0-9a-zA-Z-]+@[0-9a-zA-Z]+(.[_0-9a-zA-Z-]+)*$", message="이메일주소가 유효하지 않습니다.")
    private String mail;
    private String cdate;
    private String edate;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	public String getEdate() {
		return edate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		GuestbookVO other = (GuestbookVO) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "GuestbookVO [id=" + id + ", content=" + content + ", name="
				+ name + ", pwd=" + pwd + ", mail=" + mail + ", cdate=" + cdate
				+ ", edate=" + edate + "]";
	}
}
