package XUPT_assistant.utils;

import XUPT_assistant.model.Course;
import XUPT_assistant.model.Grade;
import XUPT_assistant.model.Student;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import java.util.*;

public class ConnectJWGL {

    private final String url = "http://www.zfjw.xupt.edu.cn";
    private Map<String,String> cookies = new HashMap<>();
    private String modulus;
    private String exponent;
    private String csrftoken;
    private Connection connection;
    private Connection.Response response;
    private Document document;
    private String stuNum;
    private String password;

    public ConnectJWGL(String stuNum,String password){
        this.stuNum = stuNum;
        this.password = password;
    }

    public void init() throws Exception{
        getCsrftoken();
        getRSApublickey();
    }

    // 获取csrftoken和Cookies
    private void getCsrftoken(){
        try{
            connection = Jsoup.connect(url+ "/jwglxt/xtgl/login_slogin.html?language=zh_CN&_t="+new Date().getTime());
            connection.header("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0");
            response = connection.execute();
            cookies = response.cookies();
            //保存csrftoken
            document = Jsoup.parse(response.body());
            csrftoken = document.getElementById("csrftoken").val();
        }catch (Exception ex){
            ex.printStackTrace();
        }
    }

    // 获取公钥并加密密码
    public void getRSApublickey() throws Exception{
        connection = Jsoup.connect(url+ "/jwglxt/xtgl/login_getPublicKey.html?" +
                "time="+ new Date().getTime());
        connection.header("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0");
        response = connection.cookies(cookies).ignoreContentType(true).execute();
        JSONObject jsonObject = JSON.parseObject(response.body());
        modulus = jsonObject.getString("modulus");
        exponent = jsonObject.getString("exponent");
        password = RSAEncoder.RSAEncrypt(password, B64.b64tohex(modulus), B64.b64tohex(exponent));
        password = B64.hex2b64(password);
    }

    //登录
    public boolean beginLogin() throws Exception{

        connection = Jsoup.connect(url+ "/jwglxt/xtgl/login_slogin.html");
        connection.header("Content-Type","application/x-www-form-urlencoded;charset=utf-8");
        connection.header("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0");

        connection.data("csrftoken",csrftoken);
        connection.data("yhm",stuNum);
        connection.data("mm",password);
        connection.data("mm",password);
        connection.cookies(cookies).ignoreContentType(true)
                .method(Connection.Method.POST).execute();

        response = connection.execute();
        document = Jsoup.parse(response.body());
        if(document.getElementById("tips") == null){
            return true;
        }else{
            System.out.println(document.getElementById("tips").text());
            return false;
        }
    }

    // 查询学生信息
    public Student getStudentInformaction() throws Exception {
        connection = Jsoup.connect(url+ "/jwglxt/xsxxxggl/xsxxwh_cxCkDgxsxx.html?gnmkdm=N100801&su="+ stuNum);
        connection.header("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0");
        response = connection.cookies(cookies).ignoreContentType(true).execute();
        JSONObject jsonObject = JSON.parseObject(response.body());
        Student student = new Student();
        student.setName(jsonObject.getString("xm"));
        student.setNumber(jsonObject.getString("xh_id"));
        student.setSex(jsonObject.getString("xbm"));
        student.setNation(jsonObject.getString("mzm"));
        student.setCollege(jsonObject.getString("jg_id"));
        student.setSpecialty(jsonObject.getString("zszyh_id"));
        student.setClazz(jsonObject.getString("bh_id"));
        student.setEntrollment_year(Integer.parseInt(jsonObject.getString("njdm_id")));
        student.setId_number(jsonObject.getString("zjhm"));
        student.setPolitics_status(jsonObject.getString("zzmmm"));
        return student;
    }

    // 获取课表信息
    public List<Course> getStudentTimetable(int year , int term) throws Exception {
        connection = Jsoup.connect(url+ "/jwglxt/kbcx/xskbcx_cxXsKb.html?gnmkdm=N2151");
        connection.header("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0");
        connection.data("xnm",String.valueOf(year));
        connection.data("xqm",String.valueOf(term * term * 3));
        response = connection.cookies(cookies).method(Connection.Method.POST).ignoreContentType(true).execute();
        JSONObject jsonObject = JSON.parseObject(response.body());
        if(jsonObject.get("kbList") == null){
            return null;
        }
        JSONArray timeTable = JSON.parseArray(jsonObject.getString("kbList"));
        List<Course> courses = new ArrayList<>();
        for (Iterator iterator = timeTable.iterator(); iterator.hasNext();) {
            JSONObject lesson = (JSONObject) iterator.next();
            Course course = new Course();
            course.setCourseName(lesson.getString("kcmc"));
            course.setTeacher(lesson.getString("xm"));
            course.setExam_style(lesson.getString("khfsmc"));
            course.setPeriod(lesson.getString("zcd"));
            course.setDay_of_week(lesson.getString("xqjmc"));
            course.setJc(lesson.getString("jc"));
            course.setCampus(lesson.getString("xqmc"));
            course.setClassroom(lesson.getString("cdmc"));
            courses.add(course);
        }
        return courses;
    }

    // 获取成绩信息
    public List<Grade> getStudentGrade(int year , int term) throws Exception {
        Map<String,String> datas = new HashMap<>();
        datas.put("xnm",String.valueOf(year));
        datas.put("xqm",String.valueOf(term * term * 3));
        datas.put("_search","false");
        datas.put("nd",String.valueOf(new Date().getTime()));
        datas.put("queryModel.showCount","20");
        datas.put("queryModel.currentPage","1");
        datas.put("queryModel.sortName","");
        datas.put("queryModel.sortOrder","asc");
        datas.put("queryModel.sortName","");
        datas.put("time","0");

        connection = Jsoup.connect(url+ "/jwglxt/cjcx/cjcx_cxDgXscj.html?gnmkdm=N305005&layout=default&su=" + stuNum);
        connection.header("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0");
        response = connection.cookies(cookies).method(Connection.Method.POST)
                .data(datas).ignoreContentType(true).execute();
        connection = Jsoup.connect(url+ "/jwglxt/cjcx/cjcx_cxDgXscj.html?doType=query&gnmkdm=N305005");
        connection.header("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0");
        response = connection.cookies(cookies).method(Connection.Method.POST)
                .data(datas).ignoreContentType(true).execute();
        JSONObject jsonObject = JSON.parseObject(response.body());
        if(jsonObject.get("items") == null){
            return null;
        }
        JSONArray gradeTable = JSON.parseArray(jsonObject.getString("items"));
        List<Grade> grades = new ArrayList<>();
        for (Iterator iterator = gradeTable.iterator(); iterator.hasNext();) {
            JSONObject lesson = (JSONObject) iterator.next();
            Grade grade = new Grade();
            grade.setCourseName(lesson.getString("kcmc"));
            grade.setCredit(lesson.getString("xf"));
            grade.setType(lesson.getString("kcxzmc"));
            grade.setExam_style(lesson.getString("ksxz"));
            grade.setTeacher(lesson.getString("jsxm"));
            grade.setScores(lesson.getString("cj"));
            grade.setGPA(lesson.getString("jd"));
            grades.add(grade);
        }
        return grades;
    }

    public void logout() throws Exception {
        connection = Jsoup.connect(url+ "/jwglxt/logout");
        connection.header("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0");
        response = connection.cookies(cookies).ignoreContentType(true).execute();
    }

}
