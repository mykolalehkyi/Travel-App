package com.mykolalehkyi.travelapp.dao;

import com.mykolalehkyi.travelapp.model.Hotel;
import com.mykolalehkyi.travelapp.model.Room;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class HotelDetailsDaoImp implements HotelDetailsDao{
    @Autowired
    private SessionFactory sessionFactory;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public Hotel findHotelByName(String name) {
        return sessionFactory.getCurrentSession().get(Hotel.class, name);
    }

    @Override
    public void save(Hotel hotel) {
        sessionFactory.getCurrentSession().save(hotel);
    }

    @Override
    public List<Hotel> loadAllHotels() {
        return sessionFactory.getCurrentSession().createQuery("from Hotel",Hotel.class).list();
    }

    @Override
    public List<Room> loadAllHotelRooms(String hotelName) {
        Query<Room> query = sessionFactory.getCurrentSession().createQuery("from Room where hotel_name = :hotel", Room.class);
        query.setString("hotel",hotelName);
        return query.list();

    }

    @Override
    public List<String> selectDistinctCountries() {
        Criteria crit=sessionFactory.getCurrentSession().createCriteria(Hotel.class);
        crit.setProjection(Projections.distinct(Projections.property("country")));
        List<String> result = crit.list();
        return result;
    }

    @Override
    public List<Hotel> selectHotelsByNameAndByCountryAndStars(String hotelName, String country, Integer stars) {
        Criteria crit=sessionFactory.getCurrentSession().createCriteria(Hotel.class);
        if (hotelName != null && !hotelName.isEmpty())
        crit.add(Restrictions.ilike("name", "%"+hotelName+"%"));
        if (country != null && !country.isEmpty())
        crit.add(Restrictions.eq("country", country));
        if (stars != null)
            crit.add(Restrictions.eq("stars", stars));
        return crit.list();
    }
}
