package poly.ass.service;

import org.springframework.beans.factory.annotation.Autowired;
import poly.ass.dao.OrderDetailDAO;
import poly.ass.dao.ProductDAO;
import poly.ass.entity.CartItem;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class NewShoppingCartService {




    private Map<String, CartItem> map = new HashMap<>();

    public void add(CartItem item) {

    }

    public void remove(String key) {
        map.remove(key);
    }

    public void update(String key, int quantity) {
        CartItem item = map.get(key);
        if (item != null) {
            item.setQuantity(quantity);
            if (item.getQuantity() <= 0) {
                map.remove(key);
            }
        }
    }

    public void clear() {
        map.clear();
    }
}

