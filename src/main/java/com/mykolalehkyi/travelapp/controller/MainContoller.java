package com.mykolalehkyi.travelapp.controller;

import java.security.Principal;
import java.util.List;

import com.mykolalehkyi.travelapp.dao.HotelDetailsDao;
import com.mykolalehkyi.travelapp.model.Hotel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class MainContoller {

  @Autowired
  HotelDetailsDao hotelDetailsDao;

  @GetMapping("/")
  public String index(Model model, Principal principal) {
    model.addAttribute("message", "You are logged in as " + principal.getName());
    model.addAttribute("hotels", hotelDetailsDao.loadAllHotels());
    model.addAttribute("countries",hotelDetailsDao.selectDistinctCountries());
    return "index";
  }

  @GetMapping("/hotel/{hotelName}")
  public String hotel(Model model, Principal principal,@PathVariable String hotelName) {
    model.addAttribute("message", "You are logged in as " + principal.getName());
    model.addAttribute("hotel", hotelDetailsDao.findHotelByName(hotelName));
    model.addAttribute("rooms", hotelDetailsDao.loadAllHotelRooms(hotelName));
    return "hotel";
  }
}
