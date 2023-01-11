package poly.ass.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import poly.ass.dao.ProductDAO;
import poly.ass.entity.Product;

import java.util.List;

@Controller
public class detailsController {
    @Autowired
    ProductDAO productDAO;
    @RequestMapping("/details/{id}")
    public String trangchitiet(Model m, @PathVariable("id")int id){
        List<Product>products =productDAO.trangchitiet(id);
        m.addAttribute("list",products);
        return "guests/detail";
    }
}
