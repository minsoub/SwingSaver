package com.swing.saver.web.domain;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;

import org.hibernate.annotations.DynamicInsert;

import com.google.common.base.Strings;
import com.swing.saver.web.entity.ScoreRequest;

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
	private Integer     seq_no;              // 라운드 차수 (1, 2)
	
	@Id
	@Column(name = "user_id")	
	private Integer     user_id;             // 사용자 아이디
	
	private Integer     start_course;
	private Integer     end_course;
	
	private Integer     score1;
	private Integer     score2;
	private Integer     score3;
	private Integer     score4;
	private Integer     score5;
	private Integer     score6;
	private Integer     score7;
	private Integer     score8;
	private Integer     score9;
	private Integer     score10;
	private Integer     score11;
	private Integer     score12;
	private Integer     score13;
	private Integer     score14;
	private Integer     score15;
	private Integer     score16;
	private Integer     score17;
	private Integer     score18;
	private Integer     stroke1;
	private Integer     stroke2;
	private Integer     stroke3;
	private Integer     stroke4;
	private Integer     stroke5;
	private Integer     stroke6;
	private Integer     stroke7;
	private Integer     stroke8;
	private Integer     stroke9;
	private Integer     stroke10;
	private Integer     stroke11;
	private Integer     stroke12;
	private Integer     stroke13;
	private Integer     stroke14;
	private Integer     stroke15;
	private Integer     stroke16;
	private Integer     stroke17;
	private Integer     stroke18;
	private Integer     putter1;
	private Integer     putter2;
	private Integer     putter3;
	private Integer     putter4;
	private Integer     putter5;
	private Integer     putter6;
	private Integer     putter7;
	private Integer     putter8;
	private Integer     putter9;
	private Integer     putter10;
	private Integer     putter11;
	private Integer     putter12;
	private Integer     putter13;
	private Integer     putter14;
	private Integer     putter15;
	private Integer     putter16;
	private Integer     putter17;
	private Integer     putter18;

	private String description;
	private Timestamp dateinserted;	
	
	@Builder
	public SCScoreInfo(ScoreRequest scoreVo)
	{
		this.visit_date = scoreVo.getVisit_date();
		this.countryclub_id = scoreVo.getCountryclub_id();
		this.seq_no = scoreVo.getSeq_no() == null ? null : Integer.parseInt(scoreVo.getSeq_no());
		this.user_id = scoreVo.getUser_id() == null ? null : Integer.parseInt(scoreVo.getUser_id());
		this.start_course = Strings.isNullOrEmpty(scoreVo.getStart_course()) == true ? null : Integer.parseInt(scoreVo.getStart_course());
		this.end_course = Strings.isNullOrEmpty(scoreVo.getEnd_course()) == true ? null : Integer.parseInt(scoreVo.getEnd_course());
		this.score1 = Strings.isNullOrEmpty(scoreVo.getScore1()) == true ? null : Integer.parseInt(scoreVo.getScore1());
		this.score2 = Strings.isNullOrEmpty(scoreVo.getScore2()) == true ? null : Integer.parseInt(scoreVo.getScore2());
		this.score3 = Strings.isNullOrEmpty(scoreVo.getScore3()) == true ? null : Integer.parseInt(scoreVo.getScore3());
		this.score4 = Strings.isNullOrEmpty(scoreVo.getScore4()) == true ? null : Integer.parseInt(scoreVo.getScore4());
		this.score5 = Strings.isNullOrEmpty(scoreVo.getScore5()) == true ? null : Integer.parseInt(scoreVo.getScore5());
		this.score6 = Strings.isNullOrEmpty(scoreVo.getScore6()) == true ? null : Integer.parseInt(scoreVo.getScore6());
		this.score7 = Strings.isNullOrEmpty(scoreVo.getScore7()) == true ? null : Integer.parseInt(scoreVo.getScore7());
		this.score8 = Strings.isNullOrEmpty(scoreVo.getScore8()) == true ? null : Integer.parseInt(scoreVo.getScore8());
		this.score9 = Strings.isNullOrEmpty(scoreVo.getScore9()) == true ? null : Integer.parseInt(scoreVo.getScore9());
		this.score10 = Strings.isNullOrEmpty(scoreVo.getScore10()) == true ? null : Integer.parseInt(scoreVo.getScore10()); 
		this.score11 = Strings.isNullOrEmpty(scoreVo.getScore11()) == true ? null : Integer.parseInt(scoreVo.getScore11());
		this.score12 = Strings.isNullOrEmpty(scoreVo.getScore12()) == true ? null : Integer.parseInt(scoreVo.getScore12());
		this.score13 = Strings.isNullOrEmpty(scoreVo.getScore13()) == true ? null : Integer.parseInt(scoreVo.getScore13());
		this.score14 = Strings.isNullOrEmpty(scoreVo.getScore14()) == true ? null : Integer.parseInt(scoreVo.getScore14());
		this.score15 = Strings.isNullOrEmpty(scoreVo.getScore15()) == true ? null : Integer.parseInt(scoreVo.getScore15());
		this.score16 = Strings.isNullOrEmpty(scoreVo.getScore16()) == true ? null : Integer.parseInt(scoreVo.getScore16());
		this.score17 = Strings.isNullOrEmpty(scoreVo.getScore17()) == true ? null : Integer.parseInt(scoreVo.getScore17());
		this.score18 = Strings.isNullOrEmpty(scoreVo.getScore18()) == true ? null : Integer.parseInt(scoreVo.getScore18());
		
		this.stroke1 = Strings.isNullOrEmpty(scoreVo.getStroke1()) == true ? null : Integer.parseInt(scoreVo.getStroke1());
		this.stroke2 = Strings.isNullOrEmpty(scoreVo.getStroke2()) == true ? null : Integer.parseInt(scoreVo.getStroke2());
		this.stroke3 = Strings.isNullOrEmpty(scoreVo.getStroke3()) == true ? null : Integer.parseInt(scoreVo.getStroke3());
		this.stroke4 = Strings.isNullOrEmpty(scoreVo.getStroke4()) == true ? null : Integer.parseInt(scoreVo.getStroke4());
		this.stroke5 = Strings.isNullOrEmpty(scoreVo.getStroke5()) == true ? null : Integer.parseInt(scoreVo.getStroke5());
		this.stroke6 = Strings.isNullOrEmpty(scoreVo.getStroke6()) == true ? null : Integer.parseInt(scoreVo.getStroke6());
		this.stroke7 = Strings.isNullOrEmpty(scoreVo.getStroke7()) == true ? null : Integer.parseInt(scoreVo.getStroke7());
		this.stroke8 = Strings.isNullOrEmpty(scoreVo.getStroke8()) == true ? null : Integer.parseInt(scoreVo.getStroke8());
		this.stroke9 = Strings.isNullOrEmpty(scoreVo.getStroke9()) == true ? null : Integer.parseInt(scoreVo.getStroke9());
		this.stroke10 = Strings.isNullOrEmpty(scoreVo.getStroke10()) == true ? null : Integer.parseInt(scoreVo.getStroke10());
		this.stroke11 = Strings.isNullOrEmpty(scoreVo.getStroke11()) == true ? null : Integer.parseInt(scoreVo.getStroke11());
		this.stroke12 = Strings.isNullOrEmpty(scoreVo.getStroke12()) == true ? null : Integer.parseInt(scoreVo.getStroke12());
		this.stroke13 = Strings.isNullOrEmpty(scoreVo.getStroke13()) == true ? null : Integer.parseInt(scoreVo.getStroke13());
		this.stroke14 = Strings.isNullOrEmpty(scoreVo.getStroke14()) == true ? null : Integer.parseInt(scoreVo.getStroke14());
		this.stroke15 = Strings.isNullOrEmpty(scoreVo.getStroke15()) == true ? null : Integer.parseInt(scoreVo.getStroke15());
		this.stroke16 = Strings.isNullOrEmpty(scoreVo.getStroke16()) == true ? null : Integer.parseInt(scoreVo.getStroke16());
		this.stroke17 = Strings.isNullOrEmpty(scoreVo.getStroke17()) == true ? null : Integer.parseInt(scoreVo.getStroke17());
		this.stroke18 = Strings.isNullOrEmpty(scoreVo.getStroke18()) == true ? null : Integer.parseInt(scoreVo.getStroke18());
		
		this.putter1 = Strings.isNullOrEmpty(scoreVo.getPutter1()) == true ? null : Integer.parseInt(scoreVo.getPutter1());
		this.putter2 = Strings.isNullOrEmpty(scoreVo.getPutter2()) == true ? null : Integer.parseInt(scoreVo.getPutter2());
		this.putter3 = Strings.isNullOrEmpty(scoreVo.getPutter3()) == true ? null : Integer.parseInt(scoreVo.getPutter3());
		this.putter4 = Strings.isNullOrEmpty(scoreVo.getPutter4()) == true ? null : Integer.parseInt(scoreVo.getPutter4());
		this.putter5 = Strings.isNullOrEmpty(scoreVo.getPutter5()) == true ? null : Integer.parseInt(scoreVo.getPutter5());
		this.putter6 = Strings.isNullOrEmpty(scoreVo.getPutter6()) == true ? null : Integer.parseInt(scoreVo.getPutter6());
		this.putter7 = Strings.isNullOrEmpty(scoreVo.getPutter7()) == true ? null : Integer.parseInt(scoreVo.getPutter7());
		this.putter8 = Strings.isNullOrEmpty(scoreVo.getPutter8()) == true ? null : Integer.parseInt(scoreVo.getPutter8());
		this.putter9 = Strings.isNullOrEmpty(scoreVo.getPutter9()) == true ? null : Integer.parseInt(scoreVo.getPutter9());
		this.putter10 = Strings.isNullOrEmpty(scoreVo.getPutter10()) == true ? null : Integer.parseInt(scoreVo.getPutter10());
		this.putter11 = Strings.isNullOrEmpty(scoreVo.getPutter11()) == true ? null : Integer.parseInt(scoreVo.getPutter11());
		this.putter12 = Strings.isNullOrEmpty(scoreVo.getPutter12()) == true ? null : Integer.parseInt(scoreVo.getPutter12());
		this.putter13 = Strings.isNullOrEmpty(scoreVo.getPutter13()) == true ? null : Integer.parseInt(scoreVo.getPutter13());
		this.putter14 = Strings.isNullOrEmpty(scoreVo.getPutter14()) == true ? null : Integer.parseInt(scoreVo.getPutter14());
		this.putter15 = Strings.isNullOrEmpty(scoreVo.getPutter15()) == true ? null : Integer.parseInt(scoreVo.getPutter15());
		this.putter16 = Strings.isNullOrEmpty(scoreVo.getPutter16()) == true ? null : Integer.parseInt(scoreVo.getPutter16());
		this.putter17 = Strings.isNullOrEmpty(scoreVo.getPutter17()) == true ? null : Integer.parseInt(scoreVo.getPutter17());
		this.putter18 = Strings.isNullOrEmpty(scoreVo.getPutter18()) == true ? null : Integer.parseInt(scoreVo.getPutter18());
		this.description = scoreVo.getDescription();
		// this.dateinserted = 
	}
}
