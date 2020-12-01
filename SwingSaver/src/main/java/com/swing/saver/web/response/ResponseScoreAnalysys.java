package com.swing.saver.web.response;

import com.swing.saver.web.domain.SCScoreDetailInfo;
import com.swing.saver.web.domain.SCScoreInfo;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ResponseScoreAnalysys {

	private int total_socre;			// 총 스커어 
	private String par_data;            // +, - 4
	
	private String visit_date_format;   // 2020.03.02
	private String teeup_time_format;   // 13:00
	
	private int OS;
	private int JL;
	private int JR;
	private int OL;
	private int OR;
	private int SL;
	private int SR;
	private int SS;
	
	private int fairway_total;
	private int fairway_hit;
	
	private int green_total;
	private int green_hit;
	
	private int birdie;
	private int par;
	private int bogey;
	private int double_bogey;
	private int triple_bogey;
	
	@Builder
	public ResponseScoreAnalysys(SCScoreInfo score, SCScoreDetailInfo detail)
	{
		// date format 
		this.visit_date_format = score.getVisit_date().substring(0, 4)+"."+score.getVisit_date().substring(4,6)+"."+score.getVisit_date().substring(6);
		this.teeup_time_format = score.getTeeup_time().substring(0, 2)+":"+score.getTeeup_time().substring(2);
		
		
		this.total_socre = 0;	// stroke 친 개수
		if (score.getStroke1() != null) this.total_socre += score.getStroke1();
		if (score.getStroke2() != null) this.total_socre += score.getStroke2();
		if (score.getStroke3() != null) this.total_socre += score.getStroke3();
		if (score.getStroke4() != null) this.total_socre += score.getStroke4();
		if (score.getStroke5() != null) this.total_socre += score.getStroke5();
		if (score.getStroke6() != null) this.total_socre += score.getStroke6();
		if (score.getStroke7() != null) this.total_socre += score.getStroke7();
		if (score.getStroke8() != null) this.total_socre += score.getStroke8();
		if (score.getStroke9() != null) this.total_socre += score.getStroke9();
		if (score.getStroke10() != null) this.total_socre += score.getStroke10();
		if (score.getStroke11() != null) this.total_socre += score.getStroke11();
		if (score.getStroke12() != null) this.total_socre += score.getStroke12();
		if (score.getStroke13() != null) this.total_socre += score.getStroke13();
		if (score.getStroke14() != null) this.total_socre += score.getStroke14();
		if (score.getStroke15() != null) this.total_socre += score.getStroke15();
		if (score.getStroke16() != null) this.total_socre += score.getStroke16();
		if (score.getStroke17() != null) this.total_socre += score.getStroke17();
		if (score.getStroke18() != null) this.total_socre += score.getStroke18();
		
		// par data
		this.par_data = "";
		int par = 0;
		if (score.getScore1() != null) par += score.getScore1();
		if (score.getScore2() != null) par += score.getScore2();
		if (score.getScore3() != null) par += score.getScore3();
		if (score.getScore4() != null) par += score.getScore4();
		if (score.getScore5() != null) par += score.getScore5();
		if (score.getScore6() != null) par += score.getScore6();
		if (score.getScore7() != null) par += score.getScore7();
		if (score.getScore8() != null) par += score.getScore8();
		if (score.getScore9() != null) par += score.getScore9();
		if (score.getScore10() != null) par += score.getScore10();
		if (score.getScore11() != null) par += score.getScore11();
		if (score.getScore12() != null) par += score.getScore12();
		if (score.getScore13() != null) par += score.getScore13();
		if (score.getScore14() != null) par += score.getScore14();
		if (score.getScore15() != null) par += score.getScore15();
		if (score.getScore16() != null) par += score.getScore16();
		if (score.getScore17() != null) par += score.getScore17();
		if (score.getScore18() != null) par += score.getScore18();
		
		System.out.println("par : " + par);
		
		if (par > 0) this.par_data = "+"+String.valueOf(par);
		else this.par_data = "-"+String.valueOf(Math.abs(par));
		
		
		// putter-pattern
		this.SL = 0;   // 1
		this.SR = 0;   // 2
		this.SS = 0;   // 3
		this.JL = 0;   // 4
		this.JR = 0;   // 5
		this.OL = 0;   // 6
		this.OS = 0;   // 7	
		this.OR = 0;   // 8
		
		
		if (detail.getPuterpattern1() != null) setPutterPattern(detail.getPuterpattern1());		
		if (detail.getPuterpattern2() != null) setPutterPattern(detail.getPuterpattern2());
		if (detail.getPuterpattern3() != null) setPutterPattern(detail.getPuterpattern3());
		if (detail.getPuterpattern4() != null) setPutterPattern(detail.getPuterpattern4());
		if (detail.getPuterpattern5() != null) setPutterPattern(detail.getPuterpattern5());
		if (detail.getPuterpattern6() != null) setPutterPattern(detail.getPuterpattern6());
		if (detail.getPuterpattern7() != null) setPutterPattern(detail.getPuterpattern7());
		if (detail.getPuterpattern8() != null) setPutterPattern(detail.getPuterpattern8());
		if (detail.getPuterpattern9() != null) setPutterPattern(detail.getPuterpattern9());
		if (detail.getPuterpattern10() != null) setPutterPattern(detail.getPuterpattern10());
		if (detail.getPuterpattern11() != null) setPutterPattern(detail.getPuterpattern11());
		if (detail.getPuterpattern12() != null) setPutterPattern(detail.getPuterpattern12());
		if (detail.getPuterpattern13() != null) setPutterPattern(detail.getPuterpattern13());
		if (detail.getPuterpattern14() != null) setPutterPattern(detail.getPuterpattern14());
		if (detail.getPuterpattern15() != null) setPutterPattern(detail.getPuterpattern15());
		if (detail.getPuterpattern16() != null) setPutterPattern(detail.getPuterpattern16());
		if (detail.getPuterpattern17() != null) setPutterPattern(detail.getPuterpattern17());
		if (detail.getPuterpattern18() != null) setPutterPattern(detail.getPuterpattern18());
		
		this.fairway_total = 0;
		this.fairway_hit = 0;
		// Fairway Hit
		if (detail.getFairwayon1() != null) setFairway(detail.getFairwayon1());
		if (detail.getFairwayon2() != null) setFairway(detail.getFairwayon2());
		if (detail.getFairwayon3() != null) setFairway(detail.getFairwayon3());
		if (detail.getFairwayon4() != null) setFairway(detail.getFairwayon4());
		if (detail.getFairwayon5() != null) setFairway(detail.getFairwayon5());
		if (detail.getFairwayon6() != null) setFairway(detail.getFairwayon6());
		if (detail.getFairwayon7() != null) setFairway(detail.getFairwayon7());
		if (detail.getFairwayon8() != null) setFairway(detail.getFairwayon8());
		if (detail.getFairwayon9() != null) setFairway(detail.getFairwayon9());
		if (detail.getFairwayon10() != null) setFairway(detail.getFairwayon10());
		if (detail.getFairwayon11() != null) setFairway(detail.getFairwayon11());
		if (detail.getFairwayon12() != null) setFairway(detail.getFairwayon12());
		if (detail.getFairwayon13() != null) setFairway(detail.getFairwayon13());
		if (detail.getFairwayon14() != null) setFairway(detail.getFairwayon14());
		if (detail.getFairwayon15() != null) setFairway(detail.getFairwayon15());
		if (detail.getFairwayon16() != null) setFairway(detail.getFairwayon16());
		if (detail.getFairwayon17() != null) setFairway(detail.getFairwayon17());
		if (detail.getFairwayon18() != null) setFairway(detail.getFairwayon18());
				
		// Green Hit
		this.green_total = 0;
		this.green_hit = 0;
		if (detail.getGreenon1() != null) setGreenon(detail.getGreenon1());
		if (detail.getGreenon2() != null) setGreenon(detail.getGreenon2());
		if (detail.getGreenon3() != null) setGreenon(detail.getGreenon3());
		if (detail.getGreenon4() != null) setGreenon(detail.getGreenon4());
		if (detail.getGreenon5() != null) setGreenon(detail.getGreenon5());
		if (detail.getGreenon6() != null) setGreenon(detail.getGreenon6());
		if (detail.getGreenon7() != null) setGreenon(detail.getGreenon7());
		if (detail.getGreenon8() != null) setGreenon(detail.getGreenon8());
		if (detail.getGreenon9() != null) setGreenon(detail.getGreenon9());
		if (detail.getGreenon10() != null) setGreenon(detail.getGreenon10());
		if (detail.getGreenon11() != null) setGreenon(detail.getGreenon11());
		if (detail.getGreenon12() != null) setGreenon(detail.getGreenon12());
		if (detail.getGreenon13() != null) setGreenon(detail.getGreenon13());
		if (detail.getGreenon14() != null) setGreenon(detail.getGreenon14());
		if (detail.getGreenon15() != null) setGreenon(detail.getGreenon15());
		if (detail.getGreenon16() != null) setGreenon(detail.getGreenon16());
		if (detail.getGreenon17() != null) setGreenon(detail.getGreenon17());
		if (detail.getGreenon18() != null) setGreenon(detail.getGreenon18());
		
		this.birdie = 0;   // 기준 타수보다 하나 적은 타수로 공을 홀에 넣는 일
		this.par = 0;      // 기준만큼 친 개수 
		this.bogey = 0;    // 기준 타수보다 하나 더 친 타수 
		this.double_bogey = 0;  // 기준 타수보다 2개 더 친 타수
		this.triple_bogey = 0;  // 기준 타수보다 3개 더 친 타수
		
		if (score.getScore1() != null) setCalc(score.getScore1());
		if (score.getScore2() != null) setCalc(score.getScore2());
		if (score.getScore3() != null) setCalc(score.getScore3());
		if (score.getScore4() != null) setCalc(score.getScore4());
		if (score.getScore5() != null) setCalc(score.getScore5());
		if (score.getScore6() != null) setCalc(score.getScore6());
		if (score.getScore7() != null) setCalc(score.getScore7());
		if (score.getScore8() != null) setCalc(score.getScore8());
		if (score.getScore9() != null) setCalc(score.getScore9());
		if (score.getScore10() != null) setCalc(score.getScore10());
		if (score.getScore11() != null) setCalc(score.getScore11());
		if (score.getScore12() != null) setCalc(score.getScore12());
		if (score.getScore13() != null) setCalc(score.getScore13());
		if (score.getScore14() != null) setCalc(score.getScore14());
		if (score.getScore15() != null) setCalc(score.getScore15());
		if (score.getScore16() != null) setCalc(score.getScore16());
		if (score.getScore17() != null) setCalc(score.getScore17());
		if (score.getScore18() != null) setCalc(score.getScore18());
		
		System.out.println("par => " + this.par + ", birdie => " + this.birdie + ", bogey => " + this.bogey + ", double_bogey => " + this.double_bogey+", triple_bogey => " + this.triple_bogey);
		
		// re-calculate		
		if (this.par > 0) this.par = (int) Math.round((this.par / 18.0) * 100.0);
		if (this.birdie > 0) this.birdie = (int) Math.round((this.birdie / 18.0) * 100.0);
		if (this.bogey > 0) this.bogey = (int) Math.round((this.bogey / 18.0) * 100.0);
		if (this.double_bogey > 0) this.double_bogey = (int) Math.round((this.double_bogey / 18.0) * 100.0);
		if (this.triple_bogey > 0) this.triple_bogey = (int) Math.round((this.triple_bogey / 18.0) * 100.0);
	}
	private void setCalc(int score)
	{
		
			switch(score)
			{
				case 0:
					this.par++;
					break;
				case -1:
					this.birdie++;
					break;
				case 1:
					this.bogey++;
					break;
				case 2:
					this.double_bogey++;
					break;
				case 3:
					this.triple_bogey++;
					break;
			}
	}
	private void setGreenon(String greenon)
	{
		this.green_total++;
		if (greenon.equals("Y")) this.green_hit++;
	}
	
	private void setFairway(String fairway)
	{
		this.fairway_total++;
		if (fairway.equals("Y")) this.fairway_hit++;
	}
	
	private void setPutterPattern(String putterpattern)
	{
		if (putterpattern.equals("1")) this.SL++;
		if (putterpattern.equals("2")) this.SR++;
		if (putterpattern.equals("3")) this.SS++;
		if (putterpattern.equals("4")) this.JL++;
		if (putterpattern.equals("5")) this.JR++;
		if (putterpattern.equals("6")) this.OL++;
		if (putterpattern.equals("7")) this.OS++;
		if (putterpattern.equals("8")) this.OR++;
	}
}
	
	
