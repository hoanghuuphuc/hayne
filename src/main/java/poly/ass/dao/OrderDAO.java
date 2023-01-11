package poly.ass.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import poly.ass.entity.Account;
import poly.ass.entity.Order;

public interface OrderDAO extends JpaRepository<Order, Integer> {
	
	Page<Order> findByAccount(Account account, Pageable pageable);
	@Query("select p from Order p where p.id =?1 ")
	Order huydon(int id);

	@Query("select p from Order p where month(p.createDate) =?1 and year(p.createDate) =?2")
	List<Order> findMonthYear(int month,int year);

	@Query("select p from Order p where month(p.createDate) between ?1 and ?3 and year(p.createDate) between ?2 and ?4")
	List<Order> findBetweenMonthYear(int startMonth,int startYear, int endMonth,int endYear);

	
}
