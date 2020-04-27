
package ouhk.comps380f.controller;

import java.io.IOException;
import java.security.Principal;
import java.sql.Timestamp;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import ouhk.comps380f.dao.TopicsRepository;
import ouhk.comps380f.model.Attachment;
import ouhk.comps380f.model.Topics;

@Controller
public class TopicController {
    
   @Resource
    private TopicsRepository TopicsRepo;
   
    @GetMapping("/create")
    public ModelAndView create() {
        return new ModelAndView("add", "createTopicsForm", new createTopicsForm());
    }

    public static class createTopicsForm {
        private String title;
        private String content;
        private String author;
        private String categories;
        private List<Attachment> files;

        public createTopicsForm() {
        }

        public createTopicsForm(String title, String content,String author, String categories, List<Attachment> files) {
            this.title = title;
            this.content = content;
            this.author = author;
            this.categories = categories;
            this.files = files;
        }



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
        
        public String getCategories() {
            return categories;
        }

        public void setCategories(String categories) {
            this.categories = categories;
        }

        public List<Attachment> getFiles() {
            return files;
        }

        public void setFiles(List<Attachment> files) {
            this.files = files;
        }
        

    }

    @PostMapping("/create")
    public void create(createTopicsForm form, Principal principal) throws IOException {
        Topics newTopic = new Topics();
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        newTopic.setTitle(form.title);
        newTopic.setContent(form.content);
        newTopic.setAuthor(form.author);
        newTopic.setTime(timestamp);
        newTopic.setFile(form.files);
        newTopic.setCategories(form.categories);
        TopicsRepo.save(newTopic);
    }
}
