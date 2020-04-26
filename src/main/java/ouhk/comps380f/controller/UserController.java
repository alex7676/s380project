
package ouhk.comps380f.controller;

import java.io.IOException;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import ouhk.comps380f.dao.UserRepository;
import ouhk.comps380f.model.Users;


@Controller
public class UserController {
    
    @Resource
    UserRepository userRepo;
    
    @GetMapping("/admin/user")
    public String users(ModelMap model){
        model.addAttribute("Users", userRepo.findAll());
        return "listUser";
    }
    
    @GetMapping("/index")
    public ModelAndView index() {
        return new ModelAndView("index", "Users", new UserController.Form());
    }
    
    @PostMapping("/index")
    public String index(UserController.Form form) throws IOException {
        Users user = new Users(form.getUsername(),form.getPassword(), "ROLE_USER", "Active");
        userRepo.save(user);
        return "redirect:/index";
    }
    
    public static class Form{
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
