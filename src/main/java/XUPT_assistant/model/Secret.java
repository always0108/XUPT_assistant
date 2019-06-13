package XUPT_assistant.model;

import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Secret {
    private Integer id;

    private int user_id;

    private String username;

    private String content;

    private Date time;

    private String display_time;

    private SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getDisplay_time() {
        return df.format(time);
    }

    public void setDisplay_time(String display_time) {
        this.display_time = display_time;
    }
}