package com.beaver.test;

import java.sql.Timestamp;
import java.util.Date;

public class T2 {
    public static void main(String[] args) {

        Date date = new Date();
        System.out.println(date);

        System.out.println(date.getTime());

        System.out.println(new Timestamp(date.getTime()));
    }
}
