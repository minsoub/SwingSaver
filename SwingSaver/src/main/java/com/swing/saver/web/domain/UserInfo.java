package com.swing.saver.web.domain;

import java.sql.Blob;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@DynamicInsert			// Insert시 null 필드 제외  @DynamicUpdate => update시 null인 필드 제외
@NoArgsConstructor
@Table(name="swuser")
@SequenceGenerator(
        name="USER_SEQ_GEN",        //시퀀스 제너레이터 이름
        sequenceName="SWUSER_SEQ",  //시퀀스 이름
        initialValue=1,             //시작값
        allocationSize=1            //메모리를 통해 할당할 범위 사이즈
        )
public class UserInfo {
	@Id
	@GeneratedValue(
            strategy=GenerationType.SEQUENCE,   //사용할 전략을 시퀀스로  선택
            generator="USER_SEQ_GEN"            //식별자 생성기를 설정해놓은  USER_SEQ_GEN으로 설정        
            )
	@Column(name="id", nullable=false)
	private Integer id;
	
	@Column(name="email", nullable=false, length=100)
	private String email;
	
	@Column(name="firstname", nullable=true, length=100)
	private String firstname;
	
	@Column(name="middlename", nullable=true, length=100)
	private String middlename;
	
	@Column(name="lastname", nullable=true, length=100)
	private String lastname;
	
	
	private Date dob;
	
	@Column(name="gender", nullable=true, length=1)
	private String gender;
	
	@Lob
	@Column(name = "photo")
	private Blob photo;
	
	@Column(name="phone", nullable=true, length=50)
	private String phone;
	
	@Column(name="groupmember", nullable=true, length=1)
	private String groupmember;
	
	private Integer availablepoints;    
	private Integer usedspace;
	private Date createdate;
	
	@Column(name="phototype", nullable=true, length=100)
	private String phototype;
	private Integer average;
	private Integer handicap;
	private Integer distance;
//	
//	@OneToOne
//	@JoinColumn(name = "userid")
//	CredentialInfo credential;
	
//	/**
//	 * return the photo Input stream
//	 * @return
//	 * @throws SQLException
//	 */
//	public InputStream getPhotoContent() throws SQLException {
//		if (getPhoto() == null) 
//			return null;
//		
//		return getPhoto().getBinaryStream();
//	}
//	
//	public void setPhotoContent(InputStream sourceStream) throws IOException {
//		
//		EntityManager em = emf.createEntityManager();
//		
//		Session session = (Session) entityManager.getDelegate();
//	    SessionFactory sessionFactory = session.getSessionFactory();
//	    
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		//Hibernate.getLobCreator(sessionfactory.getCurrentSession()).createBlob()
//		setPhoto(Hibernate.
//	}
}
