package repository;

import dto.CustomerDto;
import model.Customer;
import util.BaseRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class CustomerRepository implements ICustomerRepository{
    private final static String SELECT_ALL = "select kh.*, lk.ten_loai_khach from khach_hang kh join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach";
    private final static String ADD_NEW = "insert into khach_hang(ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach) values(?,?,?,?,?,?,?,?)";
    private final static String DELETE_BY_ID = "delete from khach_hang where ma_loai_khach = ?";

    @Override
    public List<CustomerDto> findAll() {
        Connection connection = BaseRepository.getConnectDB();
        List<CustomerDto> customerList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("ma_khach_hang");
                String name = resultSet.getString("ho_ten");
                Date birthday = resultSet.getDate("ngay_sinh");
                boolean gender = resultSet.getBoolean("gioi_tinh");
                String idCard = resultSet.getString("so_cmnd");
                String phone = resultSet.getString("so_dien_thoai");
                String email = resultSet.getString("email");
                String address = resultSet.getString("dia_chi");
                String customerTypeName = resultSet.getString("ten_loai_khach");
                CustomerDto customer = new CustomerDto(id, name, birthday, gender, idCard, phone, email, address,customerTypeName);
                customerList.add(customer);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                connection.close();
            }catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return customerList;
    }

    @Override
    public List<CustomerDto> search(String SearchName) {
//        List<Customer> searchList = new ArrayList<>();
//        for (Customer customer : customers) {
//            if (customer.getName().contains(SearchName)) {
//                searchList.add(customer);
//            }
//        }
        return null;
    }

    @Override
    public boolean add(Customer customer) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(ADD_NEW);
            preparedStatement.setString(1, customer.getName());
            preparedStatement.setDate(2, new java.sql.Date(customer.getBirthday().getTime()));
            preparedStatement.setBoolean(3, customer.isGender());
            preparedStatement.setString(4, customer.getIdCard());
            preparedStatement.setString(5, customer.getPhone());
            preparedStatement.setString(6, customer.getEmail());
            preparedStatement.setString(7, customer.getAddress());
            preparedStatement.setInt(8, customer.getCustomerTypeId());
            int row = preparedStatement.executeUpdate();
            return row == 1;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public boolean deleteById(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_BY_ID);
            preparedStatement.setInt(1, id);
            int effectRow = preparedStatement.executeUpdate();
            return effectRow == 1;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    @Override
    public boolean update(int id, Customer customer) {
        return false;
    }
}
