package XUPT_assistant.model;

public class Picture {
    private Integer id;

    private String name;

    private Object image;

    public Picture() {
    }

    public Picture(String name, Object image) {
        this.name = name;
        this.image = image;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Object getImage() {
        return image;
    }

    public void setImage(Object image) {
        this.image = image;
    }
}