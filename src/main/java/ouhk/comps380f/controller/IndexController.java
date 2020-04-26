package ouhk.comps380f.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {

    @GetMapping
    public String _index() {
        return "redirect:/index";
    }
    
    @GetMapping("/index")
    public String index() {
        return "index";
    }
    
    @GetMapping("/admin")
    public String adminControl(){
        return "adminControl";
    }
    
    @GetMapping("/admin/user")
    public String manageUser(ModelMap model){
        model.addAttribute("userDatabase",userDatabase);
        return "manageUser";
    }
    
    @GetMapping("/admin/thread")
    public String manageThread(){
        return "manageThread";
    }
    
    @GetMapping("/admin/createPoll")
    public String createPoll(){
        return "createPoll";
    }

}
