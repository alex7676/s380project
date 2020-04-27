package ouhk.comps380f.controller;

import java.io.IOException;
import java.security.Principal;
import java.sql.Blob;
import java.sql.Timestamp;
import javax.annotation.Resource;
import javax.swing.JOptionPane;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import ouhk.comps380f.dao.PollRepository;
import ouhk.comps380f.dao.TopicsRepository;
import ouhk.comps380f.dao.UserRepository;
import ouhk.comps380f.model.Poll;
import ouhk.comps380f.model.Topics;
import ouhk.comps380f.model.Users;
import ouhk.comps380f.service.PollService;

@Controller
public class IndexController {
    @Resource
    private TopicsRepository topicsRepo;
    @Resource
    private PollRepository pollRepo;
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
    
    @GetMapping("/admin/topics")
    public String manageTopics(ModelMap model){
        model.addAttribute("topics", topicsRepo.findAll());
        return "manageTopics";
    }
    
    
    @GetMapping("/admin/editTopics/{topicID}")
    public ModelAndView editTopics(@PathVariable("topicID") Long topicID, ModelMap model){
        model.addAttribute("topic",topicsRepo.findById(topicID).orElse(null));
        return new ModelAndView("editTopics", "topicForm", new topicForm());
    }
    
    
    @PostMapping("/admin/editTopics/{topicID}")
    public String editTopicsPost(@PathVariable("topicID")Long topicID, topicForm form,Principal principal){
        Topics editTopic = topicsRepo.findById(topicID).orElse(null);
        editTopic.setTitle(form.title);
        editTopic.setContent(form.content);
        topicsRepo.save(editTopic);
        return "redirect:/admin/topics";
    }
    public static class topicForm{
        private String title;
        private String content;
        private String author;
        private Timestamp time;
        private String filename;
        private Blob file;
        private String categories;

        public String getTitle() {
            return title;
        }

        public void setTitle(String title) {
            this.title = title;
        }

        public String getContent() {
            return content;
        }

        public void setContent(String content) {
            this.content = content;
        }

        public String getAuthor() {
            return author;
        }

        public void setAuthor(String author) {
            this.author = author;
        }

        public Timestamp getTime() {
            return time;
        }

        public void setTime(Timestamp time) {
            this.time = time;
        }

        public String getFilename() {
            return filename;
        }

        public void setFilename(String filename) {
            this.filename = filename;
        }

        public Blob getFile() {
            return file;
        }

        public void setFile(Blob file) {
            this.file = file;
        }

        public String getCategories() {
            return categories;
        }

        public void setCategories(String categories) {
            this.categories = categories;
        }
        
    }
    
    @GetMapping("/admin/createPoll")
    public ModelAndView createPoll(){
        return new ModelAndView("createPoll", "createPollForm", new createPollForm());
    }
    
    @PostMapping("/admin/createPoll")
    public String createPoll(createPollForm form,Principal principal) throws IOException{
        Poll newPoll = new Poll();
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        newPoll.setUsername(principal.getName());
        newPoll.setTime(timestamp);
        newPoll.setTopic(form.getTopic());
        newPoll.setOption1(form.getOption1());
        newPoll.setOption2(form.getOption2());
        newPoll.setOption3(form.getOption3());
        newPoll.setOption4(form.getOption4());
        pollRepo.save(newPoll);
        return  "redirect:/index";
    }
        public static class createPollForm{
        private String topic;
        private String option1;
        private String option2;
        private String option3;
        private String option4;

        public createPollForm() {
        }
        
        public String getTopic() {
            return topic;
        }

        public void setTopic(String topic) {
            this.topic = topic;
        }

        public String getOption1() {
            return option1;
        }

        public void setOption1(String option1) {
            this.option1 = option1;
        }

        public String getOption2() {
            return option2;
        }

        public void setOption2(String option2) {
            this.option2 = option2;
        }

        public String getOption3() {
            return option3;
        }

        public void setOption3(String option3) {
            this.option3 = option3;
        }

        public String getOption4() {
            return option4;
        }

        public void setOption4(String option4) {
            this.option4 = option4;
        }
        
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