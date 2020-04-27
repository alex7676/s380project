package ouhk.comps380f.service;

import java.io.IOException;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import ouhk.comps380f.dao.AttachmentRepository;
import ouhk.comps380f.exception.TopicNotFound;
import ouhk.comps380f.model.Topic;
import ouhk.comps380f.model.Attachment;
import ouhk.comps380f.dao.TopicRepository;

@Service
public class TopicServiceImpl implements TopicService{
    @Resource
    TopicRepository threadRepo;
    
    @Resource
    AttachmentRepository attachmentRepo;
    
    @Override
    @Transactional
    public List<Topic> getThreads() {
        return threadRepo.findAll();
    }
    
    @Override
    @Transactional
    public Topic getThread(long id) {
        return threadRepo.findById(id).orElse(null);
    }
    
    @Override
    @Transactional
    public long createThread(String title, String author,
            String content, String categories, List<MultipartFile> attachments) throws IOException{
            Topic thread = new Topic();
            thread.setTitle(title);
            thread.setAuthor(author);
            thread.setContent(content);
            thread.setCategories(categories);
            
            for (MultipartFile filePart : attachments) {
            Attachment attachment = new Attachment();
            attachment.setName(filePart.getOriginalFilename());
            attachment.setMimeContentType(filePart.getContentType());
            attachment.setContents(filePart.getBytes());
            attachment.setThread(thread);
            if (attachment.getName() != null && attachment.getName().length() > 0
                    && attachment.getContents() != null
                    && attachment.getContents().length > 0) {
                thread.getAttachments().add(attachment);
            }
        }
            Topic savedThread = threadRepo.save(thread);
            return savedThread.getId();
            
    }
    
    @Override
    @Transactional(rollbackFor = TopicNotFound.class)
    public void delete(long id) throws TopicNotFound{
        Topic deletedThread = threadRepo.findById(id).orElse(null);
        if (deletedThread == null){
            throw new TopicNotFound();
        } 
        threadRepo.delete(deletedThread);
    }
}
