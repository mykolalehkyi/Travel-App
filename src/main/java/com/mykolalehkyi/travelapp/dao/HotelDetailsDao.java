package com.mykolalehkyi.travelapp.dao;

import com.mykolalehkyi.travelapp.model.Hotel;
import com.mykolalehkyi.travelapp.model.Room;

import java.util.List;

public interface HotelDetailsDao {
    Hotel findHotelByName(String name);
    void save(Hotel hotel);
    List<Hotel> loadAllHotels();
    List<Room> loadAllHotelRooms(String hotelName);
    List<String> selectDistinctCountries();
    List<Hotel> selectHotelsByNameAndByCountryAndStars(String hotelName, String country,Integer stars);
}
