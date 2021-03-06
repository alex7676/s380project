package ouhk.comps380f.controller;

import java.io.IOException;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import ouhk.comps380f.dao.UserRepository;
import ouhk.comps380f.dao.PollRepository;
import ouhk.comps380f.model.Poll;
import ouhk.comps380f.model.Users;
import ouhk.comps380f.service.UserService;

@Controller
public class UserController {

    @Resource
    UserRepository userRepo;

    @Resource
    PollRepository pollRepo;

    @GetMapping("/admin/user")
    public String users(ModelMap model) {
        model.addAttribute("Users", userRepo.findAll());
        return "manageUser";
    }

    @GetMapping("/admin/ban/{username}/")
    public String ban(@PathVariable("username") String username) throws IOException {
        if (username != null) {
            Users user = userRepo.findById(username).orElse(null);
            user.setStatus("banned");
            userRepo.save(user);
            return "redirect:/admin/user";
        }
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/unban/{username}/")
    public String unban(@PathVariable("username") String username) throws IOException {
        if (username != null) {
            Users user = userRepo.findById(username).orElse(null);
            user.setStatus("normal");
            userRepo.save(user);
            return "redirect:/admin/user";
        }
        return "redirect:/admin/user";
    }

    @GetMapping("/signup")
    public ModelAndView signup() {
        ModelAndView mav = new ModelAndView("signup", "Users", new UserController.Form());
        return mav;
    }

    @PostMapping("/signup")
    public String signup(UserController.Form form) throws IOException {
        Users temp = userRepo.findById(form.getUsername()).orElse(null);
        if(temp == null) {
        Users user = new Users(form.getUsername(), form.getPassword(), "ROLE_USER", "normal");
        userRepo.save(user);
        } else {
            return "redirect:/index?error=user existed";
        }
        return "redirect:/index";
    }

    @GetMapping("/login")
    public ModelAndView login() {
        ModelAndView mav = new ModelAndView("login", "Users", new UserController.Form());
        return mav;
    }


    public static class Form {

        private String username;
        private String password;
        private String role;
        private String status;

        public String getUsername() {
            return username;
        }

        public void setUsername(String username) {
            this.username = username;
        }

        public String getPassword() {
            return password;
        }

        public void setPassword(String password) {
            this.password = password;
        }

        public String getRole() {
            return role;
        }

        public void setRole(String role) {
            this.role = role;
        }

        public String getStatus() {
            return status;
        }

        public void setStatus(String status) {
            this.status = status;
        }
    }
}
