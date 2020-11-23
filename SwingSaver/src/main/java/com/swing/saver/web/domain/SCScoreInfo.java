package com.swing.saver.web.domain;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;

import org.hibernate.annotations.DynamicInsert;

import com.swing.saver.web.entity.ScoreVo;

import lombok.Builder;
import lombok.Data;

@Data
@Entity
@DynamicInsert			// Insert시 null 필드 제외  @DynamicUpdate => update시 null인 필드 제외
@IdClass(SCScoreInfoPK.class)
public class SCScoreInfo {

	@Id
	@Column(name = "visit_date")	
	private String visit_date;			// 방문일자 : yyyyMMdd
	
	@Id
	@Column(name = "countryclub_id")	
	private String countryclub_id;		// 골프장 ID
	
	@Id
	@Column(name = "seq_no")	
	private int    seq_no;              // 라운드 차수 (1, 2)
	
	@Id
	@Column(name = "user_id")	
	private int    user_id;             // 사용자 아이디
	
	private int    start_course;
	private int    end_course;
	
	private int    score1;
	private int    score2;
	private int    score3;
	private int    score4;
	private int    score5;
	private int    score6;
	private int    score7;
	private int    score8;
	private int    score9;
	private int    score10;
	private int    score11;
	private int    score12;
	private int    score13;
	private int    score14;
	private int    score15;
	private int    score16;
	private int    score17;
	private int    score18;
	private int    storke1;
	private int    storke2;
	private int    storke3;
	private int    storke4;
	private int    storke5;
	private int    storke6;
	private int    storke7;
	private int    storke8;
	private int    storke9;
	private int    storke10;
	private int    storke11;
	private int    storke12;
	private int    storke13;
	private int    storke14;
	private int    storke15;
	private int    storke16;
	private int    storke17;
	private int    storke18;
	private int    putter1;
	private int    putter2;
	private int    putter3;
	private int    putter4;
	private int    putter5;
	private int    putter6;
	private int    putter7;
	private int    putter8;
	private int    putter9;
	private int    putter10;
	private int    putter11;
	private int    putter12;
	private int    putter13;
	private int    putter14;
	private int    putter15;
	private int    putter16;
	private int    putter17;
	private int    putter18;

	private String description;
	private Timestamp dateinserted;	
	
	@Builder
	public SCScoreInfo(ScoreVo scoreVo)
	{
		this.visit_date = scoreVo.getVisit_date();
		this.countryclub_id = scoreVo.getContryclub_id();
		this.seq_no = scoreVo.getSeq_no();
		this.user_id = scoreVo.getUser_id();
		this.start_course = scoreVo.getStart_course();
		this.end_course = scoreVo.getEnd_course();
		this.score1 = scoreVo.getScore1();
		this.score2 = scoreVo.getScore2();
		this.score3 = scoreVo.getScore3();
		this.score4 = scoreVo.getScore4();
		this.score5 = scoreVo.getScore5();
		this.score6 = scoreVo.getScore6();
		this.score7 = scoreVo.getScore7();
		this.score8 = scoreVo.getScore8();
		this.score9 = scoreVo.getScore9();
		this.score10 = scoreVo.getScore10(); 
		this.score11 = scoreVo.getScore11();
		this.score12 = scoreVo.getScore12();
		this.score13 = scoreVo.getScore13();
		this.score14 = scoreVo.getScore14();
		this.score15 = scoreVo.getScore15();
		this.score16 = scoreVo.getScore16();
		this.score17 = scoreVo.getScore17();
		this.score18 = scoreVo.getScore18();
		
		this.storke1 = scoreVo.getStroke1();
		this.storke2 = scoreVo.getStroke2();
		this.storke3 = scoreVo.getStroke3();
		this.storke4 = scoreVo.getStroke4();
		this.storke5 = scoreVo.getStroke5();
		this.storke6 = scoreVo.getStroke6();
		this.storke7 = scoreVo.getStroke7();
		this.storke8 = scoreVo.getStroke8();
		this.storke9 = scoreVo.getStroke9();
		this.storke10 = scoreVo.getStroke10();
		this.storke11 = scoreVo.getStroke11();
		this.storke12 = scoreVo.getStroke12();
		this.storke13 = scoreVo.getStroke13();
		this.storke14 = scoreVo.getStroke14();
		this.storke15 = scoreVo.getStroke15();
		this.storke16 = scoreVo.getStroke16();
		this.storke17 = scoreVo.getStroke17();
		this.storke18 = scoreVo.getStroke18();
		
		this.putter1 = scoreVo.getPutter1();
		this.putter2 = scoreVo.getPutter2();
		this.putter3 = scoreVo.getPutter3();
		this.putter4 = scoreVo.getPutter4();
		this.putter5 = scoreVo.getPutter5();
		this.putter6 = scoreVo.getPutter6();
		this.putter7 = scoreVo.getPutter7();
		this.putter8 = scoreVo.getPutter8();
		this.putter9 = scoreVo.getPutter9();
		this.putter10 = scoreVo.getPutter10();
		this.putter11 = scoreVo.getPutter11();
		this.putter12 = scoreVo.getPutter12();
		this.putter13 = scoreVo.getPutter13();
		this.putter14 = scoreVo.getPutter14();
		this.putter15 = scoreVo.getPutter15();
		this.putter16 = scoreVo.getPutter16();
		this.putter17 = scoreVo.getPutter17();
		this.putter18 = scoreVo.getPutter18();
		this.description = scoreVo.getDescription();
		// this.dateinserted = 
	}
}
