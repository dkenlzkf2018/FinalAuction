package com.finalc.auction;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.finalc.auction.common.FileManager;
import com.finalc.auction.model.AuctionVO;
import com.finalc.auction.model.CategoryVO;
import com.finalc.auction.model.HugiBoardVO;
import com.finalc.auction.service.InterBoardService;
import com.finalc.auction.service.InterAuctionService;

@Controller
@Component
public class AuctionController {

	// 경매 컨트롤러 (InterBoardService)
	@Autowired
	private InterBoardService service;
	// 경매 컨트롤러 (InterAuctionService)
	@Autowired
	private InterAuctionService serviceA;
	
	@Autowired 
	private FileManager fileManager;
	
/*	// 메인 페이지
	@RequestMapping(value="/index.action", method={RequestMethod.GET})  
	public String index(HttpServletRequest req) {

		return "main/index.tiles";
	}*/
	
	// 옥션 상품 게시 기능 (0704)
	@RequestMapping(value="/AuctionUpload.action", method={RequestMethod.GET})  
	public String auctionLogin_AuctionUpload(HttpServletRequest req, HttpServletResponse res) {
		
		return "auction/AddAuction.tiles";
	} // 옥션 상품 게시 기능
	
	// 옥션 상품 게시 완료 기능 (0709)
	@RequestMapping(value="/AuctionUploadEnd.action", method={RequestMethod.POST})  
	public String AuctionUploadEnd(HttpServletRequest req, HttpSession session, AuctionVO auctionVO) {
		
		//______________________________________첨부파일이 있는경우 파일업로드 하기 시작_______________________________________//
		if(!auctionVO.getAttach().isEmpty()) {
			// 이미지가 비어있지 않다면(첨부파일이 있는 경우라면)
			
			// WAS의 webapp의 절대경로를 알아야 한다.
			String root = session.getServletContext().getRealPath("/");
			String path = root + "resources" + File.separator + "actimages";
			
			System.out.println(">> 확인용 rood : "+ root);
			String newFileName = "";
			// WAS 디스크에 저장할 파일명
			
			byte[] bytes = null;
			// 첨부파일을 WAS 디스크에 저장할 때 사용되는 용도
			long fileSize = 0;
			// 파일 크기를 읽어오는 용도
			
			try {
				bytes = auctionVO.getAttach().getBytes();
				// getBytes() = 첨부됨 파일을 바이트 단위로 읽어온다.
				System.out.println(">> 확인용 bytes : "+bytes);
				
				newFileName = fileManager.doFileUpload(bytes, auctionVO.getAttach().getOriginalFilename(), path);
				// 파일 업로드 후, 현재시간 + 나노시 형식의 파일명을 리턴하여 newFileName으로 저장
				auctionVO.setActimage(newFileName);
				auctionVO.setFilename(newFileName);
				
				auctionVO.setOrgFilename(auctionVO.getAttach().getOriginalFilename());
				// auctionVO.getActimage().getOriginalFilename() 는 실제 파일명
				// 다운로드시 입력되는 파일명.
				fileSize = auctionVO.getAttach().getSize();
				auctionVO.setFileSize(String.valueOf(fileSize));
			} catch (Exception e) {
				
			}
		}
		//______________________________________첨부파일이 있는경우 파일업로드 하기 끝_______________________________________//
		
		int n = 0;
		System.out.println(">> 확인용 n1 : "+n);
		if(auctionVO.getAttach().isEmpty()) {
			// 파일 첨부가 없으면
			n = serviceA.add_auction(auctionVO);
			System.out.println(">> 확인용 n2 : "+ n);
		}
		else {
			n = serviceA.add_auctionWithFile(auctionVO);
			System.out.println(">> 확인용 n3 : "+ n);
		}
		
		String msg = "", loc = "";
		if(n == 1) {
			msg = "경매 등록 완료";
			loc = "index.action";
		}
		else {
			msg = "경매 등록 실패";
			loc = "index.action";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("loc", loc);
		
		return "msg.notiles";
	} // 옥션 상품 게시 완료 기능 (0709)
	
	@RequestMapping(value="/auctionDetail.action", method={RequestMethod.GET})  
	public String review(HttpServletRequest req) {
		String actdnum = req.getParameter("actdnum");
		
		List<HugiBoardVO> hugiBoardList = service.getReviewByActdnum(actdnum);
		
		req.setAttribute("hugiBoardList", hugiBoardList);
		req.setAttribute("actdnum", actdnum);
		
		return "auction/auctionDetail.tiles";
	}
	
	@RequestMapping(value="/reviewRegist.action", method={RequestMethod.GET})  
	public String auctionLogin_reviewRegist(HttpServletRequest req, HttpServletResponse res) {
		String actdnum = req.getParameter("actdnum");
		String fk_userid = req.getParameter("fk_userid");
		String ep_content = req.getParameter("ep_content");
		String ep_satisfaction = req.getParameter("ep_satisfaction");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("actdnum", actdnum);
		map.put("fk_userid", fk_userid);
		map.put("ep_content", ep_content);
		map.put("ep_satisfaction", ep_satisfaction);
		
		int n = service.reviewRegist(map);
		
		List<HugiBoardVO> hugiBoardList = service.getReviewByActdnum(actdnum);
		
		String msg = "", loc = "";
		if(n == 1) {
			msg = "댓글 등록 완료";
			loc = "auctionDetail.action?actdnum="+actdnum+"&hugiBoardList="+hugiBoardList;
		}
		else {
			msg = "댓글 등록 실패";
			loc = "auctionDetail.action?actdnum="+actdnum+"&hugiBoardList="+hugiBoardList;
		}
		req.setAttribute("msg", msg);
		req.setAttribute("loc", loc);
		
		return "msg.notiles";
	}
	
	// 경매상품 리스트를 보여주는 컨트롤단
	@RequestMapping(value="/AuctionShow.action", method={RequestMethod.GET})  
	public String ShowAuction(HttpServletRequest req, HttpServletResponse res) {
		
	//	String cdnum = req.getParameter("cdnum");
		
		String actnum = req.getParameter("actnum");
		String actdnum = req.getParameter("actdnum");
		String fk_cdnum = req.getParameter("fk_cdnum");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("actnum", actnum);
		map.put("actdnum", actdnum);
		map.put("fk_cdnum", fk_cdnum);
	//	map.put("cdnum", cdnum);
		
		int totalCnt = serviceA.ShowAuction(map);
		
		List<AuctionVO> auctionList = serviceA.getAuctionList(fk_cdnum);
		
		req.setAttribute("totalCnt", totalCnt);
		req.setAttribute("fk_cdnum", fk_cdnum);
		req.setAttribute("auctionList", auctionList);
	//	req.setAttribute("cdnum", cdnum);

		return "auction/AuctionShow.tiles";
	}
	
	// 날씨 정보 단
/*	@RequestMapping(value="/AuctionWeath.action", method={RequestMethod.GET})  
	public String WeathAuction(HttpServletRequest req, HttpServletResponse res) {
	
		String Weather = req.getParameter(name);
		
		
	}*/
}
