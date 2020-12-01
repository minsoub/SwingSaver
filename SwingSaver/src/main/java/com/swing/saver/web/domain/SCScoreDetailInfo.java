package com.swing.saver.web.domain;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;

import org.hibernate.annotations.DynamicInsert;

import com.swing.saver.web.entity.ScoreRequest;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@DynamicInsert			// Insert시 null 필드 제외  @DynamicUpdate => update시 null인 필드 제외
@IdClass(SCScoreInfoPK.class)
@NoArgsConstructor
public class SCScoreDetailInfo {
	@Id
	@Column(name = "visit_date")	
	private String visit_date;			// 방문일자 : yyyyMMdd
	
	@Id
	@Column(name = "countryclub_id")	
	private String countryclub_id;		// 골프장 ID
	
	@Id
	@Column(name = "teeup_time")	
	private String     teeup_time;      // Teeup Time
	
	@Id
	@Column(name = "user_id")	
	private Integer     user_id;             // 사용자 아이디
	
	private String puterpattern1;
	private String puterpattern2;
	private String puterpattern3;
	private String puterpattern4;
	private String puterpattern5;
	private String puterpattern6;
	private String puterpattern7;
	private String puterpattern8;
	private String puterpattern9;
	private String puterpattern10;
	private String puterpattern11;
	private String puterpattern12;
	private String puterpattern13;
	private String puterpattern14;
	private String puterpattern15;
	private String puterpattern16;
	private String puterpattern17;
	private String puterpattern18;
	private String parbreak1;
	private String parbreak2;
	private String parbreak3;
	private String parbreak4;
	private String parbreak5;
	private String parbreak6;
	private String parbreak7;
	private String parbreak8;
	private String parbreak9;
	private String parbreak10;
	private String parbreak11;
	private String parbreak12;
	private String parbreak13;
	private String parbreak14;
	private String parbreak15;
	private String parbreak16;
	private String parbreak17;
	private String parbreak18;
	private String sendsave1;
	private String sendsave2;
	private String sendsave3;
	private String sendsave4;
	private String sendsave5;
	private String sendsave6;
	private String sendsave7;
	private String sendsave8;
	private String sendsave9;
	private String sendsave10;
	private String sendsave11;
	private String sendsave12;
	private String sendsave13;
	private String sendsave14;
	private String sendsave15;
	private String sendsave16;
	private String sendsave17;
	private String sendsave18;
	private String greenon1;
	private String greenon2;
	private String greenon3;
	private String greenon4;
	private String greenon5;
	private String greenon6;
	private String greenon7;
	private String greenon8;
	private String greenon9;
	private String greenon10;
	private String greenon11;
	private String greenon12;
	private String greenon13;
	private String greenon14;
	private String greenon15;
	private String greenon16;
	private String greenon17;
	private String greenon18;
	private String fairwayon1;
	private String fairwayon2;
	private String fairwayon3;
	private String fairwayon4;
	private String fairwayon5;
	private String fairwayon6;
	private String fairwayon7;
	private String fairwayon8;
	private String fairwayon9;
	private String fairwayon10;
	private String fairwayon11;
	private String fairwayon12;
	private String fairwayon13;
	private String fairwayon14;
	private String fairwayon15;
	private String fairwayon16;
	private String fairwayon17;
	private String fairwayon18;
	private String description;
	private Timestamp dateinserted;
	
