package com.finalc.auction;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.finalc.auction.common.MyUtil;
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
		System.out.println("1. loginuser : " + loginuser);
		session.setAttribute("loginuser", loginuser);
				
		if (loginuser == null) {
			req.setAttribute("msg", "로그인을 먼저 하십시오!");
			req.setAttribute("loc", "login.action");
			return "msg.notiles";
		} 
		
		else {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("usernum", loginuser.getUsernum());
			// ===== #110. 페이징 처리 하기 =====
			String str_currentShowPageNo = req.getParameter("currentShowPageNo"); 
			
			int totalCount = 0;         // 총게시물건수
			int sizePerPage = 1;        // 한 페이지당 보여줄 게시물 건수 
			int currentShowPageNo = 0;  // 현재 보여주는 페이지 번호로서, 초기치로는 1페이지로 설정함.
			int totalPage = 0;          // 총페이지수 (웹브라우저상에 보여줄 총 페이지 갯수)
			
			int startRno = 0;           // 시작행 번호
			int endRno = 0;             // 끝행 번호
			
			int blockSize = 1;         // "페이지바" 에 보여줄 페이지의 갯수 
			
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
			System.out.println("4. Controller 단 buyMapList : " + buyMapList);
			req.setAttribute("buyMapList", buyMapList);
			req.setAttribute("pagebar", pagebar);
			req.setAttribute("startRno", startRno);
			req.setAttribute("endRno", endRno);
			req.setAttribute("currentShowPageNo", currentShowPageNo);
			
			return "buy/buyList.tiles";
		}
		
	}
}
