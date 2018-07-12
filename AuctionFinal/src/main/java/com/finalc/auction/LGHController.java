package com.finalc.auction;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.finalc.auction.model.HugiBoardVO;
import com.finalc.auction.model.MemberVO;
import com.finalc.auction.service.InterLGHService;

@Controller
public class LGHController {
	@Autowired
	private InterLGHService service;
	

	@RequestMapping(value="/admin/memberList.action", method={RequestMethod.GET})
	public String memberList(HttpServletRequest req) {
		List<MemberVO> memberList = service.getMemberList();
		
		List<HashMap<String, String>> awardList = service.getAwardList();
		
		req.setAttribute("awardList", awardList);
		
		req.setAttribute("memberList", memberList);
		return "management/memberList.admin";
	}
	
	@RequestMapping(value="/admin/awardList.action", method={RequestMethod.GET})
	public String awardList(HttpServletRequest req) {
		List<HashMap<String, String>> awardList = service.getAwardList();
		
		req.setAttribute("awardList", awardList);
		
		return "management/awardList.admin";
	}
	
	@RequestMapping(value="/admin/hugiList.action", method={RequestMethod.GET})
	public String hugiList(HttpServletRequest req) {
		List<HugiBoardVO> hugiList = service.getHugiList();
		
		req.setAttribute("hugiList", hugiList);
		
		return "management/hugiList.admin";
	}
	
	@RequestMapping(value="/admin/hugiDel.action", method={RequestMethod.GET})
	public String hugiDel(HttpServletRequest req) {
		String ep_boardno = req.getParameter("ep_boardno");
		int n = service.hugiDel(ep_boardno);
		String msg = "";
		String loc = "";
		if(n == 1) {
			msg = "삭제완료";
			loc = "/auction/admin/hugiList.action";
		}
		else {
			msg = "삭제 실패";
			loc = "/auction/admin/hugiList.action";
		}
		
		req.setAttribute("msg", msg);
		req.setAttribute("loc", loc);
		
		return "msg.notiles";
	}
	
	@RequestMapping(value="/admin/hugiRecover.action", method={RequestMethod.GET})
	public String hugiRecover(HttpServletRequest req) {
		String ep_boardno = req.getParameter("ep_boardno");
		int n = service.hugiRecover(ep_boardno);
		String msg = "";
		String loc = "";
		if(n == 1) {
			msg = "복구 완료";
			loc = "/auction/admin/hugiList.action";
		}
		else {
			msg = "복구 실패";
			loc = "/auction/admin/hugiList.action";
		}
		
		req.setAttribute("msg", msg);
		req.setAttribute("loc", loc);
		
		return "msg.notiles";
	}
	
	
	@RequestMapping(value="/admin/deliverSet.action", method={RequestMethod.GET})
	public String deliverSet(HttpServletRequest req) {
		int length = Integer.parseInt(req.getParameter("length"));
		HashMap<String, String> map = new HashMap<String, String>();
		for(int i=1; i<length+1; i++) {
			map.put("awardnum"+i, req.getParameter("awardnum"+i));
			map.put("deliverstatus"+i, req.getParameter("deliverstatus"+i));
		}
		
		int n = service.deliverSet(map);
		
		String msg = "";
		String loc = "";
		if(n == 1) {
			msg = "변경 완료";
			loc = "/auction/admin/awardList.action";
		}
		else {
			msg = "변경 실패";
			loc = "/auction/admin/awardList.action";
		}
		
		req.setAttribute("msg", msg);
		req.setAttribute("loc", loc);
		
		return "msg.notiles";
	}
}
