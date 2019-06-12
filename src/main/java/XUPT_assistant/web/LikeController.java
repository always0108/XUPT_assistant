package XUPT_assistant.web;

import XUPT_assistant.model.User;
import XUPT_assistant.service.LikeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/like")
public class LikeController {
    @Autowired
    private LikeService likeService;

    @RequestMapping(value = "/addOrDelete",method = RequestMethod.GET)
    @ResponseBody
    public String addOrDelete(int secret_id, HttpServletRequest request){
        User user = (User)request.getSession().getAttribute("user");
        int user_id = user.getId();
        if(likeService.isExist(user_id,secret_id)){
            likeService.deleteLike(user_id,secret_id);
            return "取消点赞";
        }else {
            likeService.addLike(user_id,secret_id);
            return "已点赞";
        }
    }

    @RequestMapping(value = "/getLikeCounts",method = RequestMethod.GET)
    public int getLikeCounts(int secret_id){
        return likeService.getCount(secret_id);
    }
}
