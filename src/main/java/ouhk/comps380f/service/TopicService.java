package ouhk.comps380f.service;

import java.io.IOException;
import java.util.List;
import org.springframework.web.multipart.MultipartFile;
import ouhk.comps380f.exception.TopicNotFound;
import ouhk.comps380f.model.Topic;
        
public interface TopicService {

    public long createThread(String title, String author,
            String content, String categories, List<MultipartFile> attachments) throws IOException;

    public List<Topic> getThreads();
    //public List<Thread> getLectureThreads();
    //public List<Thread> getLabThreads();
    //public List<Thread> getOtherThreads();
    
    public Topic getThread(long id);

    public void delete(long id) throws TopicNotFound;

}
