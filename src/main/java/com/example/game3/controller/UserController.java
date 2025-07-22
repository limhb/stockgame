package com.example.game3.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.game3.service.ScoreService;
import com.example.game3.service.UserService;
import com.example.game3.vo.ScoreVO;
import com.example.game3.vo.UserVO;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class UserController {
   @Autowired
   private UserService userService;
   
   @Autowired
   private ScoreService scoreService;
   
   @GetMapping("/user/list")
   public String getUsers(UserVO user, Model m) {
      List<UserVO> users = userService.getUsers(user);
      m.addAttribute("users",users);
      return "views/user/user-list";
   }
   
   @GetMapping("/user/login")
   public String loginForm() {
      return "views/user/login";
   }
   
   @PostMapping("/user/login")
   public String login(@ModelAttribute UserVO user, HttpSession session, Model m) {
      m.addAttribute("msg", "아이디 혹은 비밀번호를 확인해주세요.");
      m.addAttribute("url", "/user/login");
      
      UserVO loginUser = userService.login(user);
      if(loginUser != null) {
         session.setAttribute("user", loginUser);
         m.addAttribute("msg", loginUser.getUiName() + "님 반갑습니다.");
         m.addAttribute("url", "/");
      }
      return "views/common/msg";
   }
   
   @PostMapping("/user/logout")
   public String logout(HttpSession session, Model m) {
      session.invalidate();
      m.addAttribute("msg", "로그아웃 되었습니다.");
      m.addAttribute("url", "/");
      return "views/common/msg";
   }
   
   @GetMapping("/user/{uiNum}")
   public String getUser(Model m, @PathVariable("uiNum") int uiNum) {
      log.debug("uiNum=>{}", uiNum);
      UserVO user = userService.getUser(uiNum);
      m.addAttribute("user",user);
      return "views/user/user-view";
   }
   
   @GetMapping("/user/update/{uiNum}")
   public String getUserForUpdate(Model m, @PathVariable("uiNum") int uiNum) {
      UserVO user = userService.getUser(uiNum);
      m.addAttribute("user",user);
      return "views/user/user-update";
   }
   
   @PostMapping("/user/delete")
   @ResponseBody
   public Map<String, String> deleteUser(@RequestParam("uiNum") int uiNum) {
      int result = userService.deleteUser(uiNum);
      if (result == 1) {
         return Map.of(
            "status", "success",
            "message", "회원 탈퇴가 완료되었습니다."
         );
      }
      return Map.of(
         "status", "error",
         "message", "탈퇴 처리 중 오류가 발생했습니다."
      );
   }
   
   @GetMapping("/user")
   @ResponseBody
   public List<UserVO> getUsers(@ModelAttribute UserVO user){
      return userService.getUsers(user);
   }
   
   @PostMapping("/user")
   public String insertUser(@ModelAttribute UserVO user, Model m) {
      int result = userService.insertUser(user);
      if (result == 1) {
         m.addAttribute("msg", "회원가입이 완료되었습니다.");
         m.addAttribute("url", "/user/login");
      } else {
         m.addAttribute("msg", "회원가입에 실패했습니다.");
         m.addAttribute("url", "/views/user/join");
      }
      return "views/common/msg";
   }
   
   @PostMapping("/user/update")
   @ResponseBody
   public Map<String, String> updateUser(@RequestBody UserVO user) {
      int result = userService.updateUser(user);
      if(result == 1) {
         return Map.of(
            "status", "success",
            "message", "수정 성공"
         );
      }
      return Map.of(
         "status", "error",
         "message", "수정 실패"
      );
   }
   
   @GetMapping("/user/history")
   public String showHistory(HttpSession session, Model m) {
      UserVO user = (UserVO) session.getAttribute("user");
      if (user == null) {
         m.addAttribute("msg", "로그인이 필요합니다.");
         m.addAttribute("url", "/user/login");
         return "views/common/msg";
      }

      // 최고 점수 조회
      Integer highScore = scoreService.getUserHighScore(user.getUiNum());
      if (highScore == null) highScore = 0;

      // 전체 게임 기록 조회
      List<ScoreVO> scoreList = scoreService.getUserScores(user.getUiNum());
      int totalGames = scoreList.size();

      m.addAttribute("highScore", highScore);
      m.addAttribute("totalGames", totalGames);
      m.addAttribute("scoreList", scoreList);

      return "views/user/history";
   }

   // 비밀번호 확인 폼
   @GetMapping("/user/password-check")
   public String passwordCheckForm() {
      return "views/user/password-check";
   }

   // 비밀번호 확인 처리
   @PostMapping("/user/password-check")
   public String passwordCheck(@ModelAttribute UserVO inputUser, HttpSession session, Model m) {
      UserVO loginUser = (UserVO) session.getAttribute("user");
      if (loginUser == null) {
         m.addAttribute("msg", "로그인이 필요합니다.");
         m.addAttribute("url", "/user/login");
         return "views/common/msg";
      }

      inputUser.setUiId(loginUser.getUiId());
      UserVO result = userService.getUserByIdAndPwd(inputUser);
      if (result != null) {
         UserVO user = userService.getUser(loginUser.getUiNum());
         m.addAttribute("user", user);
         return "views/user/mypage-update";
      } else {
         m.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
         m.addAttribute("url", "/user/password-check");
         return "views/common/msg";
      }
   }

   // 마이페이지 수정 폼
   @GetMapping("/user/mypage-update")
   public String myPageUpdateForm(HttpSession session, Model m) {
      UserVO loginUser = (UserVO) session.getAttribute("user");
      if (loginUser == null) {
         m.addAttribute("msg", "로그인이 필요합니다.");
         m.addAttribute("url", "/user/login");
         return "views/common/msg";
      }
      UserVO user = userService.getUser(loginUser.getUiNum());
      m.addAttribute("user", user);
      return "views/user/mypage-update";
   }

   // 마이페이지 정보 수정 처리
   @PostMapping("/user/mypage-update")
   public String myPageUpdate(@ModelAttribute UserVO user, HttpSession session, Model m) {
      int result = userService.updateUser(user);
      if (result == 1) {
         // 세션 정보 갱신
         session.setAttribute("user", userService.getUser(user.getUiNum()));
         m.addAttribute("msg", "정보 수정 완료");
         m.addAttribute("url", "/");
      } else {
         m.addAttribute("msg", "정보 수정 실패");
         m.addAttribute("url", "/user/mypage-update");
      }
      return "views/common/msg";
   }

   @RequestMapping(value = "/user/check-id", method = RequestMethod.GET)
   @ResponseBody
   public Map<String, Object> checkId(@RequestParam("uiId") String uiId) {
      Map<String, Object> res = new HashMap<>();
      UserVO user = userService.getUserById(uiId);
      res.put("available", user == null);
      res.put("usableID", user == null);
      return res;
   }
}
