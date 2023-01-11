package poly.ass.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import poly.ass.entity.Discount;

public interface DiscountDAO extends JpaRepository<Discount,Integer> {
    @Query("select p from Discount p where p.mgg =?1")
    Discount danhsachMGG(String mgg);
}
