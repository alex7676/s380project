package ouhk.comps380f.dao;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import ouhk.comps380f.model.Topics;


public interface TopicsRepository extends JpaRepository<Topics, Long>{
    
    public List<Topics> findByCategories(String categories);


}
