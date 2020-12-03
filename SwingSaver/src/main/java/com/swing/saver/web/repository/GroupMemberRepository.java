package com.swing.saver.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.swing.saver.web.domain.GroupMember;
import com.swing.saver.web.domain.GroupMemberPK;

@Repository
public interface GroupMemberRepository extends JpaRepository <GroupMember, GroupMemberPK> {

	/**
	 * 아카데미 그룹 멤버에서 관리자인지 확인
	 * 
	 * @param userid
	 * @return
	 */
	@Query("select a from GroupMember a where a.memberid=:userid and a.membertype='A' and a.groupid in (select b.id from GroupInfo b where b.del_yn != 'Y')")
	GroupMember findByAcademyGroupAuth(@Param("userid") Integer userid);
	
	/**
	 * 프로 그룹 멤버에서 관리자인지 확인
	 * 
	 * @param userid
	 * @return
	 */
	@Query("select a from GroupMember a where a.memberid=:userid and a.membertype='P' and a.groupid in (select b.id from GroupInfo b where b.del_yn != 'Y')")
	GroupMember findByProGroupAuth(@Param("userid") Integer userid);
}
