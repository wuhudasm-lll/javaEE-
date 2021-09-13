package com.company.Movie;

import java.sql.Time;

public class Movie {
    public String name;
    public String movietime;
    public Float price;
    public String country;
    public String style;
    public String effect;
    public Movie(String name, String movietime, Float price, String country, String style, String effect) {
        this.name = name;
        this.movietime=movietime;
        this.price=price;
        this.country=country;
        this.style=style;
        this.effect =effect;
    }
}
