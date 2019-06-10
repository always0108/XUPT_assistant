package XUPT_assistant.model;

public class Grade {
    //课程名称 "kcmc"
    private String courseName;
    //学分 "xf"
    private String credit;
    //课程种类 "kcxzmc"
    private String type;
    //考试形式 "ksxz"
    private String exam_style;
    //教师 "jsxm"
    private String teacher;
    //成绩 "cj"
    private String scores;
    //绩点 "jd"
    private String GPA;

    public Grade() {
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getCredit() {
        return credit;
    }

    public void setCredit(String credit) {
        this.credit = credit;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getExam_style() {
        return exam_style;
    }

    public void setExam_style(String exam_style) {
        this.exam_style = exam_style;
    }

    public String getTeacher() {
        return teacher;
    }

    public void setTeacher(String teacher) {
        this.teacher = teacher;
    }

    public String getScores() {
        return scores;
    }

    public void setScores(String scores) {
        this.scores = scores;
    }

    public String getGPA() {
        return GPA;
    }

    public void setGPA(String GPA) {
        this.GPA = GPA;
    }
}
