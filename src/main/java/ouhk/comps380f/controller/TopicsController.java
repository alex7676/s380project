
package ouhk.comps380f.controller;

import java.io.IOException;
import java.security.Principal;
import java.sql.Blob;
import java.sql.Timestamp;
import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import ouhk.comps380f.controller.IndexController.topicForm;
import ouhk.comps380f.service.TopicsService;
import ouhk.comps380f.dao.TopicsRepository;
import ouhk.comps380f.model.Topics;

@Controller
@RequestMapping("/topics")
public class TopicsController {
    
    @Autowired
    private TopicsService topicsService;
    
    @Resource
    TopicsRepository topicsRepo;
    
    @GetMapping("/lecture")
    public String list(ModelMap model) {
        model.addAttribute("topicsDatabase", topicsService.getLectures("lecture"));
        //topicsRepo.findByCategories("lecture")
        return "lecture";
    }
    
    @GetMapping("/lecture/createThread")
    public ModelAndView create() {
        return new ModelAndView("createThread", "topicForm", new topicForm());
    }
    
    @PostMapping("/lecture/createThread")
    public String create(topicForm form, Principal principal) throws IOException {
        //topicsService.createTopics(form.getTitle(), form.getContent(),principal.getName(),form.getTime(),form.getFile(),form.getFilename(), form.getCategories());
        Topics topic = new Topics();
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        topic.setTitle(form.getTitle());
        topic.setContent(form.getContent());
        topic.setAuthor(principal.getName());
        topic.setTime(timestamp);
        topic.setFile(form.getFile());
        topic.setFilename(form.getFilename());
        topic.setCategories(form.getCategories());
        topicsRepo.save(topic);
        return "redirect:/topics/lecture";
    }
    @GetMapping("/lecture/detail/{topicsID}")
    public String detail(@PathVariable("topicsID") long topicsID ,
            ModelMap model) {
        Topics topic = topicsService.getTopics(topicsID);
        if (topic == null) {
            return "redirect:/topics/lecture";
        }
        model.addAttribute("topics", topic);
        return "detail";
    }
    
    @GetMapping("/lab")
    public String listLab(ModelMap model) {
        model.addAttribute("topicsDatabase", topicsService.getLabs("lab"));
        return "lab";
    }
    
    @GetMapping("/lab/createThread")
    public ModelAndView createLab() {
        return new ModelAndView("createThread", "topicForm", new topicForm());
    }
    
    @PostMapping("/lab/createThread")
    public String createLab(topicForm form, Principal principal) throws IOException {
        //topicsService.createTopics(form.getTitle(), form.getContent(),principal.getName(),form.getTime(),form.getFile(),form.getFilename(), form.getCategories());
        Topics topic = new Topics();
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        topic.setTitle(form.getTitle());
        topic.setContent(form.getContent());
        topic.setAuthor(principal.getName());
        topic.setTime(timestamp);
        topic.setFile(form.getFile());
        topic.setFilename(form.getFilename());
        topic.setCategories(form.getCategories());
        topicsRepo.save(topic);
        return "redirect:/topics/lab";
    }
    @GetMapping("/lab/detail/{topicsID}")
    public String detailLab(@PathVariable("topicsID") long topicsID ,
            ModelMap model) {
        Topics topic = topicsService.getTopics(topicsID);
        if (topic == null) {
            return "redirect:/topics/lab";
        }
        model.addAttribute("topics", topic);
        return "detail";
    }
    
    
    @GetMapping("/other")
    public String listOther(ModelMap model) {
        model.addAttribute("topicsDatabase", topicsService.getOthers("other"));
        return "other";
    }
    
    @GetMapping("/other/createThread")
    public ModelAndView createOther() {
        return new ModelAndView("createThread", "topicForm", new topicForm());
    }
    
    @PostMapping("/other/createThread")
    public String createOther(topicForm form, Principal principal) throws IOException {
        //topicsService.createTopics(form.getTitle(), form.getContent(),principal.getName(),form.getTime(),form.getFile(),form.getFilename(), form.getCategories());
        Topics topic = new Topics();
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        topic.setTitle(form.getTitle());
        topic.setContent(form.getContent());
        topic.setAuthor(principal.getName());
        topic.setTime(timestamp);
        topic.setFile(form.getFile());
        topic.setFilename(form.getFilename());
        topic.setCategories(form.getCategories());
        topicsRepo.save(topic);
        return "redirect:/topics/other";
    }
    @GetMapping("/other/detail/{topicsID}")
    public String detailOther(@PathVariable("topicsID") long topicsID ,
            ModelMap model) {
        Topics topic = topicsService.getTopics(topicsID);
        if (topic == null) {
            return "redirect:/topics/other";
        }
        model.addAttribute("topics", topic);
        return "detail";
    }
    
    
    public static class replyForm{
        private String topicid;
        private String content;
        private String author;
        private Timestamp time;
        private String filename;
        private Blob file;

        public String getTopicid() {
            return topicid;
        }

        public void setTopicid(String topicid) {
            this.topicid = topicid;
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

        }
}
