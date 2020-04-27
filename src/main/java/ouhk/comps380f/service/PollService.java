
package ouhk.comps380f.service;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ouhk.comps380f.dao.PollRepository;
import ouhk.comps380f.model.Poll;

@Service
public class PollService {
    
    @Resource
    private PollRepository pollRepo;
    
    @Transactional   
    public void createPoll(String username, String topic, String option1, String option2, String option3, String option4){
        Poll newPoll = new Poll(username, topic, option1, option2, option3,option4);
        pollRepo.save(newPoll);
    }
}