	@Builder
	public SCScoreDetailInfo(ScoreRequest scoreVo)
	{
		this.visit_date = scoreVo.getVisit_date();
		this.countryclub_id = scoreVo.getCountryclub_id();
		this.teeup_time = scoreVo.getTeeup_time();
		this.user_id = scoreVo.getUser_id() == null ? null : Integer.parseInt(scoreVo.getUser_id());
		this.puterpattern1 = scoreVo.getPuterpattern1();
		this.puterpattern2 = scoreVo.getPuterpattern2();
		this.puterpattern3 = scoreVo.getPuterpattern3();
		this.puterpattern4 = scoreVo.getPuterpattern4();
		this.puterpattern5 = scoreVo.getPuterpattern5();
		this.puterpattern6 = scoreVo.getPuterpattern6();
		this.puterpattern7 = scoreVo.getPuterpattern7();
		this.puterpattern8 = scoreVo.getPuterpattern8();
		this.puterpattern9 = scoreVo.getPuterpattern9();
		this.puterpattern10 = scoreVo.getPuterpattern10();
		this.puterpattern11 = scoreVo.getPuterpattern11();
		this.puterpattern12 = scoreVo.getPuterpattern12();
		this.puterpattern13 = scoreVo.getPuterpattern13();
		this.puterpattern14 = scoreVo.getPuterpattern14();
		this.puterpattern15 = scoreVo.getPuterpattern15();
		this.puterpattern16 = scoreVo.getPuterpattern16();
		this.puterpattern17 = scoreVo.getPuterpattern17();
		this.puterpattern18 = scoreVo.getPuterpattern18();
		this.parbreak1 = scoreVo.getParbreak1();
		this.parbreak2 = scoreVo.getParbreak2();
		this.parbreak3 = scoreVo.getParbreak3();
		this.parbreak4 = scoreVo.getParbreak4();
		this.parbreak5 = scoreVo.getParbreak5();
		this.parbreak6 = scoreVo.getParbreak6();
		this.parbreak7 = scoreVo.getParbreak7();
		this.parbreak8 = scoreVo.getParbreak8();
		this.parbreak9 = scoreVo.getParbreak9();
		this.parbreak10 = scoreVo.getParbreak10();
		this.parbreak11= scoreVo.getParbreak11();
		this.parbreak12= scoreVo.getParbreak12();
		this.parbreak13= scoreVo.getParbreak13();
		this.parbreak14= scoreVo.getParbreak14();
		this.parbreak15= scoreVo.getParbreak15();
		this.parbreak16= scoreVo.getParbreak16();
		this.parbreak17= scoreVo.getParbreak17();
		this.parbreak18= scoreVo.getParbreak18();
		this.sendsave1 = scoreVo.getSendsave1();
		this.sendsave2 = scoreVo.getSendsave2();
		this.sendsave3 = scoreVo.getSendsave3();
		this.sendsave4 = scoreVo.getSendsave4();
		this.sendsave5 = scoreVo.getSendsave5();
		this.sendsave6 = scoreVo.getSendsave6();
		this.sendsave7 = scoreVo.getSendsave7();
		this.sendsave8 = scoreVo.getSendsave8();
		this.sendsave9 = scoreVo.getSendsave9();
		this.sendsave10 = scoreVo.getSendsave10();
		this.sendsave11 = scoreVo.getSendsave11();
		this.sendsave12 = scoreVo.getSendsave12();
		this.sendsave13 = scoreVo.getSendsave13();
		this.sendsave14 = scoreVo.getSendsave14();
		this.sendsave15 = scoreVo.getSendsave15();
		this.sendsave16 = scoreVo.getSendsave16();
		this.sendsave17 = scoreVo.getSendsave17();
		this.sendsave18 = scoreVo.getSendsave18();
		this.greenon1 = scoreVo.getGreenon1();
		this.greenon2 = scoreVo.getGreenon2();
		this.greenon3 = scoreVo.getGreenon3();
		this.greenon4 = scoreVo.getGreenon4();
		this.greenon5 = scoreVo.getGreenon5();
		this.greenon6 = scoreVo.getGreenon6();
		this.greenon7 = scoreVo.getGreenon7();
		this.greenon8 = scoreVo.getGreenon8();
		this.greenon9 = scoreVo.getGreenon9();
		this.greenon10 = scoreVo.getGreenon10();
		this.greenon11 = scoreVo.getGreenon11();
		this.greenon12 = scoreVo.getGreenon12();
		this.greenon13 = scoreVo.getGreenon13();
		this.greenon14 = scoreVo.getGreenon14();
		this.greenon15 = scoreVo.getGreenon15();
		this.greenon16 = scoreVo.getGreenon16();
		this.greenon17 = scoreVo.getGreenon17();
		this.greenon18 = scoreVo.getGreenon18();
		this.fairwayon1 = scoreVo.getFairwayon1();
		this.fairwayon2 = scoreVo.getFairwayon2();
		this.fairwayon3 = scoreVo.getFairwayon3();
		this.fairwayon4 = scoreVo.getFairwayon4();
		this.fairwayon5 = scoreVo.getFairwayon5();
		this.fairwayon6 = scoreVo.getFairwayon6();
		this.fairwayon7 = scoreVo.getFairwayon7();
		this.fairwayon8 = scoreVo.getFairwayon8();
		this.fairwayon9 = scoreVo.getFairwayon9();
		this.fairwayon10 = scoreVo.getFairwayon10();
		this.fairwayon11 = scoreVo.getFairwayon11();
		this.fairwayon12 = scoreVo.getFairwayon12();
		this.fairwayon13 = scoreVo.getFairwayon13();
		this.fairwayon14 = scoreVo.getFairwayon14();
		this.fairwayon15 = scoreVo.getFairwayon15();
		this.fairwayon16 = scoreVo.getFairwayon16();
		this.fairwayon17 = scoreVo.getFairwayon17();
		this.fairwayon18 = scoreVo.getFairwayon18();
		this.description = scoreVo.getDescription();
		this.dateinserted = new Timestamp(System.currentTimeMillis()); 
	}
}
