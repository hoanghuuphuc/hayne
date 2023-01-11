package poly.ass.controller;



import java.util.ArrayList;
import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import poly.ass.dao.CategoryDAO;
import poly.ass.dao.ProductDAO;

import poly.ass.entity.CartItem;
import poly.ass.entity.Category;
import poly.ass.entity.Product;
import poly.ass.service.CookieService;
import poly.ass.service.SessionService;
import poly.ass.service.ShoppingCartService;




@Controller
public class ShoppingCartController {

	@Autowired
	CategoryDAO daoCategory;

	@Autowired
	ProductDAO daoProduct;

	@Autowired
	CookieService cookie;

	@Autowired
	SessionService session;

	@Autowired
	ShoppingCartService cart;
	private List<CartItem> cartItems = new ArrayList<>();


	@RequestMapping("/cart/view")
	public String cartView(Model model) {
		model.addAttribute("TitlePage", "Cart");
		model.addAttribute("view", "/views/guests/cart.jsp");

		List<Category> categories = daoCategory.findAll();
		model.addAttribute("categories", categories);

		model.addAttribute("cart", cart);
		model.addAttribute("Count", cart.getCount());
		
		return "index";
	}





	@RequestMapping("/cart/remove/{key}")
	public String remove(@PathVariable("key") String key) {

		cart.remove(key);

//		System.out.println("Remove ITEM: " + id);
		return "redirect:/cart/view";
	}

	@RequestMapping("/cart/update/{key}")
	public String update(@PathVariable("key") String key, @RequestParam("quantity") Integer quantity) {

		cart.update(key, quantity);
//		System.out.println("Update ITEM: " + id + "; Qty = " + quantity);
		return "redirect:/cart/view";
	}

	@RequestMapping("/cart/clear")
	public String clear() {
		cart.clear();

//		System.out.println("CLEAR CART");
		return "redirect:/cart/view";
	}
	@RequestMapping("/cart/add/{id}")
	public String add(@PathVariable("id") Integer id, @RequestParam("fav_language") String Size, @RequestParam("soLuong")int SoLuong, Model m, RedirectAttributes redirectAttributes) {
		Product product = daoProduct.layid(id);


		int soluongSp =product.getTotal();
		if(soluongSp < SoLuong) {
			System.out.println("het hang");
//			m.addAttribute("message", "Xin lỗi rất tiếc sản phẩm đã hết hàng!");
			redirectAttributes.addFlashAttribute("message", "Xin lỗi rất tiếc sản phẩm đã hết hàng!");
			return "redirect:/details/{id}";
		}
		
		if (product != null) {

			
			CartItem item = new CartItem();
			item.setProductId(product.getId());
			item.setProductName(product.getName());
			item.setPrice(product.getPrice());
			item.setQuantity(SoLuong);
			item.setImage(product.getImage());
			item.setSize(Size);
			cart.add(item);


//			product.setTotal(product.getTotal()-soluong);
//			daoProduct.save(product);
			
			
					
					

		}
		
		return "redirect:/cart/view";
	}


}
