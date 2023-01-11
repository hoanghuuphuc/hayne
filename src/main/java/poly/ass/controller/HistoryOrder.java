package poly.ass.controller;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import poly.ass.dao.AccountDAO;
import poly.ass.dao.CategoryDAO;
import poly.ass.dao.OrderDAO;
import poly.ass.dao.OrderDetailDAO;
import poly.ass.entity.Account;
import poly.ass.entity.Category;
import poly.ass.entity.Order;
import poly.ass.entity.OrderDetail;
import poly.ass.service.ShoppingCartService;

@Controller
public class HistoryOrder {
	
	@Autowired
	AccountDAO daoAccount;
	
	@Autowired
	CategoryDAO daoCategory;
	
	@Autowired
	OrderDAO daoOrder;
	
	@Autowired
	OrderDetailDAO daoOrderDetail;
	
	@Autowired
	ShoppingCartService cart;
	

	@GetMapping("/myAcc/historyOrder/{id}")
	public String viewhistoryOrder(Model model, 
			@PathVariable("id") String id,
			@RequestParam("p") Optional<Integer> p
			) {
		model.addAttribute("TitlePage", "History Order");
		model.addAttribute("view", "/views/user/historyOrder.jsp");
		model.addAttribute("Count", cart.getCount());

		List<Category> categories = daoCategory.findAll();
		model.addAttribute("categories", categories);

		Account account = daoAccount.findById(id).get();

		Sort sortStatus = Sort.by(Direction.DESC,"createDate");
		Pageable pageable = PageRequest.of(p.orElse(0), 1000,sortStatus);
//		Page<Order> page = daoOrder.findByAccount(account, pageable);
		List<Order>orders0 =daoOrder.findByAccount(account,pageable).stream().filter(order -> order.getStatus()==0).collect(Collectors.toList());
		model.addAttribute("page0", orders0);

		List<Order>orders1 =daoOrder.findByAccount(account,pageable).stream().filter(order -> order.getStatus()==1).collect(Collectors.toList());
		model.addAttribute("page1", orders1);

		List<Order>orders2 =daoOrder.findByAccount(account,pageable).stream().filter(order -> order.getStatus()==2).collect(Collectors.toList());
		model.addAttribute("page2", orders2);

		List<Order>orders3 =daoOrder.findByAccount(account,pageable).stream().filter(order -> order.getStatus()==3).collect(Collectors.toList());
		model.addAttribute("page3", orders3);
		List<Order>orders4 =daoOrder.findByAccount(account,pageable).stream().filter(order -> order.getStatus()==4).collect(Collectors.toList());
		model.addAttribute("page4", orders4);
		return "index";
	}
	
	@GetMapping("/myAcc/historyOrderDetails/{id}")
	public String viewhistoryOrderDetails(Model model, 
			@PathVariable("id") Integer id,
			@RequestParam("p") Optional<Integer> p
			) {
		model.addAttribute("TitlePage", "History OrderDetails");
		model.addAttribute("view", "/views/user/historyOrderDetails.jsp");
		model.addAttribute("Count", cart.getCount());

		List<Category> categories = daoCategory.findAll();
		model.addAttribute("categories", categories);

		List<OrderDetail> listOD = daoOrderDetail.findHistoryOrderDetails(id);
		model.addAttribute("listOD", listOD);
		
		int tong = 0;
		for(OrderDetail od : listOD) {
			tong += (od.getQuantity() * od.getPrice());
		}
		model.addAttribute("TongTien", tong);
		model.addAttribute("Status", listOD.get(0).getOrder().getStatus());
		model.addAttribute("username", listOD.get(0).getOrder().getAccount().getUsername());
		
		return "index";
	}
	@GetMapping("/myAcc/cancel/{id}")
	public String huydon(Model m, @PathVariable("id")int id, RedirectAttributes redirectAttributes){
		Order order =daoOrder.huydon(id);
		order.setStatus(5);
		String user=order.getAccount().getUsername();
		daoOrder.save(order);
		redirectAttributes.addAttribute("username", user);
		return "redirect:/myAcc/historyOrder/{username}";
	}

	@PostMapping("/search")
	public String search(Model m,@RequestParam("month") String month,@RequestParam("month2") String month2){
		int startMonthInt = Integer.parseInt(month.split("-")[1]);
		int startYear = Integer.parseInt(month.split("-")[0]);

		int endMonthInt = Integer.parseInt(month2.split("-")[1]);
		int endYear = Integer.parseInt(month2.split("-")[0]);

		List<Order> or=daoOrder.findBetweenMonthYear(startMonthInt,startYear,endMonthInt,endYear);
		m.addAttribute("thongke",or);
		m.addAttribute("startMonthInt",startMonthInt);
		m.addAttribute("startYear",startYear);
		m.addAttribute("endMonthInt",endMonthInt);
		m.addAttribute("endYear",endYear);

		return "/admin/dashboard";
	}
	
}
