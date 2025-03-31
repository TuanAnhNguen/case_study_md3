package service;

import model.CustomerType;
import repository.CustomerTypeRepo;

import java.util.List;

public class CustomerTypeService implements ICustomerTypeService{
    private CustomerTypeRepo customerTypeRepo  = new CustomerTypeRepo();

    @Override
    public List<CustomerType> findAll() {
        return customerTypeRepo.findAll();
    }
}
