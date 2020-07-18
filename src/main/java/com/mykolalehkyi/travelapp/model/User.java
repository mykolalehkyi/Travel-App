package com.mykolalehkyi.travelapp.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;

@Entity
@Table(name = "USERS")
public class User {
  @Id
  @Column(name = "USERNAME")
  private String username;

  @Column(name = "FIRSTNAME")
  private String firstname;

  @Column(name = "LASTNAME")
  private String lastname;

  @Column(name = "EMAIL")
  private String email;

  @Transient
  private String passwordConfirm;

  @Column(name = "PASSWORD", nullable = false)
  private String password;

  @Column(name = "ENABLED", nullable = false)
  private boolean enabled;

  @OneToMany(cascade = CascadeType.ALL, mappedBy = "user")
  private Set<Authorities> authorities = new HashSet<>();

  @OneToMany(mappedBy = "user")
  private Set<Order> orders = new HashSet<>();

  public User() {
  }



  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public boolean isEnabled() {
    return enabled;
  }

  public void setEnabled(boolean enabled) {
    this.enabled = enabled;
  }

  public String getFirstname() {
    return firstname;
  }

  public void setFirstname(String firstname) {
    this.firstname = firstname;
  }

  public String getLastname() {
    return lastname;
  }

  public void setLastname(String lastname) {
    this.lastname = lastname;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getPasswordConfirm() {
    return passwordConfirm;
  }

  public void setPasswordConfirm(String passwordConfirm) {
    this.passwordConfirm = passwordConfirm;
  }

  public Set<Authorities> getAuthorities() {
    return authorities;
  }

  public void setAuthorities(Set<Authorities> authorities) {
    this.authorities = authorities;
  }


}
