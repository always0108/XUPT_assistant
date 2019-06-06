package XUPT_assistant.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.IOException;


@Controller
public class test{

    @RequestMapping(value = "/test",method = RequestMethod.GET)
    public String getTicketByScheduleId() throws IOException{

        return "test";
    }


}
