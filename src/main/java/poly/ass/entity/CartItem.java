package poly.ass.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartItem {
	private String key;
	Integer productId;
	String productName;
	double price;
	int quantity = 1;
	String image;
	String Size;

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}
}
