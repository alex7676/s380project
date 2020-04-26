package ouhk.comps380f.controller;

import java.io.IOException;
import javax.annotation.Resource;
import javax.swing.JOptionPane;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import ouhk.comps380f.dao.TicketUserRepository;
import ouhk.comps380f.model.TicketUser;

@Controller
public class IndexController {
    @Resource
    TicketUserRepository ticketUserRepo;
    @GetMapping
    public String _index() {
        return "redirect:/index";
    }
    
    @GetMapping("/index")
    public ModelAndView index() {
        return new ModelAndView("index", "ticketUser", new TicketUserController.Form());
    }
    
    @PostMapping("/index")
    public String index(TicketUserController.Form form) throws IOException {
        TicketUser user = new TicketUser(form.getUsername(),
                form.getPassword(), "normal"
        );
        ticketUserRepo.save(user);
        return "redirect:/index";
    }
    
    @GetMapping("/admin")
    public String adminControl(){
        return "adminControl";
    }
    
    @GetMapping("/admin/user")
    public String manageUser(ModelMap model){
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
