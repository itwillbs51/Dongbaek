package com.itwillbs.dongbaekcinema.controller;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.itwillbs.dongbaekcinema.service.*;
import com.itwillbs.dongbaekcinema.vo.*;

@Controller
public class MemberController {
	
	// Service와 연결하기
	@Autowired
	private MemberService service;
		
	// 메인화면에서 회원 로그인 화면으로 이동
	@GetMapping("member_login_form")
	public String member_login_form() {
		return "member/member_login_form";
	}
	
	// "/member_join_pro" 요청에 대해 MemberService 객체 비즈니스 로직 수행 
	// => 폼 파라미터로 전달되는 가입 정보를 파라미터로 전달받기 
	// => 가입 완료 후 이동할 페이지 : member/member_join_step4.jsp 
	// => 가입 실패 시 오류 페이지(fail_back) 을 통해 "회원 가입이 실패하였습니다." 출력 후 이전 페이지( )로 돌아가기!
	@PostMapping("member_join_pro")
	public String joinPro(MemberVO member, Model model) {
		System.out.println(member);
		
		// MemberService(registMember()) - MemberMapper(insertMember())
		int insertCount = service.registMember(member);
		
		// 회원 가입 성공/실패에 따른 페이지 포워딩
		// => 성공 시 MemberJoinSuccess 로 리다이렉트
		// => 실패 시 fail_back.jsp 로 포풔딩(model 객체의 "msg" 속성으로 "회원 가입 실패!" 저장)
		if(insertCount > 0) {
			return "redirect:/MemberJoinSuccess";
		} else {
			model.addAttribute("msg", "회원 가입이 실패하였습니다!");
			return "fail_back";
		}
	}
	
	// "/MemberJoinSuccess" 요청에 대해 "member/member_join_step4.jsp" 페이지 포워딩
	// => GET 방식 요청, Dispatch 방식 포워딩 
	@GetMapping("MemberJoinSuccess")
	public String joinSuccess() {
		return "member/member_join_step4";
	}
	
	@GetMapping("member_join_step4")
	public String member_join_step4() {
		return "member_join_step4";
	}
	
	
	// 로그인 폼에서 로그인 버튼, 네이버/카카오 로그인 버튼 클릭 시 처리
	@PostMapping("member_login_pro")
	public String member_login_pro(MemberVO member, HttpSession session, Model model) {
		
		// 1. 일반 로그인 시도
		// MemberService - getPasswd()
		// member 테이블에서 id가 일치하는 레코드의 패스워드(passwd) 조회
		// 파라미터 : MemberVO member	리턴타입 : String(passwd)
		String passwd = service.getPasswd(member);
//		System.out.println(passwd);
		
		// 로그인 성공/ 실패 여부 판별하여 포워딩
		// => 성공 : MemberVO 객체에 데이터가 저장되어 있고 입력받은 패스워드가 같음
		// => 실패 : MemberVO 객체가 null 이거나 입력받은 패스워드와 다름
		if(passwd == null || !passwd.equals(member.getMember_pass())) {
			// 아이디로 조회 시 없는 아이디이거나 나온 패스워드가 member.getPasswd와 다를 때(비밀번호가 틀림)
			model.addAttribute("msg", "아이디 또는 비밀번호를 잘못 입력했습니다. "
					+ "입력하신 내용을 다시 확인해주세요.");
			return "fail_back";
		} else {
			// 로그인 성공 시
			// 세션에 값 넣기
			session.setAttribute("member_id", member.getMember_id());
			return "redirect:/";	// 메인페이지(루트)로 리다이렉트 (href="./" 와 같음)
		}
			
		
		// 네이버/카카오 로그인 클릭 시 (네이버/카카오 로그인 성공)
		// 넘어온 이메일 정보가 DB에 있는지 확인
		
		
		// 이메일 정보가 있을 때 (회원임)
		
		// 이메일이 회원정보에 없을 때(회원 아님)
		// "아직 동백씨네마의 회원이 아닙니다. 회원가입 하시겠습니까?" => 회원가입 페이지로 넘어가기
//		return "member/member_join_step3";	// => 회원가입(3단계) 정보입력창으로 가기
		
	}
	
	// 로그아웃 작업 후 메인으로 돌아가기
	@GetMapping("member_logout")
	public String member_logout(HttpSession session) {
		// 세션에 저장한 member_id(저장한 정보들) 초기화
		session.invalidate();
		
		// 세션 초기화 후 main 화면으로 돌아가기
		return "redirect:/";
	}
	
	// 메인화면에서 회원가입 화면 1페이지로 이동
	@GetMapping("member_join_step1")
	public String member_join_step1() {
		return "member/member_join_step1";
	}
	
	@GetMapping("member_join_certify")
	public String member_join_certify() {
		return "member/member_join_certify";
	}
	
	// 회원가입 화면 1에서 인증 성공 시 회원가입 화면 2페이지로 이동
	@GetMapping("member_join_step2")
	public String member_join_step2(MemberVO member, Model model) {
		// 약관 동의 하는 페이지로 이동
		
		return "member/member_join_step2";
	}
	
	
	
	
	// 회원 로그인 화면에서 상단 탭(header)의 비회원 로그인 탭 클릭 시 비회원 로그인 페이지로 이동
	@GetMapping("no_member_login_form")
	public String no_member_login_form() {
		return "member/no_member_login_form";
	}

	// 회원 로그인 화면에서 상단 탭(header)의  비회훤 예매 확인 탭 클릭 시 비회원 예매 확인 페이지로 이동
	@GetMapping("no_member_reservation_check_form")
	public String no_member_reservation_check_form() {
		return "member/no_member_reservation_check_form";
	}
	
	// 임시 - 정보입력화면 
	@GetMapping("member_join_step3")
	public String member_join_step3() {
		return "member/member_join_step3";
	}
	

}

























