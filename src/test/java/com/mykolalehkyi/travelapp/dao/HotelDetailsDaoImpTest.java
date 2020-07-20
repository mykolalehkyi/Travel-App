package com.mykolalehkyi.travelapp.dao;

import ch.vorburger.mariadb4j.junit.MariaDB4jRule;
import org.junit.BeforeClass;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.junit4.SpringRunner;

public class HotelDetailsDaoImpTest {

    @Rule
    public MariaDB4jRule dbRule = new MariaDB4jRule(0); //port 0 means select random available port


    @Test
    public void checkOrderOverlapping() {
        System.out.println(dbRule.getURL());
    }
}