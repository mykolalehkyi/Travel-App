package com.mykolalehkyi.travelapp.dao;

import com.mykolalehkyi.travelapp.model.Authorities;
import com.mykolalehkyi.travelapp.model.Hotel;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.mykolalehkyi.travelapp.model.User;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashSet;
import java.util.List;

@Repository
@Transactional
public class UserDetailsDaoImp implements UserDetailsDao {

  @Autowired
  private SessionFactory sessionFactory;
  @Autowired
  private BCryptPasswordEncoder bCryptPasswordEncoder;

  @Override
  public User findUserByUsername(String username) {
    return sessionFactory.getCurrentSession().get(User.class, username);
  }

  @Override
  public void save(User user) {
    user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
    user.setEnabled(true);
    Authorities authority= new Authorities();
    authority.setAuthority("ROLE_USER");
    authority.setUser(user);
    HashSet<Authorities> authorities = new HashSet<>();
    authorities.add(authority);
    user.setAuthorities(authorities);
    sessionFactory.getCurrentSession().save(user);
  }

  @Override
  public List<User> loadAllUsers() {
    Criteria criteria=sessionFactory.getCurrentSession().createCriteria(User.class);
    return criteria.list();
  }

  @Override
  public List<User> loadAllUsersWithUsername(String username) {
    Criteria criteria=sessionFactory.getCurrentSession().createCriteria(User.class);
    if (username!=null && !username.isEmpty())
      criteria.add(Restrictions.ilike(  "username","%"+username+"%"));
    return criteria.list();
  }
}
