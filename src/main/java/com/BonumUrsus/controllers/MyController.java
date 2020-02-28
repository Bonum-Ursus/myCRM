package com.BonumUrsus.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/")
public class MyController {
    @RequestMapping(value = "/start")
    public String getHomePage(Model model){
        return "home-page";
    }
}
