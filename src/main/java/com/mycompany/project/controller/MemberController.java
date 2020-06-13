package com.mycompany.project.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.project.common.Key;
import com.mycompany.project.model.Member;
import com.mycompany.project.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	private static final Logger LOGGER = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	MemberService memberService;
	@Autowired
	JavaMailSender sender;

	@RequestMapping("/ajax_login.do")
	public void ajax_login(String mid, String mpassword, HttpServletResponse response, HttpSession session)
			throws Exception {
		LOGGER.info("실행");
		// nullpointer 주의

		Member member = memberService.selectByMid(mid);
		String result = null;
		if(member != null) {
			LOGGER.info("mid:{}", member.getMid());
			
			if (member != null) {
				if (mid.equals(member.getMid())) {
					if (mpassword.equals(member.getMpassword())) {
						session.setAttribute("sessionMid", mid);
						result = "success";
					} else {
						result = "wrongMpassword";
					}
				}
			} else {
				result = "wrongMid";
			}
		} else {
			result = "wrongMid";
		}
		
		response.setContentType("application/json; charset=UTF-8");
		JSONObject jObj = new JSONObject();
		jObj.put("check", result);
		String message = jObj.toString();
		PrintWriter pw = response.getWriter();
		pw.write(message);
		pw.flush();
		pw.close();
	}

	@RequestMapping("/ajax_logout.do")
	public void ajax_logout(HttpServletResponse response, HttpSession session) throws Exception {
		LOGGER.info("실행");

		session.invalidate();

		response.setContentType("application/json; charset=UTF-8");
		JSONObject jObj = new JSONObject();
		jObj.put("check", "ok");
		String message = jObj.toString();
		PrintWriter pw = response.getWriter();
		pw.write(message);
		pw.flush();
		pw.close();
	}

	@GetMapping("/joinStep1.do")
	public String join() {
		LOGGER.info("실행");
		return "member/joinStep1";
	}

	@PostMapping("/joinStep1.do")
	public String joinStep2Form(String result, String result2, String result3, HttpServletResponse response) {
		LOGGER.info("실행");
		response.setContentType("text/html; charset=UTF-8");
		
		if (result == null || result2 == null || result3 == null) {
			
			try {
				PrintWriter message;
				message = response.getWriter();
				message.println(
						"<script>window.alert(please check in agreement box); </script>");
				message.flush();
			} catch (IOException e) {

				e.printStackTrace();
			}
			return "redirect:/member/joinStep1.do";
		} else {
			if (result.equals("agree") && result2.equals("agree") && result3.equals("agree")) {
				return "member/joinStep2Form";
			}
			try {
				PrintWriter message;
				message = response.getWriter();
				message.println(
						"<script>window.alert(모두 동의에 체크해 주세요); </script>");
				message.flush();
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "redirect:/member/joinStep1.do";
		}
	}

	@PostMapping("/joinStep2.do")
	public String joinStep2(Member member, String num1, String num2, HttpSession session, HttpServletResponse response) {
		LOGGER.info("실행");
		member.setMbirth(num1 + "-" + num2);

		memberService.insert(member);
		session.removeAttribute("mkey");
		session.removeAttribute("memail");
		session.removeAttribute("check");
		
		response.setContentType("text/html; charset=UTF-8");
		try {
			PrintWriter message = response.getWriter();
			message.println("<script>window.alert(success! login please!); </script>");
			message.flush();
			return "redirect:/home/main.do";
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/home/main.do";
	}

	@RequestMapping("/joinCheck.do")
	public void joinCheck(String mid, HttpServletResponse response) throws Exception {
		LOGGER.info("실행");
		Member member = memberService.selectByMid(mid);
		String result = "ok";
		if (member == null) {
			result = "fail";
		}
		response.setContentType("application/json; charset=UTF-8");
		JSONObject jobj = new JSONObject();
		jobj.put("result", result);
		String message = jobj.toString();
		PrintWriter pw = response.getWriter();
		pw.write(message);
		pw.flush();
		pw.close();
	}

	@GetMapping("/mypage.do")
	public String mypage(String mid) throws Exception {
		LOGGER.info("실행");
		// 주문 내역
		// 장바구니
		// 정보 수정
		//
		return "member/mypage";
	}

	@GetMapping("/update.do")
	public String updateForm(Member member, Model model, String mid) {
		LOGGER.info("실행");
		member = memberService.selectByMid(mid);

		model.addAttribute("member", member);

		return "member/updateForm";
	}

	@PostMapping("/update.do")
	public String update(Member member) {
		LOGGER.info("실행");
		LOGGER.info(member.getMid());
		LOGGER.info(member.getMpassword());
		LOGGER.info(member.getMemail());
		LOGGER.info(member.getMtel());
		LOGGER.info(member.getMname());
		LOGGER.info(member.getMbirth());
		memberService.update(member);

		return "redirect:/home/main.do";
	}

	@GetMapping("/delete.do")
	public String deleteForm(Model model, String mid) {
		LOGGER.info("실행");
		Member member = memberService.selectByMid(mid);

		model.addAttribute("member", member);

		return "member/deleteForm";
	}

	@PostMapping("/delete.do")
	public String delete(Member member, HttpSession session) {
		LOGGER.info("실행");
		LOGGER.info(member.getMid());
		LOGGER.info(member.getMpassword());
		LOGGER.info(member.getMemail());
		LOGGER.info(member.getMtel());
		LOGGER.info(member.getMname());
		LOGGER.info(member.getMbirth());

		memberService.deleteByMid(member.getMid());
		session.invalidate();

		return "redirect:/home/main.do";
	}

	// -------------------회원가입 키
	// 받기-----------------------------------------------------------------------------

	@GetMapping("/emailcheck.do")
	public String emailcheckForm() {
		LOGGER.info("실행");

		return "member/emailcheck";
	}

	@PostMapping("/emailCheck.do")
	@ResponseBody
	public void emailCheckSend(@RequestParam String memail, HttpServletResponse response, HttpSession session) {
		// 이상한 메일 보내서 확인하기
		if (memail != null) {
			Member member = memberService.selectByMemail(memail);
			if (member == null) {
				System.out.println(memail);
				String setfrom = "leejeongmin79@gmail.com";
				String key = new Key().getKey(10, false);

				String tomail = memail; // 받는 사람 이메일
				String title = "M3 이메일 인증입니다.";
				String content = new StringBuffer().append("제공되는 키를 입력해주세요 키값은 : ").append(key).append(" 입니다.")
						.toString();

				try {

					response.setContentType("UTF-8");

					PrintWriter writer = response.getWriter();

					writer.print(key);
					MimeMessage message = sender.createMimeMessage();
					MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
					// 보내는사람 생략하거나 하면 정상작동을 안함 두번째 인자값은 보낼때의 이름이다.
					messageHelper.setFrom(setfrom, "M3.com");
					// 받는사람 이메일
					messageHelper.setTo(tomail); 
					// 메일제목은 생략이 가능하다
					messageHelper.setSubject(title); 
					messageHelper.setText(content); // 메일 내용

					sender.send(message);
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out_email = response.getWriter();
					out_email.println(
							"<script>alert('please check your email box. Press Key Button on the form for next step.'); opener.parent.window.location.reload(); self.close();</script>");
					out_email.flush();
					session.setAttribute("mkey", key);
					session.setAttribute("memail", memail);

				} catch (Exception e) {
					System.out.println(e);
				}
			} else {
				PrintWriter out_email;
				try {
					out_email = response.getWriter();
					out_email.println(
							"<script>alert('someone has same email. Try again with different email'); opener.parent.window.location.reload();self.close();</script>");
					out_email.flush();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
		}

	}

	@GetMapping("/emailKey.do")
	public String emailKey() {
		LOGGER.info("실행");

		return "member/emailKey";
	}

	@PostMapping("/emailKey.do")
	public void emailKey(Model model, String mkey, HttpServletResponse response, HttpSession session) {
		LOGGER.info("실행");
		LOGGER.info("mkey:{}", session.getAttribute("mkey"));
		if (mkey != null) {
			if (mkey.equals(session.getAttribute("mkey"))) {
				PrintWriter out_email;
				try {
					session.setAttribute("check", "agree");
					out_email = response.getWriter();
					out_email.println(
							"<script>alert('success'); opener.parent.window.location.reload(); self.close(); </script>");
					out_email.flush();

				} catch (IOException e) {
					// TODO Auto-generated catch block
					try {
						out_email = response.getWriter();
						out_email.println(
								"<script>alert('KEY is a little bit different. please check again'); opener.parent.window.location.reload();self.close(); </script>");
						out_email.flush();
					} catch (IOException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}

					e.printStackTrace();
				}
			}

		} else {
			try {
				PrintWriter out_email = response.getWriter();
				out_email = response.getWriter();
				out_email.println(
						"<script>alert('insert again'); opener.parent.window.location.reload();self.close(); </script>");
				out_email.flush();
			} catch (IOException e) {

				e.printStackTrace();
			}
		}
	}

	// -------------------------------ID
	// 찾기------------------------------------------------------------------------------
	@GetMapping("/id.do")
	public String id(Model model) {
		LOGGER.info("실행");

		return "member/idForm";
	}

	@GetMapping("/idCheck.do")
	public String idCheck(Model model) {
		LOGGER.info("실행");

		return "member/idCheck";
	}

	@PostMapping("/idCheck.do")
	@ResponseBody
	public void idCheckemailSend(@RequestParam String memail, HttpServletResponse response, HttpSession session) {
		// 이상한 메일 보내서 확인하기
		Member member = memberService.selectByMemail(memail);
		if (member != null) {
			System.out.println(memail);
			String setfrom = "leejeongmin79@gmail.com";
			String key = member.getMid();

			String tomail = memail; // 받는 사람 이메일
			String title = "M3.com 이메일 인증입니다. ID를 전송합니다.";
			String content = new StringBuffer().append("본인의 아이디는 ").append(key).append(" 입니다.").toString();

			try {

				response.setContentType("UTF-8");

				PrintWriter writer = response.getWriter();

				writer.print(key);
				MimeMessage message = sender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				// 보내는사람 생략하거나 하면 정상작동을 안함 두번째 인자값은 보낼때의 이름이다.
				messageHelper.setFrom(setfrom, "M3.com"); 
				// 받는사람 이메일
				messageHelper.setTo(tomail); 
				// 메일제목은 생략이 가능하다
				messageHelper.setSubject(title); 
				messageHelper.setText(content); // 메일 내용

				sender.send(message);
				response.setContentType("text/html; charset=ISO-8859-1");
				PrintWriter out_email = response.getWriter();
				out_email.println(
						"<script>alert('please check your email box and go to next step');self.close(); </script>");
				out_email.flush();
			} catch (Exception e) {
				System.out.println(e);
			}
		} else {
			PrintWriter out_email;
			try {
				out_email = response.getWriter();
				out_email.println(
						"<script>alert('Email is not exist. Please Join again. Go to Join'); opener.parent.window.location.reload();self.close();</script>");
				out_email.flush();

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	// ------------------------------------------페스워드
	// 찾기---------------------------------------------------------------------------
	// 메인에서 요청
	@GetMapping("/password.do")
	public String passwordform(Model model) {
		LOGGER.info("실행");

		return "member/passwordForm";
	}

	// passwordForm에서 새 창
	@GetMapping("/emailcheckpass.do")
	public String emailcheckForm2() {
		LOGGER.info("실행");

		return "member/emailcheckpass";
	}

	@PostMapping("/emailcheckpass.do")
	@ResponseBody
	public void emailCheckSendForPass(@RequestParam String memail, HttpServletResponse response, HttpSession session) {
		// 이상한 메일 보내서 확인하기
		Member member = memberService.selectByMemail(memail);
		if (member != null) {
			System.out.println(memail);
			String setfrom = "leejeongmin79@gmail.com";
			String key = new Key().getKey(10, false);

			String tomail = memail; // 받는 사람 이메일
			String title = "M3.com 이메일 인증입니다.";
			String content = new StringBuffer().append("제공되는 키를 입력해주세요 키값은 : ").append(key).append(" 입니다.").toString();

			try {

				response.setContentType("UTF-8");

				PrintWriter writer = response.getWriter();

				writer.print(key);
				MimeMessage message = sender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

				messageHelper.setFrom(setfrom, "M3.com"); // 보내는사람 생략하거나 하면 정상작동을 안함 두번째 인자값은 보낼때의 이름이다.
				messageHelper.setTo(tomail); // 받는사람 이메일
				messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
				messageHelper.setText(content); // 메일 내용

				sender.send(message);
				response.setContentType("text/html; charset=ISO-8859-1");
				PrintWriter out_email = response.getWriter();
				out_email.println(
						"<script>alert('please check your email box and enterKey with using Key checking Button on the form for next step.');self.close(); </script>");
				out_email.flush();

				session.setAttribute("pmkey", key);
				session.setAttribute("pmemail", memail);

			} catch (Exception e) {
				System.out.println(e);
			}
		} else {
			PrintWriter out_email;
			try {
				out_email = response.getWriter();
				out_email.println(
						"<script>alert('Email is not same. Try gey email Key again'); opener.parent.window.location.reload();self.close();</script>");
				out_email.flush();

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}

	@GetMapping("/emailPkey.do")
	public String emailPkey() {
		LOGGER.info("실행");

		return "member/emailPkey";
	}

	// 비밀번호찾기
	@PostMapping("/emailPkey.do")
	public void emailPkey(Model model, String pmkey, HttpServletResponse response, HttpSession session) {
		LOGGER.info("실행");
		LOGGER.info("pmkey:{}", session.getAttribute("pmkey"));
		Member member = memberService.selectByMemail((String) session.getAttribute("pmemail"));
		LOGGER.info("member:{}", member);
		if (pmkey != null && member != null) {
			if (pmkey.equals(session.getAttribute("pmkey"))) {
				PrintWriter out_email;
				try {
					session.setAttribute("checkpass", "okay");
					session.setAttribute("pmid", member.getMid());
					out_email = response.getWriter();

					out_email.println("<script>alert('success');  self.close(); check=1; </script>");
					out_email.flush();

				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

		}
	}

	@PostMapping("/passwordChange.do")
	@ResponseBody
	public String passwordChange(Model model, HttpServletResponse response, HttpSession session) {
		LOGGER.info("실행");
		LOGGER.info("pmid:{}", session.getAttribute("pmid"));
		String pmid = (String) session.getAttribute("pmid");

		// 임시 비밀번호로 로그한 하라고 명령 (이메일 보내기)
		String memail = (String) session.getAttribute("pmemail");
		System.out.println(memail);

		String setfrom = "leejeongmin79@gmail.com";
		String key = new Key().getKey(10, false);
		// 임시 비밀번호 생성
		String key2 = key + "!@#12";
		String tomail = memail; // 받는 사람 이메일
		String title = "M3.com 임시 비밀번호";
		String content = new StringBuffer().append("제공되는 비밀번호를 사용하여 로그인 해주세요. 비밀번호 변경을 부탁드립니다. 임시 비밀번호는").append(key2)
				.append(" 입니다.").toString();

		// db 패스워드 업데이트
		memberService.updateBypmid(key2, pmid);
		try {

			response.setContentType("UTF-8");

			PrintWriter writer = response.getWriter();

			writer.print(key);
			MimeMessage message = sender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom, "M3.com"); // 보내는사람 생략하거나 하면 정상작동을 안함 두번째 인자값은 보낼때의 이름이다.
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			sender.send(message);
			response.setContentType("text/html; charset=ISO-8859-1");
			PrintWriter out_email = response.getWriter();
			out_email.println(
					"<script>alert('please check your email box. Press enter new temeparary password when you login'); opener.parent.window.location.reload();self.close();</script>");
			out_email.flush();
			session.removeAttribute("pmkey");
			session.removeAttribute("pmemail");
			session.removeAttribute("pmid");
			return "home/main";

		} catch (Exception e) {
			System.out.println(e);
		}
		return "home/main";

	}
}
