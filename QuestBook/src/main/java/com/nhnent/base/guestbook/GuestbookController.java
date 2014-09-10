package com.nhnent.base.guestbook;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/")
public class GuestbookController {
	@Autowired
    private GuestbookService guestbookService;
 
    @RequestMapping(value = "/list")
    public String list(ModelMap model) throws Exception {
        List<GuestbookVO> list = this.guestbookService.getAll();
        
        for (GuestbookVO guestbookVO : list) {
        	String cdate = guestbookVO.getCdate();
        	SimpleDateFormat from = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        	SimpleDateFormat to = new SimpleDateFormat("yyyy/MM/dd");
        	
        	guestbookVO.setCdate(to.format(from.parse(cdate)));
		}
        
        model.addAttribute("list", list);
 
        return "guestbook/list";
    }
    
    @RequestMapping(value = "/form")
    public String form(@RequestParam(value = "articleId", required = false, defaultValue="0") int articleId,
    		@RequestParam(value = "pwdInput", defaultValue = "") String pwdInput,
                       ModelMap model) throws Exception {
        GuestbookVO guestbookVO = null;
 
        if (articleId > 0) {
        	guestbookVO = this.guestbookService.get(articleId);
        	
        	guestbookVO.setContent(guestbookVO.getContent().replace("<br/>", "\n"));
        	
        	if(guestbookVO.getPwd().equals(pwdInput)) {
        		model.addAttribute("commandUrl", "editsave");
        	} else {
            	model.addAttribute("message",
        				"<script>alert('Error: 비밀번호가 틀립니다. 다시 입력해주세요.');history.back(-1)</script>");
        		return "guestbook/error";
        	}
        } else {
            model.addAttribute("commandUrl", "addsave");
        }
 
        model.addAttribute("result", guestbookVO);
    	
        return "guestbook/write";
    }
    
    @RequestMapping(value = "/addsave", method = RequestMethod.POST)
    public String add(@ModelAttribute("guestbookVO") @Valid GuestbookVO guestbookVO,
    		ModelMap model) {
    	
    	guestbookVO.setContent(guestbookVO.getContent().replace("\n", "<br/>"));
        this.guestbookService.add(guestbookVO);
 
        return "redirect:list";
    }

    @RequestMapping(value = "/editsave", method = RequestMethod.POST)
    public String update(@ModelAttribute("guestbookVO") @Valid GuestbookVO guestbookVO,
    		ModelMap model) {
    	
    	guestbookVO.setContent(guestbookVO.getContent().replace("\n", "<br/>"));
        this.guestbookService.update(guestbookVO);
        return "redirect:list";
    }
    
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String update(@RequestParam(value = "articleId", required = false) int articleId,
    		@RequestParam(value = "pwdInput") String pwdInput,
    		ModelMap model) {
    	
    	GuestbookVO guestbookVO = null;
    	guestbookVO = this.guestbookService.get(articleId);
    	if(guestbookVO.getPwd().equals(pwdInput)) {
    		this.guestbookService.delete(articleId);
            return "redirect:list";
    	}
     
    	model.addAttribute("message",
				"<script>alert('Error: 비밀번호가 틀립니다. 다시 입력해주세요.');history.back(-1)</script>");
		return "guestbook/error";
    }

    @RequestMapping(value = "/edit")
    public String confirm1(
    		@RequestParam(value = "articleId", required = false, defaultValue="0") int articleId,
    		@RequestParam(value = "commandUrl") String commandUrl,
                       ModelMap model) throws Exception {
        if(articleId <= 0) {
        	model.addAttribute("message",
    				"<script>alert('Error: 유효한 요청이 아닙니다.');history.back(-1)</script>");
    		return "guestbook/error";
        }
        
        model.addAttribute("articleId", articleId);
        model.addAttribute("commandUrl", commandUrl);
     
    	return "guestbook/edit";
    }
    
    @RequestMapping(value = "/confirm2")
    public String confirm2(
    		@RequestParam(value = "articleId", required = false, defaultValue="0") int articleId,
    		@RequestParam(value = "commandUrl") String commandUrl,
    		@RequestParam(value = "pwdInput") String pwdInput,
                       ModelMap model) throws Exception {
        if(articleId <= 0) {
        	model.addAttribute("message",
    				"<script>alert('Error: 유효한 요청이 아닙니다.');history.back(-1)</script>");
    		return "guestbook/error";
        }
        
    	GuestbookVO guestbookVO = null;
    	guestbookVO = this.guestbookService.get(articleId);
    	if(guestbookVO.getPwd().equals(pwdInput)) {
    		if(commandUrl.equals("editsave")) {
    			model.addAttribute("commandUrl", "editsave");
    			model.addAttribute("result", guestbookVO);
    			return "guestbook/write";
    		} else if(commandUrl.equals("delete")) {
    			model.addAttribute("articleId", articleId);
    			return "redirect:delete";
    		}
    	}
     
    	model.addAttribute("message",
				"<script>alert('Error: 비밀번호가 틀립니다. 다시 입력해주세요.');history.back(-1)</script>");
		return "guestbook/error";
    }
}
