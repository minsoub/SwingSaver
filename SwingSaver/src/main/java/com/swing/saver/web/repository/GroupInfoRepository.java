package com.swing.saver.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.swing.saver.web.domain.GroupInfo;

@Repository
public interface GroupInfoRepository  extends JpaRepository <GroupInfo, String> {


}
