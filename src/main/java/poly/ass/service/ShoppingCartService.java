	package poly.ass.service;

	import java.util.Collection;
	import java.util.HashMap;
	import java.util.List;
	import java.util.Map;
	import java.util.Optional;

	import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.data.domain.Example;
	import org.springframework.data.domain.Page;
	import org.springframework.data.domain.Pageable;
	import org.springframework.data.domain.Sort;
	import org.springframework.stereotype.Service;
	import org.springframework.web.context.annotation.SessionScope;

	import poly.ass.dao.OrderDetailDAO;
	import poly.ass.dao.ProductDAO;
	import poly.ass.dao.ShoppingCartDAO;
	import poly.ass.entity.CartItem;
	import poly.ass.entity.Discount;

	@SessionScope
	@Service
	public class ShoppingCartService implements ShoppingCartDAO {
		private Map<String, CartItem> map = new HashMap<>();

		@Autowired
		OrderDetailDAO dao;

		@Autowired
		ProductDAO daoP;

		@Override
		public Collection<CartItem> getItems() {
			// TODO Auto-generated method stub
			return map.values();
		}
		public void applydiscout(Discount discount){
			for (CartItem item: map.values()){
				item.setPrice(item.getPrice()-discount.getDiscount());
			}
		}


		@Override
		public void add(CartItem item) {
			// them san pham vao gio hang dua vao ID
			String key = item.getProductId() + "_" + item.getSize(); // tạo khóa duy nhất cho sản phẩm
			if (map.containsKey(key)) { // nếu sản phẩm đã tồn tại trong giỏ hàng
				CartItem existingItem = map.get(key); // lấy sản phẩm hiện tại ra
				existingItem.setQuantity(existingItem.getQuantity() + item.getQuantity()); // tăng số lượng lên 1
			} else {
				item.setKey(key);
				map.put(key, item);
			}


		}

		@Override
		public void remove(String key) {
			// Xoa san pham trong gio hang theo ID
			map.remove(key);
		}

		@Override
		public CartItem update(String key, int qty) {
			// Cap nhat so luong theo ID
			CartItem item = map.get(key);
			if (item != null) {
				item.setQuantity(qty
				);
				if (item.getQuantity() <= 0) {
					map.remove(key);
				}
			}return item;
		}

		@Override
		public void clear() {
			// Clear gio hang
			map.clear();
		}

		@Override
		public int getCount() {
			int count = 0;
			for (CartItem item : map.values()) {
				count += item.getQuantity();
			}
			return count;
		}

		@Override
		public double getAmount() {
			double total = 0;
			for (CartItem item : map.values()) {
				total += item.getQuantity() * item.getPrice();
			}
			return total;
		}

	}
