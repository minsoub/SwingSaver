package com.swing.saver.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.swing.saver.web.domain.AreaInfo;
import com.swing.saver.web.domain.AreaInfoPK;

/**
 * 지역정보 Repository Interface 
 * 
 * @author jms
 *
 */
public interface AreaInfoRepository  extends JpaRepository <AreaInfo, AreaInfoPK>{

}
