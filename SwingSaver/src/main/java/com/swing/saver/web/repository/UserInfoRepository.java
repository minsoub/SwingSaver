package com.swing.saver.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.swing.saver.web.domain.UserInfo;

@Repository
public interface UserInfoRepository  extends JpaRepository <UserInfo, Integer>{
	// https://stackoverflow.com/questions/5031585/how-to-write-java-sql-blob-to-jpa-entity
	UserInfo findByEmail(String email);
	
	@Query(value="select a from UserInfo a, CredentialInfo b where a.id = b.userid and b.email=:email and b.password=ENCRYPT_PASSWORD(:password)")
	UserInfo findByUser(@Param("email") String email, @Param("password") String password);
	
	@Query(value="select a from UserInfo a where a.email=:email")
	UserInfo findBySnsUser(@Param("email") String email);
}
