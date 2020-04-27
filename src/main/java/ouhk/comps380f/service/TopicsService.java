
package ouhk.comps380f.service;

import java.sql.Timestamp;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import ouhk.comps380f.dao.TopicsRepository;
import ouhk.comps380f.model.Attachment;
import ouhk.comps380f.model.Topics;

@Service
public class TopicsService{
   @Resource
   private TopicsRepository topicsRepo;
   
   public void createTopics(String title, String content, String author, Timestamp time, List<Attachment> files, String filename, String categroies){
    Topics topic = new Topics();
    topic.setTitle(title);
    topic.setContent(content);
    topic.setAuthor(author);
    topic.setTime(time);
    topic.setFile(files);
    topic.setFilename(filename);
    topic.setCategories(categroies);
    topicsRepo.save(topic);
   }
}
