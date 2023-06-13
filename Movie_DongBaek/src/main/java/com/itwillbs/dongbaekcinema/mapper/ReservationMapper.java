package com.itwillbs.dongbaekcinema.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.dongbaekcinema.vo.MovieVO;
import com.itwillbs.dongbaekcinema.vo.TheaterVO;

@Mapper
public interface ReservationMapper {
	// 영화 목록 조회
	List<MovieVO> selectMovieList();

	// 영화 정보 조회
	MovieVO selectMovie(int movie_num);

	// 극장 목록 조회
	List<TheaterVO> selectTheaterList(int movie_num);
}
