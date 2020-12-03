package com.swing.saver.web.response;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.swing.saver.web.domain.SCScoreDetailInfo;
import com.swing.saver.web.domain.SCScoreInfo;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ResponseScoreSts {
	private final static Logger LOGGER = LoggerFactory.getLogger(ResponseScoreSts.class);
	int high_stroke;			// 최대 스코어
	double high_put_dist;		// 최대 퍼팅거리 (미관리)
	int high_shot_dist;  		// 최대 삿거리 (미관리)
	
	int avg_stroke;				// 평균 타수
	double avg_dist;			// 평균 비거리 (미관리)
	double avg_put_cnt;			// 평균 퍼팅수 (미관리)
	double avg_fairway;			// 평균 페어웨이 안착률
	double avg_greenon;         // 평균 그린 적중률
	String avg_pattern;			// 퍼팅 패턴
	int pattern[] = {0, 0, 0, 0, 0, 0, 0, 0, 0};
	
	List<ResponseScoreDetail> list;
	
	
	@Builder
	public ResponseScoreSts(List<SCScoreInfo> score, List<SCScoreDetailInfo> detail)
	{
		list = new ArrayList<ResponseScoreDetail>();
		this.high_stroke = 0;
		this.high_put_dist = 0.0;
		this.high_shot_dist = 0;
		this.avg_put_cnt = 0.0;
		this.avg_stroke = 0;
		
		int fairwayon = 0;
		int greenon = 0;
		int put_cnt = 0;
		int stroke = 0;
		for (int i=0; i<score.size(); i++)
		{
			ResponseScoreDetail sc = ResponseScoreDetail.builder()
										.score(score.get(i))
										.detail(detail.get(i))
										.build();
			list.add(sc);
			
			if (sc.getTotal_socre() > this.high_stroke) this.high_stroke = sc.getTotal_socre(); // 최코스코어
			if (sc.getPuttersum() > 0) put_cnt	+= sc.getPuttersum();	
			fairwayon += fairwayonCheck(sc);
			greenon += greenonCheck(sc);
			patternCheck(sc);
			stroke += sc.getTotal_socre();
		}
		if (stroke > 0) this.avg_stroke	= (int) Math.round(stroke / (list.size()));
		if (put_cnt > 0) this.avg_put_cnt	= Math.round(put_cnt / (list.size()));		// 평균 퍼팅수
		if (fairwayon > 0) this.avg_fairway = Math.round( (fairwayon/(18.0 * list.size())) * 100.0);						// 페어웨이 안착률
		if (greenon > 0) this.avg_greenon = Math.round(((greenon*1.0)/(18.0*list.size()))*100.0 );							// 그린 적중률
		LOGGER.info("list.size : " + list.size());
		LOGGER.info("avg_stroke : " + avg_stroke + ", stroke : " + stroke);
		LOGGER.info("avg_put_cnt : " + avg_put_cnt + ", put_cnt : " + put_cnt);
		LOGGER.info("avg_fairway : " + avg_fairway + ", fairwayon : " + fairwayon);
		LOGGER.info("avg_greenon : " + avg_greenon + ", greeon : " + greenon);
		patternSet();
	}
	
//	this.SL = 0;   // 1
//	this.SR = 0;   // 2
//	this.SS = 0;   // 3
//	this.JL = 0;   // 4
//	this.JR = 0;   // 5
//	this.OL = 0;   // 6
//	this.OS = 0;   // 7	
//	this.OR = 0;   // 8
//	
	private void patternSet()
	{
		int max_index = -1;
		for (int i=0; i<this.pattern.length; i++)
		{
			if (max_index < this.pattern[i]) max_index = this.pattern[i];
		}
		switch(max_index)
		{
		case 1:
			avg_pattern = "SL";
			break;
		case 2:
			avg_pattern = "SR";
			break;
		case 3:
			avg_pattern = "SS";
			break;
		case 4:
			avg_pattern = "JL";
			break;
		case 5:
			avg_pattern = "JR";
			break;
		case 6:
			avg_pattern = "OL";
			break;
		case 7:
			avg_pattern = "OS";
			break;
		case 8:
			avg_pattern = "OL";
			break;
		default:
			avg_pattern = "";
			break;
				
		}
	}
	private void patternCheck(ResponseScoreDetail d)
	{
		if (d.getPuterpattern1() != null) this.pattern[Integer.parseInt(d.getPuterpattern1())] += 1; 
		if (d.getPuterpattern2() != null) this.pattern[Integer.parseInt(d.getPuterpattern2())] += 1;
		if (d.getPuterpattern3() != null) this.pattern[Integer.parseInt(d.getPuterpattern3())] += 1;
		if (d.getPuterpattern4() != null) this.pattern[Integer.parseInt(d.getPuterpattern4())] += 1;
		if (d.getPuterpattern5() != null) this.pattern[Integer.parseInt(d.getPuterpattern5())] += 1;
		if (d.getPuterpattern6() != null) this.pattern[Integer.parseInt(d.getPuterpattern6())] += 1;
		if (d.getPuterpattern7() != null) this.pattern[Integer.parseInt(d.getPuterpattern7())] += 1;
		if (d.getPuterpattern8() != null) this.pattern[Integer.parseInt(d.getPuterpattern8())] += 1;
		if (d.getPuterpattern9() != null) this.pattern[Integer.parseInt(d.getPuterpattern9())] += 1;
		if (d.getPuterpattern10() != null) this.pattern[Integer.parseInt(d.getPuterpattern10())] += 1;
		if (d.getPuterpattern11() != null) this.pattern[Integer.parseInt(d.getPuterpattern11())] += 1;
		if (d.getPuterpattern12() != null) this.pattern[Integer.parseInt(d.getPuterpattern12())] += 1;
		if (d.getPuterpattern13() != null) this.pattern[Integer.parseInt(d.getPuterpattern13())] += 1;
		if (d.getPuterpattern14() != null) this.pattern[Integer.parseInt(d.getPuterpattern14())] += 1;
		if (d.getPuterpattern15() != null) this.pattern[Integer.parseInt(d.getPuterpattern15())] += 1;
		if (d.getPuterpattern16() != null) this.pattern[Integer.parseInt(d.getPuterpattern16())] += 1;
		if (d.getPuterpattern17() != null) this.pattern[Integer.parseInt(d.getPuterpattern17())] += 1;
		if (d.getPuterpattern18() != null) this.pattern[Integer.parseInt(d.getPuterpattern18())] += 1;
	}
	
	private int fairwayonCheck(ResponseScoreDetail d)
	{
		int sum = 0;
		
		if (d.getFairwayon1() != null && "Y".equals(d.getFairwayon1())) sum++;
		if (d.getFairwayon2() != null && "Y".equals(d.getFairwayon2())) sum++;
		if (d.getFairwayon3() != null && "Y".equals(d.getFairwayon3())) sum++;
		if (d.getFairwayon4() != null && "Y".equals(d.getFairwayon4())) sum++;
		if (d.getFairwayon5() != null && "Y".equals(d.getFairwayon5())) sum++;
		if (d.getFairwayon6() != null && "Y".equals(d.getFairwayon6())) sum++;
		if (d.getFairwayon7() != null && "Y".equals(d.getFairwayon7())) sum++;
		if (d.getFairwayon8() != null && "Y".equals(d.getFairwayon8())) sum++;
		if (d.getFairwayon9() != null && "Y".equals(d.getFairwayon9())) sum++;
		if (d.getFairwayon10() != null && "Y".equals(d.getFairwayon10())) sum++;
		if (d.getFairwayon11() != null && "Y".equals(d.getFairwayon11())) sum++;
		if (d.getFairwayon12() != null && "Y".equals(d.getFairwayon12())) sum++;
		if (d.getFairwayon13() != null && "Y".equals(d.getFairwayon13())) sum++;
		if (d.getFairwayon14() != null && "Y".equals(d.getFairwayon14())) sum++;
		if (d.getFairwayon15() != null && "Y".equals(d.getFairwayon15())) sum++;
		if (d.getFairwayon16() != null && "Y".equals(d.getFairwayon16())) sum++;
		if (d.getFairwayon17() != null && "Y".equals(d.getFairwayon17())) sum++;
		if (d.getFairwayon18() != null && "Y".equals(d.getFairwayon18())) sum++;
		
		return sum;
	}
	
	private int greenonCheck(ResponseScoreDetail d)
	{
		int sum = 0;
		
		if (d.getGreenon1() != null && "Y".equals(d.getGreenon1())) sum++;
		if (d.getGreenon2() != null && "Y".equals(d.getGreenon2())) sum++;
		if (d.getGreenon3() != null && "Y".equals(d.getGreenon3())) sum++;
		if (d.getGreenon4() != null && "Y".equals(d.getGreenon4())) sum++;
		if (d.getGreenon5() != null && "Y".equals(d.getGreenon5())) sum++;
		if (d.getGreenon6() != null && "Y".equals(d.getGreenon6())) sum++;
		if (d.getGreenon7() != null && "Y".equals(d.getGreenon7())) sum++;
		if (d.getGreenon8() != null && "Y".equals(d.getGreenon8())) sum++;
		if (d.getGreenon9() != null && "Y".equals(d.getGreenon9())) sum++;
		if (d.getGreenon10() != null && "Y".equals(d.getGreenon10())) sum++;
		if (d.getGreenon11() != null && "Y".equals(d.getGreenon11())) sum++;
		if (d.getGreenon12() != null && "Y".equals(d.getGreenon12())) sum++;
		if (d.getGreenon13() != null && "Y".equals(d.getGreenon13())) sum++;
		if (d.getGreenon14() != null && "Y".equals(d.getGreenon14())) sum++;
		if (d.getGreenon15() != null && "Y".equals(d.getGreenon15())) sum++;
		if (d.getGreenon16() != null && "Y".equals(d.getGreenon16())) sum++;
		if (d.getGreenon17() != null && "Y".equals(d.getGreenon17())) sum++;
		if (d.getGreenon18() != null && "Y".equals(d.getGreenon18())) sum++;
		
		return sum;
	}
}
