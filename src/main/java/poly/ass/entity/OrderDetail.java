package poly.ass.entity;

import java.io.Serializable;

import javax.persistence.*;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "Orderdetails")
public class OrderDetail implements Serializable {
	/**
	 *   
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	@Column(name = "Price")
	Double price;
	@Column(name = "Quantity")
	Integer quantity;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "Productid")
	Product product;
	String Size;
	@ManyToOne
	@JoinColumn(name = "Orderid")
	Order order;
	
	public OrderDetail(Double price, Integer quantity, Product product, Order order,String Size) {
		super();
		this.price = price;
		this.quantity = quantity;
		this.product = product;
		this.order = order;
		this.Size=Size;
	}

	
}
