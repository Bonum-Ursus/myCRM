package com.BonumUrsus.services;

import com.BonumUrsus.entityDB.Customer;

import java.util.List;

public interface CustomerService {
    List<Customer> getCustomers();

    void saveCustomer(Customer customer);
}

