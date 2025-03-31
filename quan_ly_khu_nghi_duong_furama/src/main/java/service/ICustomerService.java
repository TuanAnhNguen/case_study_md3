package service;

import dto.CustomerDto;
import model.Customer;

import java.util.List;

public interface ICustomerService {
    List<CustomerDto> findAll();
    List<CustomerDto> search(String SearchName);
    boolean add(Customer customer);
    boolean deleteById(int id);
    boolean update(int id, Customer customer);
}
