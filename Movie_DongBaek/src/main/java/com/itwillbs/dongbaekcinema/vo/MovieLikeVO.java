package com.itwillbs.dongbaekcinema.vo;

import lombok.*;

@Data
public class MovieLikeVO {
	
	private int like_num;
	private String member_id;
	private int movie_num;
	private String movie_name;	// 찜 영화 목록 시 보여주기 위해
	
	
}