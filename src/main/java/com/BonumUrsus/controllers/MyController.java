package com.BonumUrsus.controllers;

import com.BonumUrsus.dao.CustomerDAO;
import com.BonumUrsus.entityDB.Customer;
import com.BonumUrsus.services.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class MyController {

    @Autowired
    private CustomerService customerService;

    @GetMapping(value = "/start")
    public String getHomePage(Model model){
        List<Customer> customers = customerService.getCustomers();

        model.addAttribute("customers", customers);
        return "home-page";
    }

    @GetMapping(value = "/addCustomerForm")
    public String getAddCustomerForm(Model model){
        Customer customer = new Customer();
        model.addAttribute("customer", customer);
        return "customerForm";
    }
    @GetMapping(value = "/showFormForUpdate")
    public String getShowFormForUpdate(@RequestParam("customerId") int id, Model model){
        Customer customer = customerService.getCustomer(id);
        model.addAttribute("customer", customer);
        return "customerForm";
    }

    @PostMapping("/saveCustomer")
    public String saveCustomer(@ModelAttribute("customer") Customer customer){
        customerService.saveCustomer(customer);
        return "redirect:/start";
    }
    @GetMapping("/deleteCustomer")
    public String deleteCustomer(@RequestParam("customerId") int id){
        customerService.deleteCustomer(id);
        return "redirect:/start";
    }
    @GetMapping("/search")
    public String search(@RequestParam("searchName") String name, Model model){
        List<Customer> customers = customerService.searchCustomer(name);

        model.addAttribute("customers", customers);
        return "home-page";
    }


}
