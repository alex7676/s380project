package ouhk.comps380f.model;


import java.io.Serializable;
import java.sql.Timestamp;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name= "vote")
public class Vote implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long Id;
    private long pollid;
    private String username;
    private int choice;

    public Vote() {
    }

    public Vote(long pollid, String username, int choice) {
        this.pollid = pollid;
        this.username = username;
        this.choice = choice;
    }

    public long getPollid() {
        return pollid;
    }

    public void setPollid(long pollid) {
        this.pollid = pollid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getChoice() {
        return choice;
    }

    public void setChoice(int choice) {
        this.choice = choice;
    }

    public long getId() {
        return Id;
    }

    public void setId(long Id) {
        this.Id = Id;
    }


    
    
    
}
