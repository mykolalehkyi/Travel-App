package com.mykolalehkyi.travelapp.controller;

import java.security.Principal;

import com.mykolalehkyi.travelapp.dao.HotelDetailsDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainContoller {

  @Autowired
  HotelDetailsDao hotelDetailsDao;

  @GetMapping("/")
  public String index(Model model, Principal principal,
                      @RequestParam(required=false,name="hotelName") String hotelName,
                      @RequestParam(required=false,name="country") String country,
                      @RequestParam(required=false,name="stars") Integer stars) {
    model.addAttribute("message", "You are logged in as " + principal.getName());
    model.addAttribute("countries",hotelDetailsDao.selectDistinctCountries());
    model.addAttribute("hotels", hotelDetailsDao.selectHotelsByNameAndByCountryAndStars(hotelName,country, stars));
//      model.addAttribute("hotels", hotelDetailsDao.loadAllHotels());
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
