package com.finalc.auction;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.finalc.auction.model.MemberVO;
import com.finalc.auction.service.InterPaymentService;

@Controller
@Component
public class PaymentController {
	
	// 경매 컨트롤러 (InterPaymentService)
	@Autowired
	private InterPaymentService service;
	
	// 충전금액 선택 페이지 출력
	@RequestMapping(value="/coinPurchaseTypeChoice.action", method={RequestMethod.GET})  
	public String auctionLogin_coinPurchaseTypeChoice(HttpServletRequest req, HttpServletResponse res, HttpSession session) {
		
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		String usernum = req.getParameter("usernum");
		
		if (loginuser != null && loginuser.getUsernum().equals(usernum)) {
		
			req.setAttribute("idx", usernum);
			
			return "coinPurchaseTypeChoice.notiles";
		}
		else {
			
			String msg = "비정상적인 경로로 들어왔습니다.";
	 		String loc = "javascript:history.back();";
	 		
	 		req.setAttribute("msg", msg);
	 		req.setAttribute("loc", loc);
	 		
			return "msg.notiles";
		}
		
	} // 충전 금액 선택 페이지 출력
	
	// 결제 페이지 출력
	@RequestMapping(value="/coinPurchase.action", method={RequestMethod.GET})  
	public String auctionLogin_coinPurchase(HttpServletRequest req, HttpServletResponse res, HttpSession session) {
		
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		
		String usernum = req.getParameter("usernum");
	 	String coinmoney = req.getParameter("coinmoney");
		System.out.println(">> 확인용 1");
		if (loginuser != null && loginuser.getUsernum().equals(usernum)) {
			
			System.out.println(">> 확인용 2");
			req.setAttribute("idx", usernum);
			
			req.setAttribute("usernum", usernum);
	 		req.setAttribute("coinmoney", coinmoney);
	 		req.setAttribute("name", loginuser.getUsername());
	 		
	 		HashMap<String,String> coinmap = new HashMap<String,String>();
	 		coinmap.put("usernum", usernum);
	 		coinmap.put("coinmoney", coinmoney);
	 		
	 		session.setAttribute("coinmap", coinmap); // 세션에 저장
			
			return "paymentGateway.notiles";
		}
		else {
			// 로그인을 하지 않은 상태에서는 코인충전을 할 수 없도록 해야 한다.
			// 로그인을 했지만 다른 사용자의 코인충전은 불가하도록 해야 한다.
			System.out.println(">> 확인용 3");
	 		String msg = "비정상적인 경로로 들어왔습니다.";
	 		String loc = "javascript:history.back();";
	 		
	 		req.setAttribute("msg", msg);
	 		req.setAttribute("loc", loc);
	 		
			return "msg.notiles";
		}
	}
	// 결제 페이지 출력
	
	// 결제 진행 후 결과 출력
	@RequestMapping(value="/auctionPay.action", method={RequestMethod.POST})
	public String auctionLogin_auctionPay(HttpServletRequest req, HttpServletResponse res, HttpSession session) {
	
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		String usernum = req.getParameter("usernum");
		
		System.out.println(">> 확인용 auctionPay의 usernum : " + usernum);
		
		System.out.println(">> 확인용 auctionPay의 loginuser : " + loginuser);
		String msg = null;
		
		@SuppressWarnings("unchecked")
		HashMap<String,String> coinmap = (HashMap<String,String>)session.getAttribute("coinmap"); // 세션에서 불러옴
		
		System.out.println(">> 확인용 auctionPay의 loginuser : " + loginuser);
		if(loginuser != null && loginuser.getUsernum().equals(usernum) && coinmap.get("usernum").equals(usernum)) {
			
			System.out.println(">> 확인용 auctionPay의 coinmoney : " + coinmap.get("coinmoney"));
			
			int n = service.auctionPay(usernum, coinmap.get("coinmoney"));
			
			if (n == 1) {
				msg = loginuser.getUserid()+ "[" + loginuser.getUsername() + "]님의 코인액 "
						+ coinmap.get("coinmoney") + "원 결제가 완료되었습니다.";
			}
			else {
				msg = loginuser.getUserid()+ "[" + loginuser.getUsername() + "]님의 코인액 결제에 실패했습니다.";  
			}
			
			req.setAttribute("msg", msg);
			
			return "coinAddUpdateLoginuser.tiles";
			
		}
		else {
			msg = "코인결제에 문제가 발생했습니다...";
			
			req.setAttribute("msg", msg);
			
			return "coinAddUpdateLoginuser.tiles";
		}
	}
	// 결제 진행 후 결과 출력
}
