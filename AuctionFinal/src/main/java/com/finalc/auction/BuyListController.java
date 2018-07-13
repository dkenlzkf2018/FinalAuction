package com.finalc.auction;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.finalc.auction.common.MyUtil;
import com.finalc.auction.model.AuctionVO;
import com.finalc.auction.model.CategoryVO;
import com.finalc.auction.model.HugiBoardVO;
import com.finalc.auction.model.JoinaclistVO;
import com.finalc.auction.model.MemberVO;
import com.finalc.auction.service.InterBuyListService;



@Controller
public class BuyListController {
	
	@Autowired
	private InterBuyListService service;
	
	// #Buy 2. 구매 리스트 controller 단
	@RequestMapping(value="/buyList.action", method={RequestMethod.GET})
	public String buyList(HttpServletRequest req) {
		HttpSession session = req.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		
		session.setAttribute("loginuser", loginuser);
				
		if (loginuser == null) {
			req.setAttribute("msg", "로그인을 먼저 하십시오!");
			req.setAttribute("loc", "login.action");
			return "msg.notiles";
		} 
		
		else {
			System.out.println("1. 접속한 유저아이디 : " + loginuser.getUserid());
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("usernum", loginuser.getUsernum());
			// ===== #110. 페이징 처리 하기 =====
			String str_currentShowPageNo = req.getParameter("currentShowPageNo"); 
			
			int totalCount = 0;         // 총게시물건수
			int sizePerPage = 10;        // 한 페이지당 보여줄 게시물 건수 
			int currentShowPageNo = 0;  // 현재 보여주는 페이지 번호로서, 초기치로는 1페이지로 설정함.
			int totalPage = 0;          // 총페이지수 (웹브라우저상에 보여줄 총 페이지 갯수)
			
			int startRno = 0;           // 시작행 번호
			int endRno = 0;             // 끝행 번호
			
			int blockSize = 5;         // "페이지바" 에 보여줄 페이지의 갯수 
			
			/*
			    ==== 총페이지수 구하기 ====    
			        검색조건이 없을 때의 총페이지 수와
			        검색조건이 있을 때의 총페이지 수를 구해야 한다.
			        
			        검색조건이 없을 때의 총페이지 수 ==> colname 과 search 값이 null 인 것이고,
			        검색조건이 있을 때의 총페이지 수 ==> colname 과 search 값이 null 이 아닌 것이다.        
			 */
			// 먼저 총게시물 건수를 구한다.
			
			totalCount = service.getTotalCount(); // 검색어가 없는 총게시물 건수
			
			
			totalPage = (int)Math.ceil((double)totalCount/sizePerPage);
			
			
			
			if(str_currentShowPageNo == null) {
				// 게시판 초기화면에 보여지는 것은 
				// req.getParameter("currentShowPageNo"); 값이 없으므로
				// str_currentShowPageNo 는 null 이 된다.
				
				currentShowPageNo = 1; 
			}
			else {
				try {
					currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
					
					if(currentShowPageNo < 1 || currentShowPageNo > totalPage) {
						currentShowPageNo = 1;
					}
					
					/*if (currentShowPageNo > 1) {
						
					}*/
					
				} catch (NumberFormatException e) {
					currentShowPageNo = 1;
				}
			}
			
			// **** 가져올 게시글의 범위를 구한다.(공식임!!!) ****
			/*
			      currentShowPageNo    startRno    endRno
			      ---------------------------------------
			           1 page      ==>     1          5
			           2 page      ==>     6         10
			           3 page      ==>    11         15
			           4 page      ==>    16         20
			           5 page      ==>    21         25
			           6 page      ==>    26         30
			           7 page      ==>    31         35
			 */
			
			startRno = (currentShowPageNo - 1) * sizePerPage + 1;
			endRno = startRno + sizePerPage - 1;
			
			// ==== #111. 페이징 처리를 위해 startRno, endRno 를 map 에 추가하여 
			//            파라미터로 넘겨서 select 되도록 한다. 
			map.put("startRno", String.valueOf(startRno));
			map.put("endRno", String.valueOf(endRno));
			
			/*String pagebar = "<li>";
			
			pagebar += MyUtil.getAuctionPageBar("buyList.action", currentShowPageNo, sizePerPage, totalPage, blockSize);     
			pagebar += "</li>";*/
			
			
			
			String pagebar = MyUtil.getAuctionPageBar("buyList.action", currentShowPageNo, sizePerPage, totalPage, blockSize);     
			
			
			List<HashMap<String, String>> buyMapList = new ArrayList<HashMap<String, String>>();
			buyMapList = service.getBuyList(map);
			System.out.println("4. Controller 단 buyMapList");
			req.setAttribute("buyMapList", buyMapList);
			req.setAttribute("pagebar", pagebar);
			req.setAttribute("startRno", startRno);
			req.setAttribute("endRno", endRno);
			req.setAttribute("currentShowPageNo", currentShowPageNo);
			
			return "buy/buyList.tiles";
		}
	}
	
