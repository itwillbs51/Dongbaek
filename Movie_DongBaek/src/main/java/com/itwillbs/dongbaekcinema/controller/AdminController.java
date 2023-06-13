package com.itwillbs.dongbaekcinema.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.itwillbs.dongbaekcinema.service.AdminService;
import com.itwillbs.dongbaekcinema.service.MemberService;
import com.itwillbs.dongbaekcinema.service.MovieService;
import com.itwillbs.dongbaekcinema.service.PaymentService;
import com.itwillbs.dongbaekcinema.vo.MemberVO;
import com.itwillbs.dongbaekcinema.vo.MovieVO;
import com.itwillbs.dongbaekcinema.vo.PaymentVO;
import com.itwillbs.dongbaekcinema.vo.PlayVO;




@Controller
public class AdminController {
	
	// 0608 정의효 - 데이터랑 없는상태에서는 오류떠서 주석처리 다해놓음
	// 멤버 관련 회원가입, 조회를 위한 MemberService @Autowired 
	@Autowired
	private MemberService member_service;
	
	@Autowired
	private AdminService admin_service;
	// 0609 정의효
	// 결제 관련 조회를 위한 PaymentService @Autowired
	@Autowired
	private PaymentService payment_service;
	
	@Autowired
	private MovieService movie_service;
	
	// 관리자페이지 메인
	@GetMapping("admin_main")
	public String adminMain() {
		return "admin/admin_main";
	}
	
	// 관리자페이지 회원관리
//	@GetMapping("admin_")
//	public String adminMemeberList() {
//		return "admin/admin_";
//	}
	
	// 관리자페이지 상영스케줄 관리
	@GetMapping("admin_schedule_list")
	public String adminScheduleList() {
		return "admin/admin_schedule_list";
	}
	
    // 관리자페이지 상영스케줄 상단 버튼 클릭
    @GetMapping("showSchedual")
//    public String showSchedual(@RequestParam String theater_name, @RequestParam("play_date") @DateTimeFormat(pattern = "yyyy-MM-dd") Date play_date, Model model) {
   	public String showSchedual(@RequestParam String theater_name, @RequestParam String play_date, Model model) {
        System.out.println(theater_name + ", "+ play_date);
        PlayVO play = admin_service.showSchedual(theater_name, play_date);
        System.out.println(play);
        return "admin/admin_schedule_list";
    }
	
	// 관리자페이지 결제관리
//	@GetMapping("")
//	public String adminPayment() {
//		return "admin/admin_";
//	}	

	// 관리자페이지 공지사항관리
	@GetMapping("admin_cs_notice")
	public String adminCsNotice() {
		return "admin/admin_cs_notice_list";
	}
	
	// 관리자페이지 공지사항 글쓰기 폼
	@GetMapping("admin_cs_notice_form")
	public String adminCsNoticeForm() {
		return "admin/admin_cs_notice_form";
	}
	
	// 관리자페이지 글쓰기 등록 후 게시판 이동
	@PostMapping("admin_cs_notice_pro")
	public String adminCsNoticePro() {
		return "admin/admin_cs_notice_list";
	}
	
	// 관리자페이지 1:1 질문관리
	@GetMapping("admin_cs_qna")
	public String adminCsQna() {
		return "admin/admin_cs_qna_list";
	}
	
	// 관리자페이지 1:1 질문 답글 폼 이동
	@GetMapping("admin_cs_qna_reply")
	public String adminCsQnaReply() {
		return "admin/admin_cs_qna_form";
	}	
	
	// 관리자페이지 1:1 질문 답글 등록 후 게시판 이동
	@PostMapping("admin_cs_qna_pro")
	public String adminCsQnaPro() {
		return "admin/admin_cs_qna_list";
	}	
	
	// 관리자페이지 자주묻는 질문 관리
	@GetMapping("admin_cs_faq")
	public String adminCsFaq() {
		return "admin/admin_cs_faq_list";
	}
	
	// 관리자페이지 자주묻는 질문 글쓰기 폼 이동
	@GetMapping("admin_cs_faq_form")
	public String adminCsFaqForm() {
		return "admin/admin_cs_faq_form";
	}
	
	// 관리자페이지 자주묻는 질문 글쓰기 등록 후 게시판 이동
	@PostMapping("admin_cs_faq_pro")
	public String adminCsFaqPro() {
		return "admin/admin_cs_faq_list";
	}
	
	// 관리자페이지 회원관리 메인(리스트) 회원목록 다 가져와서 뿌리기
	// 데이터넣고 주석풀고 확인하기 0608 - 정의효
	@GetMapping("admin_member_list")
	public String adminMemberList(Model model) {
		List<MemberVO> memberList = member_service.getMemberList();
		model.addAttribute("memberList", memberList);
		System.out.println(memberList);
		return "admin/admin_member_list";
	}
	
	// 관리자페이지 영화관리 메인
	@GetMapping("admin_movie_management")
	public String adminMovieManagement() {
		return "admin/admin_movie_management";
	}
	
	// 관리자페이지 영화관리 등록페이지로 이동 - 0609 정의효
	@GetMapping("admin_movie_regist")
	public String adminMovieRegist() {
		return "admin/admin_movie_regist";
	}
	
	// 영화등록페이지 에서 등록하기 클릭시(insert 구문) - 영화관리 메인으로 이동 - 0610 정의효
	// POST => 폼 파라미터 데이터를 전송받아 저장할 MovieVO 타입 파라미터 설정
	@PostMapping("admin_movie_regist_Pro")
	public String adminMovieRegistPro(MovieVO movie, Model model) {
		int insertCount = movie_service.registMovie(movie);
		
		return "redirect:/admin_movie_management";
	}
	
	// 관리자페이지 결제관리 메인(리스트) 결제목록 다 가져와서 뿌리기
	// 데이터넣고 주석풀고 확인하기 0608 - 정의효
	// 0609 완
	@GetMapping("admin_payment_list")
	public String adminPaymentList(Model model) {
		List<PaymentVO> paymentList = payment_service.getPaymentList();
		
		model.addAttribute("paymentList", paymentList);
		
		return "admin/admin_payment_list";
	}
	
	// 관리자페이지 회원(1명) 정보 조회
	// 파라미터 id(이름은 중복될수있으니까 X)
	// 포워딩 페이지 : admin/admin_member_oneperson
	// 데이터넣고 주석풀고 확인하기 0608 - 정의효
	@GetMapping("admin_member_oneperson")
	public String adminMemberOneperson(@RequestParam String member_id, Model model) {
		MemberVO member = member_service.getMember(member_id);
//		
		model.addAttribute("member", member);
		
		return "admin/admin_member_oneperson";
	}
	
	// 관리자페이지 결제관리메인 -> 상세보기 클릭시 주문내역상세
	// 파라미터 id
	// 포워딩페이지 : admin/admin_payment_list_detai
	// 데이터넣고 주석풀고 확인하기 **완료X 0608 - 정의효
	// 0609 완
	@GetMapping("admin_payment_list_detail")
	public String adminPaymentListDetail(@RequestParam String id, Model model) {
		PaymentVO payment = payment_service.getPayment(id); 
//		
		model.addAttribute("payment", payment);
		
		return "admin/admin_payment_list_detail";
	}
	
	
}



















