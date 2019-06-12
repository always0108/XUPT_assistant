package XUPT_assistant.model;

public class Course {
    //课程名 "kcmc"
    private String courseName;
    //教师 "xm"
    private String teacher;
    //考试方式"khfsmc"
    private String exam_style;
    //周期 "zcd"
    private String period;
    //星期 "xqjmc"
    private String day_of_week;
    //节次 "jc"
    private String jc;
    //校区"xqmc"
    private String campus;
    //教室 "cdmc"
    private String classroom;

    public Course() {
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getTeacher() {
        return teacher;
    }

    public void setTeacher(String teacher) {
        this.teacher = teacher;
    }

    public String getExam_style() {
        return exam_style;
    }

    public void setExam_style(String exam_style) {
        this.exam_style = exam_style;
    }

    public String getPeriod() {
        return period;
    }

    public void setPeriod(String period) {
        this.period = period;
    }

    public String getDay_of_week() {
        return day_of_week;
    }

    public void setDay_of_week(String day_of_week) {
        this.day_of_week = day_of_week;
    }

    public String getJc() {
        return jc;
    }

    public void setJc(String jc) {
        this.jc = jc;
    }

    public String getCampus() {
        return campus;
    }

    public void setCampus(String campus) {
        this.campus = campus;
    }

    public String getClassroom() {
        return classroom;
    }

    public void setClassroom(String classroom) {
        this.classroom = classroom;
    }
}