	// #Auction 1. 사용자가 경매에 등록한 상품의 정보를 조회한다.
	@RequestMapping(value="/viewAuction.action", method={RequestMethod.GET})
	public String viewAuction(HttpServletRequest req) {
		String actdnum = req.getParameter("actdnum");
		HttpSession session = req.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		
		AuctionVO acvo = service.viewAuction(actdnum);
		CategoryVO cvo = service.getCategoryName(acvo.getActnum());
		
		String nowprice = "";
		
		// 입찰내역 중 최고 입찰금
		String tenderprice = service.getTender(acvo.getActnum());
		System.out.println("시작가격 : " + acvo.getStartprice() + "원");
		// 입찰 수
		int count = service.getTenderCount(acvo.getActnum());
		if (tenderprice == null || count == 0) {
			// 입찰금이 없거나 입찰 수가 없는 경우라면 현재가는 시작가(고정가)로 시작한다.
			nowprice = acvo.getStartprice();
		}
		else {
			// 입찰금이 있거나 입찰내역이 있는 경우 최고 입찰금을 현재가로 지정한다.  
			nowprice = tenderprice;
		}
		int pr1 = Integer.parseInt(nowprice);
		int pr2 = Integer.parseInt(acvo.getActd_price());
		req.setAttribute("acvo", acvo);
		req.setAttribute("cvo", cvo);
		req.setAttribute("nowprice", nowprice);
		System.out.println("nowprice : " + nowprice + "원");
		req.setAttribute("count", count);
		req.setAttribute("pr1", pr1);
		req.setAttribute("pr2", pr2);
		
		return "auction/auctionDetail.tiles";
	}
	
	// 입찰 시작
	@RequestMapping(value="/tender.action", method={RequestMethod.POST})
	public String tender(HttpServletRequest req) {
		HttpSession session = req.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		String actnum = req.getParameter("actnum");
		String actname = req.getParameter("actname");
		String actd_endday = req.getParameter("actd_endday");
		String actd_qty = req.getParameter("actd_qty");
		String startprice = req.getParameter("startprice");
		String actd_price = req.getParameter("actd_price");
		String nowprice = req.getParameter("nowprice");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("actnum", actnum);
		map.put("actname", actname);
		map.put("actd_endday", actd_endday);
		map.put("actd_qty", actd_qty);
		map.put("startprice", startprice);
		map.put("actd_price", actd_price);
		
		
		
		System.out.println("BuyListController.java 상품명 : " + actname);
		if (loginuser == null) {
			req.setAttribute("msg", "로그인을 먼저 하십시오!");
			req.setAttribute("loc", "login.action");
			return "msg.notiles";
		}
		else {
			req.setAttribute("map", map);
			req.setAttribute("nowprice", nowprice);
			return "tender.notiles";
		}
	}
	
	// 입찰하기 끝
	@RequestMapping(value="/inputTender.action", method={RequestMethod.POST})
	public String inputTender(HttpServletRequest req) {
		HttpSession session = req.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		if (loginuser == null) {
			req.setAttribute("msg", "로그인을 먼저 하십시오!");
			req.setAttribute("loc", "login.action");
			return "msg.notiles";
		}
		else {
			String actnum = req.getParameter("actnum");
			System.out.println("actnum : " + actnum);
			String tenderprice = req.getParameter("tenderprice");
			System.out.println("tenderprice : " + tenderprice);
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("actnum", actnum);
			map.put("usernum", loginuser.getUsernum());
			map.put("tenderprice", tenderprice);
			
			
			// 경매 입찰
			int result = service.inputTender(map);
			if (result > 0) {
				req.setAttribute("msg", "경매 입찰 성공!!");
				req.setAttribute("loc", "javascript:opener.location.reload(); self.close();");
			}
			else {
				req.setAttribute("msg", "경매 입찰 실패!!");
				req.setAttribute("loc", "javascript:opener.location.reload(); self.close();");
			}
			return "msg.notiles";
		}
	}
	
	// 낙찰(현재날짜와 경매종료날짜가 같을 경우)
	@RequestMapping(value="/inputAward.action", method={RequestMethod.POST})
	public void inputAward(HttpServletRequest req) {
		String actnum = req.getParameter("actnum");
		String actdnum = req.getParameter("actdnum");
		String nowprice = req.getParameter("nowprice");
		System.out.println("받아온 값들 : " +actnum+ ", " +actdnum+ ", " + nowprice);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("actnum", actnum);
		map.put("actdnum", actdnum);
		map.put("nowprice", nowprice);
		// 입찰 내역을 조회하여 가장 높은 입찰가격의 회원번호와 경매번호와 낙찰가격(최상 입찰가)을 가져온다.
		JoinaclistVO jvo = service.searchTender(map);
		int award1 = 0;
		int award2 = 0;
		System.out.println("jvo : " + jvo);
		if (jvo != null) {
			map.put("fk_usernum", jvo.getFk_usernum());
			map.put("tenderprice", jvo.getTenderprice());
			award1 = service.inputAward(map);
			System.out.println("award1 : " + award1);
			if (award1 > 0) {
				award2 = service.updateAD(map);
				System.out.println("award2 : " + award2);
			}
		}
	}
}