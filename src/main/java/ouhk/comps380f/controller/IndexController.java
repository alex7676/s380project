package ouhk.comps380f.controller;

import org.springframework.stereotype.Controller;
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

}
