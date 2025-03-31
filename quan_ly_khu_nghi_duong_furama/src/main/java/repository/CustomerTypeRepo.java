package repository;

import model.CustomerType;
import util.BaseRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerTypeRepo implements ICustomerTypeRepo{
    private final String SELECT_ALL = "select * from loai_khach";

    @Override
    public List<CustomerType> findAll() {
        List<CustomerType> customerTypeList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                CustomerType customerType = new CustomerType(id, name);
                customerTypeList.add(customerType);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return customerTypeList;
    }
}
