	package poly.ass.controller;

	import java.io.File;
	import java.util.List;

	import javax.mail.MessagingException;
	import javax.mail.internet.MimeMessage;
	import javax.servlet.http.HttpServletRequest;

	import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.mail.javamail.JavaMailSender;
	import org.springframework.mail.javamail.MimeMessageHelper;
	import org.springframework.stereotype.Controller;
	import org.springframework.ui.Model;
	import org.springframework.validation.BindingResult;
	import org.springframework.validation.ObjectError;
	import org.springframework.validation.annotation.Validated;
	import org.springframework.web.bind.annotation.GetMapping;
	import org.springframework.web.bind.annotation.ModelAttribute;
	import org.springframework.web.bind.annotation.PostMapping;
	import org.springframework.web.bind.annotation.RequestMapping;
	import org.springframework.web.bind.annotation.RequestParam;

	import org.springframework.web.servlet.mvc.support.RedirectAttributes;
	import poly.ass.dao.*;
	import poly.ass.entity.*;
	import poly.ass.service.MailerServiceImpl;
	import poly.ass.service.SessionService;
	import poly.ass.service.ShoppingCartService;

	@Controller
	public class CheckOutController {
		@Autowired
		HttpServletRequest request;

		@Autowired
		OrderDAO daoOrder;

		@Autowired
		OrderDetailDAO daoOrderDetail;

		@Autowired
		CategoryDAO daoCategory;

		@Autowired
		ProductDAO daoProduct;

		@Autowired
		ShoppingCartService cart;

		@Autowired
		SessionService session;

		@Autowired
		MailerServiceImpl mailer;
		@Autowired
		DiscountDAO discountDAO;
		@Autowired
		ShoppingCartService shoppingCartService;

		@GetMapping("/cart/checkout")
		public String checkout(
				Model model
				) {
			model.addAttribute("TitlePage", "CheckOut Details");
			model.addAttribute("view", "/views/user/checkoutDetails.jsp");

			List<Category> categories = daoCategory.findAll();
			model.addAttribute("categories", categories);

			model.addAttribute("cartItems", cart.getItems());
			model.addAttribute("Count", cart.getCount());
			model.addAttribute("Amount", cart.getAmount());


			Order order = new Order();
			model.addAttribute("order", order);

			return "index";
		}
		@PostMapping("/giamgia")
		public String giamgia(Model model,@RequestParam("giamgia")String giamgia){
			Discount discount =discountDAO.danhsachMGG(giamgia);
			if (discount != null ) {
				shoppingCartService.applydiscout(discount);
				discount.setQuantity(discount.getQuantity() -1);
				discountDAO.save(discount);
			}


			return "redirect:/cart/checkout";
		}


			@PostMapping("/cart/checkout")
			public String postCheckOut(
					Model model,
					@Validated @ModelAttribute("order") Order order,
					BindingResult result,RedirectAttributes redirectAttributes,@RequestParam("tinh")String tinh
					,@RequestParam("huyen")String huyen,@RequestParam("xa")String xa
					) {
				model.addAttribute("TitlePage", "CheckOut Details");
				model.addAttribute("view", "/views/user/checkoutDetails.jsp");
				
					try {
						String diachi =order.getAddress();
						String newaddress = diachi +", " +xa +", "+huyen+ ", Tỉnh"+tinh;
						order.setAddress(newaddress);
						
						System.out.println(newaddress);

						//tao order moi
						daoOrder.save(order);

						//luu du lieu order detail
						for (CartItem item : cart.getItems()) {
		//					System.out.println("Save orderDtails: " + item);
							Order o = daoOrder.getById(order.getId());
							Product product = daoProduct.getById(item.getProductId());
							//tru so luong


							daoOrderDetail.save(new OrderDetail(item.getPrice(), item.getQuantity(), product, o,item.getSize()));
							Product p =daoProduct.layid(item.getProductId());
							int total =p.getTotal();
							p.setTotal(total- item.getQuantity());

							daoProduct.save(p);
						}

	//					gui mail cho nguoi dat

						//xoa tat ca san pham trong gio hang
						cart.getItems().clear();
	//					mailer.send(
	//							order.getAccount().getEmail(),
	//							"Thông báo đặt hàng Thành Công từ FOUR-N",
	//							"<h3>Chúc mừng bạn đã đặt hàng thành công từ ABC Shop ASS_SOF3021</h3> <br>"
	//									+ "Xem chi tiết Order: "
	//									+ "<a href='http://localhost:8080/myAcc/historyOrder/"+ order.getAccount().getUsername() +"'>tại đây</a>" );

						redirectAttributes.addFlashAttribute("successMessage", "Đặt hàng thành công!");
						return "redirect:/myAcc/historyOrder/" + order.getAccount().getUsername();

					} catch (Exception e) {
						// TODO: handle exception
						return "redirect:/cart/checkout";
					}


			}





	}
