package ouhk.comps380f.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;
import ouhk.comps380f.exception.AttachmentNotFound;
import ouhk.comps380f.exception.TopicNotFound;
import ouhk.comps380f.model.Attachment;
import ouhk.comps380f.model.Topic;
import ouhk.comps380f.service.AttachmentService;
import ouhk.comps380f.view.DownloadingView;
import ouhk.comps380f.service.TopicService;

@Controller
public class TopicController {
    @Autowired
    private TopicService topicService;

    @Autowired
    private AttachmentService attachmentService;
    
    @GetMapping({"/lecture"})
    public String list(ModelMap model) {
        model.addAttribute("topicDatabase", topicService.getThreads());
        return "lecture";
    }
    
    @GetMapping("/createThread")
    public ModelAndView createThread() {
        return new ModelAndView("createThread", "threadForm", new Form());
    }
     public static class Form {
        private int id;
        private String author;
        private String title;
        private String content; 
        private String categories;
        private List<MultipartFile> attachments;

        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public String getAuthor() {
            return author;
        }

        public void setAuthor(String author) {
            this.author = author;
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

        public String getCategories() {
            return categories;
        }

        public void setCategories(String categories) {
            this.categories = categories;
        }

        public List<MultipartFile> getAttachments() {
            return attachments;
        }

        public void setAttachments(List<MultipartFile> attachments) {
            this.attachments = attachments;
        }
     }
        @PostMapping("/createThread")
        public String createThread(Form form, Principal principal) throws IOException {
            long threadId = topicService.createThread(
                form.getTitle(), principal.getName(), form.getContent(), form.getCategories(), form.getAttachments());
            return "redirect:/threadDetail/" + threadId;
    }
        
        @GetMapping("/view/{threadId}")
        public String view(@PathVariable("threadId") long threadId,
            ModelMap model) {
            Topic thread = topicService.getThread(threadId);
            if (thread == null) {
                return "redirect:/index";
            }
            model.addAttribute("thread", thread);
            return "threadDetail";
    }
     
}
