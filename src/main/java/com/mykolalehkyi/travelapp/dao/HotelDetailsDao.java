package com.mykolalehkyi.travelapp.dao;

import com.mykolalehkyi.travelapp.model.Hotel;
import com.mykolalehkyi.travelapp.model.Order;
import com.mykolalehkyi.travelapp.model.Room;
import com.mykolalehkyi.travelapp.model.User;

import java.util.List;

public interface HotelDetailsDao {
    Hotel findHotelByName(String name);
    Room findHotelRoomByName(String hotelName,String roomName);
    void save(Hotel hotel);
    void save(Room room);
    void save(Order order);
    List<Hotel> loadAllHotels();
    List<Room> loadAllHotelRooms(String hotelName);
    List<Order> loadAllUserOrders(User user);
    List<String> selectDistinctCountries();
    List<String> selectNamesOfHotels();
    List<Hotel> selectHotelsByNameAndByCountryAndStars(String hotelName, String country,Integer stars);
    Boolean checkOrderOverlapping(Order order, Room room);
}
