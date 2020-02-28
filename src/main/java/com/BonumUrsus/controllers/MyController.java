package com.BonumUrsus.controllers;

import com.BonumUrsus.dao.CustomerDAO;
import com.BonumUrsus.entityDB.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping(value = "/")
public class MyController {

    @Autowired
    private CustomerDAO customerDAO;

    @RequestMapping(value = "/start")
    public String getHomePage(Model model){
        List<Customer> customers = customerDAO.getCustomers();

        model.addAttribute("customers", customers);
        return "home-page";
    }
}
