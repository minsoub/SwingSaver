package com.swing.saver.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.swing.saver.web.domain.ParInfo;
import com.swing.saver.web.domain.ParInfoPK;

/**
 * ParInfo Repository interface 
 * table name : SCPARINFO mapping
 * 
 * @author JMS
 *
 */
@Repository
public interface ParInfoRepository extends JpaRepository <ParInfo, ParInfoPK>{

}
