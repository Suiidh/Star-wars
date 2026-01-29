package com.esgi.starwars.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "vaisseaux")
public class ESGIVaisseaux {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String description;
    private float price;
    private int power;
    private int speed;
    private int armor;
    private String type;
    private String faction;

    public ESGIVaisseaux() {
    }

    public ESGIVaisseaux(Long id, String name, String description, float price) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.power = 75;
        this.speed = 75;
        this.armor = 75;
        this.type = "Générique";
        this.faction = "Neutre";
    }

    public ESGIVaisseaux(String name, String description, float price) {
        this.name = name;
        this.description = description;
        this.price = price;
        this.power = 75;
        this.speed = 75;
        this.armor = 75;
        this.type = "Générique";
        this.faction = "Neutre";
    }

    public ESGIVaisseaux(Long id, String name, String description, float price,
            int power, int speed, int armor, String type, String faction) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.power = power;
        this.speed = speed;
        this.armor = armor;
        this.type = type;
        this.faction = faction;
    }

    public ESGIVaisseaux(String name, String description, float price,
            int power, int speed, int armor, String type, String faction) {
        this.name = name;
        this.description = description;
        this.price = price;
        this.power = power;
        this.speed = speed;
        this.armor = armor;
        this.type = type;
        this.faction = faction;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getPower() {
        return power;
    }

    public void setPower(int power) {
        this.power = power;
    }

    public int getSpeed() {
        return speed;
    }

    public void setSpeed(int speed) {
        this.speed = speed;
    }

    public int getArmor() {
        return armor;
    }

    public void setArmor(int armor) {
        this.armor = armor;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getFaction() {
        return faction;
    }

    public void setFaction(String faction) {
        this.faction = faction;
    }

    @Override
    public String toString() {
        return "ESGIVaisseaux{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", price=" + price +
                ", power=" + power +
                ", speed=" + speed +
                ", armor=" + armor +
                ", type='" + type + '\'' +
                ", faction='" + faction + '\'' +
                '}';
    }
}
