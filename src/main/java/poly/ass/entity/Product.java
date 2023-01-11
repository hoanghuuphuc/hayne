package poly.ass.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

@Data 
@Getter
@Setter
@NoArgsConstructor @AllArgsConstructor
@Entity
@Table(name = "Products")
public class Product implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	@Column(name = "Name")
	@NotBlank
	String name;
	@Column(name = "Image")
	String image;
	@Column(name = "Price")
	@NotNull
	Float price;
	Float prices;
	int total;

	@Transient
	private MultipartFile mulimage;


	@Temporal(TemporalType.DATE)
	@Column(name = "Createdate")
	Date createDate = new Date();
	@Column(name = "Available")
	boolean available;
	@ManyToOne
	@JoinColumn(name = "CategoryID")
	Category category;
	@OneToMany(mappedBy = "product")
	List<OrderDetail> orderDetails;
}
