//�������� ��Ʈ�ѷ�
package com.cl.controller.admin;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cl.dto.NoticeDTO;
import com.cl.service.INoticeService;
import com.cl.util.CmmUtil;
import com.cl.util.PageUtil;
import com.cl.util.SessionUtil;

@Controller
public class NoticeController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="NoticeService")
	private INoticeService noticeService;
	
	@RequestMapping("/Lmin/notice/noticeList")
	public String noticeList(HttpServletRequest req, Model model, HttpServletResponse resp, HttpSession session) throws Exception{
		log.info("Lmin:noticeList Start!!");
		SessionUtil.sessionCheck(resp, session);
		int splitPage = 10;
	
		HashMap<String, Object> hMap = new HashMap<>();
		
		hMap = PageUtil.paging(req, splitPage);
		
		hMap = noticeService.getNoticeList(hMap);
		
		model.addAttribute("hMap", hMap);
		
		log.info("Lmin:noticeList End!!");
		return "/Lmin/notice/notice_list";
	}
	@RequestMapping("/Lmin/notice/noticeWrite")
	public String noticeWrite(HttpServletResponse resp, HttpSession session)throws Exception{
		log.info("Lmin:noticeWrite Start!!");
		SessionUtil.sessionCheck(resp, session);
		log.info("Lmin:noticeWrite End!!");
		return "/Lmin/notice/notice_write";
	}
	@RequestMapping("/Lmin/notice/noticeRegProc")
	public String noticeRegProc(HttpServletRequest req, Model model, HttpSession session, HttpServletResponse resp) throws Exception{
		log.info("Lmin:noticeRegProc Start!!");
		SessionUtil.sessionCheck(resp, session);
		String url = "";
		String msg = "";
		String title = CmmUtil.nvl(req.getParameter("title"));
		String contents = CmmUtil.nvl(req.getParameter("contents"));
		String regMemberNo = CmmUtil.nvl((String) session.getAttribute("ss_member_no"));
		
		log.info("title : "+title);
		log.info("contents : "+contents);
		log.info("regMemberNo : "+regMemberNo);
		
		NoticeDTO nDTO = new NoticeDTO();
		
		nDTO.setNoticeTitle(title);
		nDTO.setNoticeContents(contents);
		nDTO.setRegMemberNo(regMemberNo);
		
		int result = noticeService.insertNotice(nDTO);
		
		url = "/Lmin/notice/noticeList.do";
		if(result==0){
			msg = "공지사항 등록에 실패했습니다.";
		}else{
			msg = "공지사항 등록에 성공했습니다.";
		}
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		
		url = null;
		msg = null;
		title = null;
		contents = null;
		regMemberNo = null;
		nDTO = null;
		
		log.info("Lmin:noticeRegProc End!!");
		return "/alert";
	}
	
	@RequestMapping("/Lmin/notice/noticeDetail")
	public String noticeDetail(HttpServletRequest req, Model model, HttpServletResponse resp, HttpSession session) throws Exception{
		log.info("Lmin:noticeDetail Start!!");
		SessionUtil.sessionCheck(resp, session);
		String noticeNo = CmmUtil.nvl(req.getParameter("nNo"));
		log.info("noticeNo : "+noticeNo);
		
		NoticeDTO nDTO = new NoticeDTO();
		nDTO.setNoticeNo(noticeNo);
		
		nDTO = noticeService.getNoticeDetail(nDTO);
		
		model.addAttribute("nDTO", nDTO);
		
		nDTO = null;
		noticeNo = null;
		log.info("Lmin:noticeDetail End!!");
		return "/Lmin/notice/notice_view";
	}
	@RequestMapping("/Lmin/notice/noticeUpdate")
	public String noticeUpdate(HttpServletRequest req, Model model, HttpServletResponse resp, HttpSession session) throws Exception{
		log.info("Lmin:noticeUpdate Start!!");
		SessionUtil.sessionCheck(resp, session);
		String noticeNo = CmmUtil.nvl(req.getParameter("nNo"));
		log.info("noticeNo : "+noticeNo);
		
		NoticeDTO nDTO = new NoticeDTO();
		
		nDTO.setNoticeNo(noticeNo);
		
		nDTO = noticeService.getNoticeDetail(nDTO);
		
		model.addAttribute("nDTO", nDTO);

		nDTO = null;
		noticeNo = null;

		log.info("Lmin:noticeUpdate End!!");
		return "/Lmin/notice/notice_update";
	}
	@RequestMapping("/Lmin/notice/noticeUpdateProc")
	public String noticeUpdateProc(HttpServletRequest req, Model model, HttpSession session, HttpServletResponse resp) throws Exception{
		log.info("Lmin:noticeUpdateProc Start!!");
		SessionUtil.sessionCheck(resp, session);
		String url = "";
		String msg = "";
		String noticeNo = CmmUtil.nvl(req.getParameter("nNo"));
		String noticeTitle = CmmUtil.nvl(req.getParameter("title"));
		String noticeContents = CmmUtil.nvl(req.getParameter("contents"));
		String chgMemberNo = CmmUtil.nvl((String) session.getAttribute("ss_member_no"));
		
		log.info("noticeNo : "+noticeNo);
		log.info("noticeTitle : "+noticeTitle);
		log.info("noticeContents : "+noticeContents);
		
		NoticeDTO nDTO = new NoticeDTO();
		nDTO.setNoticeNo(noticeNo);
		nDTO.setNoticeTitle(noticeTitle);
		nDTO.setNoticeContents(noticeContents);
		nDTO.setChgMemberNo(chgMemberNo);
		
		int result = noticeService.updateNoticeDetail(nDTO);
		
		url = "/Lmin/notice/noticeList.do";
		if(result==0){
			msg = "공지사항 수정에 실패했습니다.";
		}else{
			msg = "공지사항 수정에 성공했습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		msg = null;
		url = null;
		noticeNo = null;
		noticeTitle = null;
		noticeContents = null;
		chgMemberNo = null;
		nDTO = null;
		log.info("Lmin:noticeUpdateProc End!!");
		return "/alert";
	}
	
	@RequestMapping("/Lmin/notice/noticeDeleteProc")
	public String noticeDeleteProc(HttpServletRequest req, Model model, HttpServletResponse resp, HttpSession session) throws Exception{
		log.info("Lmin:noticeDeleteProc Start!!");
		SessionUtil.sessionCheck(resp, session);
		String url = "";
		String msg = "";
		String noticeNo = CmmUtil.nvl(req.getParameter("nNo"));
		
		int result = noticeService.deleteNotice(noticeNo);
		
		if(result == 0){
			msg = "공지사항 삭제에 실패했습니다.";
		}else{
			msg = "공지사항 삭제에 성공했습니다.";
		}
		url = "/Lmin/notice/noticeList.do";
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		
		url = null;
		msg = null;
		noticeNo = null;
		
		log.info("Lmin:noticeDeleteProc End!!");
		return "/alert";
	}

}
