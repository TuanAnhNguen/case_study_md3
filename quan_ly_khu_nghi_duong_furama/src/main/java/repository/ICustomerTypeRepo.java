package repository;

import model.CustomerType;

import java.util.List;

public interface ICustomerTypeRepo {
    List<CustomerType> findAll();
}
