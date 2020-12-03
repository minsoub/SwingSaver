package com.swing.saver.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.swing.saver.web.domain.CredentialInfo;

@Repository
public interface CredentialInfoRepository  extends JpaRepository <CredentialInfo, Integer> {

}
