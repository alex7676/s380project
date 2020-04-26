package ouhk.comps380f.controller;

import java.io.IOException;
import javax.annotation.Resource;
import javax.swing.JOptionPane;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import ouhk.comps380f.dao.UserRepository;
import ouhk.comps380f.model.Users;

@Controller
public class IndexController {
    @Resource
    UserRepository userRepo;
    @GetMapping
    public String _index() {
        return "redirect:/index";
    }
    
    @GetMapping("/pollHistory")
    public ModelAndView pollHistory() {
        return new ModelAndView("pollHistory", "Users", new UserController.Form());
    }
    
    @PostMapping("/pollHistory")
    public String index(UserController.Form form) throws IOException {
        Users user = new Users(form.getUsername(),form.getPassword(), "ROLE_USER", "normal");
        userRepo.save(user);
        return "redirect:/index";
    }
        
    @GetMapping("/admin")
    public String adminControl(){
        return "adminControl";
    }
    

    @GetMapping("/admin/thread")
    public String manageThread(){
        return "manageThread";
    }
    
    @GetMapping("/admin/createPoll")
    public String createPoll(){
        return "createPoll";
    }
    
    @GetMapping("/createThread")
    public String createThread(){
        return "createThread";
    }
    
    @GetMapping("/lectureList")
    public String lectureList(){
        return "lecture";
    }
    
    @GetMapping("/labList")
    public String labList(){
        return "lab";
    }
    
    @GetMapping("/otherList")
    public String otherList(){
        return "other";
    }
}
