package ouhk.comps380f.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import ouhk.comps380f.model.Topics;


public interface TopicsRepository extends JpaRepository<Topics, Long>{
    
}
