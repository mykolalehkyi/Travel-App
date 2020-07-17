package com.mykolalehkyi.travelapp.model;

import javax.persistence.*;

@Entity
@Table(name = "AUTHORITIES")
public class Authorities {

  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  private Integer id;

  @Column(name = "AUTHORITY")
  private String authority;

  @ManyToOne
  @JoinColumn(name = "USERNAME")
  private User user;

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public String getAuthority() {
    return authority;
  }

  public void setAuthority(String authority) {
    this.authority = authority;
  }

  public User getUser() {
    return user;
  }

  public void setUser(User user) {
    this.user = user;
  }

}
