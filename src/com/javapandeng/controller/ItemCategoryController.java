package com.javapandeng.controller;

import com.javapandeng.base.BaseController;
import com.javapandeng.po.Item;
import com.javapandeng.po.ItemCategory;
import com.javapandeng.po.TjDto;
import com.javapandeng.service.ItemCategoryService;
import com.javapandeng.service.ItemService;
import com.javapandeng.utils.Pager;
import com.javapandeng.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 类目c层
 */
@Controller
@RequestMapping("/itemCategory")
public class ItemCategoryController extends BaseController {

    @Autowired
    private ItemCategoryService itemCategoryService;

    /**
     * 分页查询类目列表
     */
    @RequestMapping("/findBySql")
    public String findBySql(Model model,ItemCategory itemCategory){
        String sql = "select * from item_category where isDelete = 0 and pid is null order by id";
        Pager<ItemCategory> pagers = itemCategoryService.findBySqlRerturnEntity(sql);
        model.addAttribute("pagers",pagers);
        model.addAttribute("obj",itemCategory);
        return "itemCategory/type_yh";
    }

    /**
     * 转向到新增一级类目页面
     */
    @RequestMapping(value = "/add")
    public String add(){
        return "itemCategory/type-add_yh";
    }

    /**
     * 新增一级类目保存功能
     */
    @RequestMapping("/exAdd")
    @ResponseBody
    public R exAdd(ItemCategory itemCategory){
        itemCategory.setIsDelete(0);
        itemCategoryService.insert(itemCategory);
        //return "redirect:/itemCategory/findBySql.action";
        return R.ok();
    }

    /**
     * 转向到修改一级类目页面
     */
    @RequestMapping(value = "/update")
    public String update(Integer id,Model model){
        ItemCategory obj = itemCategoryService.load(id);
        model.addAttribute("obj",obj);
        return "itemCategory/update_yh";
    }

    /**
     * 修改一级类目
     */
    @RequestMapping("/exUpdate")
    @ResponseBody
    public R exUpdate(ItemCategory itemCategory){
        //你返回mv咋子可能进success嘛
        itemCategoryService.updateById(itemCategory);
        //R x = R.ok();
        //System.out.println("aa:"+x);
        return R.ok();
    }

    /**
     * 删除类目
     */
    @RequestMapping("/delete")
    @ResponseBody
    public R delete(Integer id){
        //删除本身
        //System.out.println("xxxxxx"+id);
        ItemCategory load = itemCategoryService.load(id);
        load.setIsDelete(1);
        itemCategoryService.updateById(load);
        //将下级也删除
        String sql = "update item_category set isDelete=1 where pid="+id;
        itemCategoryService.updateBysql(sql);
        //return "redirect:/itemCategory/findBySql.action";
        //System.out.println("成功！！");
        return R.ok();
    }
    /*
    * 全部删除，即将isdelete修改为1
    * */


    /**
     * 查看二级类目
     */
    @RequestMapping("/findBySql2")
    public String findBySql2(ItemCategory itemCategory,Model model){
        String sql = "select * from item_category where isDelete=0 and pid="+itemCategory.getPid()+" order by id";
        Pager<ItemCategory> pagers = itemCategoryService.findBySqlRerturnEntity(sql);
        model.addAttribute("pagers",pagers);
        model.addAttribute("obj",itemCategory);
        return "itemCategory/type_yh_2";
    }

    /**
     * 转向到新增二级类目页面
     */
    @RequestMapping(value = "/add2")
    public String add2(int pid,Model model){
        model.addAttribute("pid",pid);
        return "itemCategory/type-add_yh_2";
    }

    /**
     * 新增二级类目保存功能
     */
    @RequestMapping("/exAdd2")
    @ResponseBody
    public R exAdd2(ItemCategory itemCategory){
        itemCategory.setIsDelete(0);
        itemCategoryService.insert(itemCategory);
        //return "redirect:/itemCategory/findBySql2.action?pid="+itemCategory.getPid();
        return R.ok();
    }

    /**
     * 转向到修改二级类目页面
     */
    @RequestMapping(value = "/update2")
    public String update2(Integer id,Model model){
        //查询子商品
        ItemCategory obj = itemCategoryService.load(id);
        //查询父商品
        String sql = "select * from item_category where isDelete=0 and id="+obj.getPid()+" order by id";
        ItemCategory ItemCategory = itemCategoryService.getBySqlReturnEntity(sql);
        //将子对象父对象都存入
        model.addAttribute("obj",obj);
        model.addAttribute("ItemCategory",ItemCategory);
        //return "itemCategory/update2";
        return "itemCategory/update_yh_2";
    }

    /**
     * 修改二级类目
     */
    @RequestMapping("/exUpdate2")
    @ResponseBody
    public R exUpdate2(ItemCategory itemCategory){
        itemCategoryService.updateById(itemCategory);
        return R.ok();
        //return "redirect:/itemCategory/findBySql2.action?pid="+itemCategory.getPid();
    }

    /**
     * 删除二级类目
     */
    @RequestMapping("/delete2")
    @ResponseBody
    public R delete2(Integer id,Integer pid){
        //删除本身
        ItemCategory load = itemCategoryService.load(id);
        load.setIsDelete(1);
        itemCategoryService.updateById(load);
        //return "redirect:/itemCategory/findBySql2.action?pid="+pid;
        return R.ok();
    }

    @Autowired
    private ItemService itemService;

    @RequestMapping(value = "/welcome")
    public String tj(ItemCategory itemCategory, Model model, HttpServletRequest request, HttpServletResponse response) {
        //分页查询
        String sql = "SELECT * FROM item_category WHERE isDelete = 0 and pid is null";
        sql += " ORDER BY ID DESC ";
        List<ItemCategory> list = itemCategoryService.listBySqlReturnEntity(sql);
        List<Map<String,Object>> maps = new ArrayList<Map<String,Object>>();
        List<TjDto> res = new ArrayList<TjDto>();
        if (!CollectionUtils.isEmpty(list)){
            for (ItemCategory c : list){
                TjDto td = new TjDto();
                int tot = 0;
                List<Item> listBySqlReturnEntity = itemService.listBySqlReturnEntity("SELECT * FROM item WHERE 1=1 and isDelete =0 and category_id_one="+c.getId());
                if (!CollectionUtils.isEmpty(listBySqlReturnEntity)){
                    for (Item i : listBySqlReturnEntity){
                        tot+= i.getGmNum();
                    }
                }
                Map<String,Object> map = new HashMap<String,Object>();
                map.put("name", c.getName());
                map.put("value", tot);
                maps.add(map);
            }
        }
        //存储查询条件
        model.addAttribute("maps", maps);
        //return "itemCategory/tj";
        return "itemCategory/welcome_yh";
    }
}
