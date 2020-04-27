
package ouhk.comps380f.service;

import java.sql.Blob;
import java.sql.Timestamp;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import ouhk.comps380f.dao.TopicsRepository;
import ouhk.comps380f.model.Attachment;
import ouhk.comps380f.model.Topics;

@Service
public class TopicsService{
   @Resource
   private TopicsRepository topicsRepo;
   
   @Transactional
   public void createTopics(String title, String content, String author, Timestamp time, Blob files, String filename, String categories){
    Topics topic = new Topics();
    topic.setTitle(title);
    topic.setContent(content);
    topic.setAuthor(author);
    topic.setTime(time);
    topic.setFile(files);
    topic.setFilename(filename);
    topic.setCategories(categories);
    topicsRepo.save(topic);
    //Topics savedTopic = topicsRepo.save(topic);
    //return savedTopic.getId();
   }
   
   @Transactional
   public List<Topics> getLectures(String categories){
       //Topics topics = topicsRepo.findById(categories).orElse(null);
       return topicsRepo.findByCategories(categories);
       //return topicsRepo.findAll();
   }
   @Transactional
   public List<Topics> getLabs(String categories){
       //Topics topics = topicsRepo.findById(categories).orElse(null);
       return topicsRepo.findByCategories(categories);
       //return topicsRepo.findAll();
   }
   @Transactional
   public List<Topics> getOthers(String categories){
       //Topics topics = topicsRepo.findById(categories).orElse(null);
       return topicsRepo.findByCategories(categories);
       //return topicsRepo.findAll();
   }
   
   @Transactional
    public Topics getTopics(long id) {
        return topicsRepo.findById(id).orElse(null);
    }
}

