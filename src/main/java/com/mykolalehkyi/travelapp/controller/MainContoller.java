package com.mykolalehkyi.travelapp.controller;

import java.security.Principal;
import java.sql.Date;

import com.mykolalehkyi.travelapp.dao.HotelDetailsDao;
import com.mykolalehkyi.travelapp.dao.UserDetailsDao;
import com.mykolalehkyi.travelapp.model.Hotel;
import com.mykolalehkyi.travelapp.model.Order;
import com.mykolalehkyi.travelapp.model.Room;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class MainContoller {

  @Autowired
  HotelDetailsDao hotelDetailsDao;

  @Autowired
  private UserDetailsDao userDetailsDao;

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

  @GetMapping("/hotel/{hotelName}/{roomName}")
  public String hotelRoomBooking(Model model, Principal principal,
                      @PathVariable("hotelName") String hotelName,
                      @PathVariable("roomName") String roomName) {
    model.addAttribute("message", "You are logged in as " + principal.getName());
    model.addAttribute("hotel", hotelDetailsDao.findHotelByName(hotelName));
    model.addAttribute("room", hotelDetailsDao.findHotelRoomByName(hotelName,roomName));
    return "hotelRoomBooking";
  }

  @PostMapping("/hotel/{hotelName}/{roomName}")
  public String bookRoom(Model model, Principal principal,
                         @PathVariable("hotelName") String hotelName,
                         @PathVariable("roomName") String roomName,
                         @RequestParam(required=false,name="beginDate") Date dateBegin,
                         @RequestParam(required=false,name="endDate") Date dateEnd) {
    if (dateBegin!=null && dateEnd!=null){
      Order order = new Order();
      order.setDateBegin(dateBegin);
      order.setDateEnd(dateEnd);
      Room hotelRoom = hotelDetailsDao.findHotelRoomByName(hotelName, roomName);
      order.setRoom(hotelRoom);
      order.setUser(userDetailsDao.findUserByUsername(principal.getName()));
      order.setPrice(hotelRoom.getPrice());
      if (hotelDetailsDao.checkOrderOverlapping(order,hotelRoom)){
        hotelDetailsDao.save(order);
        model.addAttribute("resultOperation","Order saved successfully");
      } else{
        model.addAttribute("resultOperation","Fail. This days is occupied");
      }
    }
    else {
      model.addAttribute("resultOperation","Order save failed");
    }
    return hotelRoomBooking(model,principal,hotelName,roomName);
  }

  @GetMapping("/management")
  public String management(Model model, Principal principal) {
    model.addAttribute("message", "You are logged in as " + principal.getName());
    model.addAttribute("hotelsNames", hotelDetailsDao.selectNamesOfHotels());
    return "management";
  }

  @GetMapping("/management/users")
  public String users(Model model, Principal principal,
                      @RequestParam(required=false,name="userName") String userName) {
    model.addAttribute("message", "You are logged in as " + principal.getName());
    model.addAttribute("users", userDetailsDao.loadAllUsersWithUsername(userName));
    return "users";
  }

  @GetMapping("/management/user/{userName}")
  public String userOrders(Model model, Principal principal,
                      @PathVariable("userName") String userName) {
    model.addAttribute("message", "You are logged in as " + principal.getName());
    model.addAttribute("user", userDetailsDao.findUserByUsername(userName));
    model.addAttribute("orders",hotelDetailsDao.loadAllUserOrders(userDetailsDao.findUserByUsername(userName)));
    return "userOrders";
  }

  @PostMapping("/management/addHotel")
  public String addHotel(Model model, Principal principal,
                         @RequestParam(required=false,name="hotelName") String hotelName,
                         @RequestParam(required=false,name="country") String country,
                         @RequestParam(required=false,name="stars") Integer stars,
                         @RequestParam(required=false,name="description") String description) {
    if (hotelName!=null && !hotelName.isEmpty() &&
            country!=null && !country.isEmpty() &&
            description!=null && !description.isEmpty() &&
            stars!=null){
      Hotel hotel=new Hotel();
      hotel.setName(hotelName);
      hotel.setCountry(country);
      hotel.setStars(stars);
      hotel.setDescription(description);
      hotelDetailsDao.save(hotel);
      model.addAttribute("resultOperation","Hotel added successfully");
    }
    else{
      model.addAttribute("resultOperation","Something is wrong.");
    }
    return management(model,principal);
  }

  @PostMapping("/management/addHotelRoom")
  public String addHotelRoom(Model model, Principal principal,
                        @RequestParam(required=false,name="hotelName") String hotelName,
                        @RequestParam(required=false,name="name") String roomName,
                        @RequestParam(required=false,name="description") String description,
                        @RequestParam(required=false,name="price") Double price) {
    if (roomName!=null && !roomName.isEmpty() &&
            description!=null && !description.isEmpty() &&
            price!=null){
      Room  room = new Room();
      room.setName(roomName);
      room.setDescription(description);
      room.setPrice(price);
      room.setHotel(hotelDetailsDao.findHotelByName(hotelName));
      hotelDetailsDao.save(room);
      model.addAttribute("resultOperation","Room added successfully");
    }
    else{
      model.addAttribute("resultOperation","Something is wrong.");
    }
    return management(model,principal);
  }
}
