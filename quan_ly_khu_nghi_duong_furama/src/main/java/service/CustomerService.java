package service;

import dto.CustomerDto;
import model.Customer;
import repository.CustomerRepository;

import java.util.List;

public class CustomerService implements ICustomerService{
    private static CustomerRepository customerRepository = new CustomerRepository();
    @Override
    public List<CustomerDto> findAll() {
        return customerRepository.findAll();
    }

    @Override
    public List<CustomerDto> search(String SearchName) {
        return customerRepository.search(SearchName);
    }

    @Override
    public boolean add(Customer customer) {
        return customerRepository.add(customer);
    }

    @Override
    public boolean deleteById(int id) {
        return customerRepository.deleteById(id);
    }

    @Override
    public boolean update(int id, Customer customer) {
        return customerRepository.update(id, customer);
    }
}
