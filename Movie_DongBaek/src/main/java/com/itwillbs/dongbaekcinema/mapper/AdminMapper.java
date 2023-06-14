package com.itwillbs.dongbaekcinema.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.dongbaekcinema.vo.PlayVO;

@Mapper
public interface AdminMapper {
	
	// 셀렉트박스 영화관 정보 가져오기
	public List<HashMap<String, String>> getTeater();

	//  버튼 클릭 시 스케줄 목록 가져오기
	public List<PlayVO> selectScheduleList(@Param("theater_num") String theater_num, @Param("play_date") String play_date);

	
}
