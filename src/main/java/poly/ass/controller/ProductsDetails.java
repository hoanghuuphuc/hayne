package poly.ass.controller;


import java.io.File;


import java.io.IOException;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.core.io.ClassPathResource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.multipart.MultipartFile;


import poly.ass.dao.CategoryDAO;
import poly.ass.dao.ProductDAO;
import poly.ass.entity.Category;
import poly.ass.entity.Product;






@Controller
@RequestMapping("/admin")
public class ProductsDetails {

	@Autowired
	ProductDAO daoProd;
	
	@Autowired
	CategoryDAO daoCate;




	@ModelAttribute("availables")
	public Map<Boolean, String> getAvailable(){
		Map<Boolean, String> map = new HashMap<>();
		map.put(true, " Available");
		map.put(false, " Not Available");
		return map;
	}
	
	@ModelAttribute("categories")
	public List<Category> getCategories(){
		
		List<Category> list = daoCate.findAll();
				
		return list;
	}

	@RequestMapping("/product")
	public String product(
			Model model,
			@RequestParam("p") Optional<Integer> p,
			@ModelAttribute("prod") Product product
			) {
		model.addAttribute("TitlePage", "Products Page");
		model.addAttribute("views", "/views/admin/ProductsDetails.jsp");

		Sort sortCD = Sort.by(Direction.DESC,"createDate");
		Pageable pageable = PageRequest.of(p.orElse(0), 5, sortCD);
		Page<Product> page = daoProd.findAll(pageable);
		model.addAttribute("page", page);
		
		return "/admin/index";
	}

	@RequestMapping("/product/edit/{id}")
	public String edit(Model model, @PathVariable("id") Integer id, 
			@RequestParam("p") Optional<Integer>p) {
		model.addAttribute("TitlePage", "Products Page");
		model.addAttribute("views", "/views/admin/ProductsDetails.jsp");
		
		Product product = daoProd.getById(id);
		model.addAttribute("prod", product);
		
		
		Sort sortCD = Sort.by(Direction.DESC,"createDate");
		Pageable pageable = PageRequest.of(p.orElse(0), 5, sortCD);
		Page<Product> page = daoProd.findAll(pageable);
		model.addAttribute("page", page);

		return "/admin/index";
	}

	@PostMapping(value = "/product/save")
	public String save(
			Model model,
			@Validated @ModelAttribute("prod") Product item,
			BindingResult result,@RequestParam("mulimage") MultipartFile file) throws IOException {

		if(result.hasErrors()) {
			List<ObjectError> errors = result.getAllErrors();
			System.out.println("message err: " + errors.get(0).getDefaultMessage());
			model.addAttribute("errors", errors);
			return "redirect:/admin/product";
		}else {
			if (item.getId() != null) {
				// Save the file to the server
				String uniqueFileName = UUID.randomUUID().toString() + "-" + file.getOriginalFilename();
				File filePath = new File("src/main/webapp/image");
				file.transferTo(new File(filePath.getAbsolutePath() + "/" + uniqueFileName));
				item.setImage(uniqueFileName);
				daoProd.save(item);

				return "redirect:/admin/product/edit/" + item.getId();
			}else {

				String uniqueFileName = UUID.randomUUID().toString() + "-" + file.getOriginalFilename();
				File filePath = new File("src/main/webapp/image");
				file.transferTo(new File(filePath.getAbsolutePath() + "/" + uniqueFileName));
				item.setImage(uniqueFileName);
				daoProd.save(item);
				

				return "redirect:/admin/product";
			}

		}

	}

	@RequestMapping(value = "/product/clear", method = RequestMethod.POST)
	public String clear(Model model) {
		Product product = new Product();
		model.addAttribute("prod", product);
		
		return "redirect:/admin/product";
	}

	@RequestMapping("/product/delete/{id}")
	public String delete(@PathVariable("id") Product product) {
//		daoProd.deleteById(id);
		daoProd.delete(product);
		return "redirect:/admin/product";
	}
	
}
