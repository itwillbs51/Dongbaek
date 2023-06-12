package com.itwillbs.dongbaekcinema.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.dongbaekcinema.vo.PaymentVO;

@Mapper
public interface PaymentMapper {

	// 결제 내역 상세 조회 id로 구별
	PaymentVO selectPayment(String id);
	
	// 결제 내역 조회
	List<PaymentVO> selectPaymentList();

}
