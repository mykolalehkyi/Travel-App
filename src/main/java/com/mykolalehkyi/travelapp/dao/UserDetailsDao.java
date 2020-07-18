package com.mykolalehkyi.travelapp.dao;

import com.mykolalehkyi.travelapp.model.Hotel;
import com.mykolalehkyi.travelapp.model.User;

import java.util.List;

public interface UserDetailsDao {
  User findUserByUsername(String username);
  void save(User user);
  List<User> loadAllUsers();
}
