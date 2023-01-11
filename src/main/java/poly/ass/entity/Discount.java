package poly.ass.entity;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@Entity
@Table(name = "discount")
public class Discount {
    @Id
    int id;
    String mgg;
    Float discount;
    int quantity;
}
