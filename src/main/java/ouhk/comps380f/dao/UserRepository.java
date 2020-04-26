
package ouhk.comps380f.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import ouhk.comps380f.model.Users;

public interface UserRepository extends JpaRepository<Users, String> {

    public Object findByUsername(String username);
    
}
