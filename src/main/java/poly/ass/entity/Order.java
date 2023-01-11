package poly.ass.entity;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotBlank;

import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;

@Data
@Entity
@Table(name = "Orders")
public class Order implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	@NotBlank
	String phone;
	@NotBlank
	String address;
	String note;
	Integer status = 0;
	@CreationTimestamp
	@Column(name = "Createdate")
	Date createDate = new Date();



	@ManyToOne
	@JoinColumn(name = "Username")
	Account account;
	@OneToMany(mappedBy = "order")
	List<OrderDetail> orderDetails;
	public String getFormattedDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd ");
		return sdf.format(createDate);
	}

}
