package ouhk.comps380f.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import ouhk.comps380f.model.Topic;

public interface TopicRepository extends JpaRepository<Topic, Long> {
}
