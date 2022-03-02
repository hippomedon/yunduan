package com.javapandeng.controller;

import com.javapandeng.base.BaseController;
import com.javapandeng.po.News;
import com.javapandeng.service.NewsService;
import com.javapandeng.utils.Pager;
import com.javapandeng.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

/**
 * 公告管理
 */
@Controller
@RequestMapping("/news")
public class NewsController extends BaseController {

    @Autowired
    private NewsService newsService;

    /**
     * 公告列表
     */
    @RequestMapping("/findBySql")
    public String findBySql(News news, Model model){
        String sql = "select * from news where 1=1 ";
        if(!isEmpty(news.getName())){
            sql += " and name like '%"+news.getName()+"%'";
        }
        sql += " order by id desc";
        Pager<News> pagers = newsService.findBySqlRerturnEntity(sql);
        model.addAttribute("pagers",pagers);
        model.addAttribute("obj",news);
        return "news/news_yh";
    }

    /**
     * 跳转到添加页面
     */
    @RequestMapping("/add")
    public String add(){
        return "news/add_yh";
    }

    /**
     * 添加执行
     */
    @RequestMapping("/exAdd")
    @ResponseBody
    public R exAdd(News news){
        news.setAddTime(new Date());
        newsService.insert(news);
        return R.ok();
    }

    /**
     * 跳转到修改页面
     */
    @RequestMapping("/update")
    public String update(Integer id,Model model){
        News obj = newsService.load(id);
        model.addAttribute("obj",obj);
        return "news/update_yh";
    }

    /**
     * 修改执行
     */
    @RequestMapping("/exUpdate")
    @ResponseBody
    public R exUpdate(News news){
        newsService.updateById(news);
        return R.ok();
    }

    /**
     * 删除公告
     */
    @RequestMapping("/delete")
    @ResponseBody
    public R delete(Integer id){
        newsService.deleteById(id);
        return R.ok();
    }

    /**
     * 前端公告列表
     */
    @RequestMapping("/list")
    public String list(Model model){
        Pager<News> pagers = newsService.findByEntity(new News());
        model.addAttribute("pagers",pagers);
        return "news/list";
    }

    /**
     * 公告详情页面
     */
    @RequestMapping("/view")
    public String view(Integer id,Model model){
        News obj = newsService.load(id);
        model.addAttribute("obj",obj);
        return "news/view";
    }
}
