package com.example.jeeeunkim.lab10;

/**
 * Created by JeeeunKim on 11/17/15.
 */
public class Coffeshop {
    private String coffeeShop;
    private String coffeeShopURL;
    private int image;

    private void setCoffeeInfo(String coffeeCrowd){
        switch (coffeeCrowd){
            case "College":
                coffeeShop = "Trident";
                coffeeShopURL="http://tridentcafe.comm";
                image = R.drawable.trident;
                break;
            case "Hippie":
                coffeeShop = "Sip Coffee";
                coffeeShopURL = "http://sipboulder.com";
                image = R.drawable.trident;
                break;
            case "Office Worker":
                coffeeShop = "OZO";
                coffeeShopURL = "http://ozocoffee.com";
                image = R.drawable.ozo;
                break;
            case "Atheletes":
                coffeeShop = "RedRock Coffeehouse";
                coffeeShopURL = "http://redrockboulder.com";
                image = R.drawable.redrock;
                break;
            case "Poetry":
                coffeeShop = "Innisfree";
                coffeeShopURL = "http://innisfreepoetry.com";
                image = R.drawable.innisfree;
                break;
            case "Popular":
                coffeeShop = "Amante";
                coffeeShopURL = "http://amantecoffee.com";
                image = R.drawable.amante;
                break;
            default:
                coffeeShop = "Starbucks";
                coffeeShopURL = "http://starbucks.com";
                image = R.drawable.starbucks;
                break;
        }
    }

    public  void setCoffeeShop(String coffeeCrowd) {
        setCoffeeInfo(coffeeCrowd);
    }

    public void setCoffeeShopURL(String coffeeCrowd) {
        setCoffeeInfo(coffeeCrowd);
    }

    public void setCoffeeShopImg(String coffeeCrowd) {
        setCoffeeInfo(coffeeCrowd);
    }

    public String getCoffeeShop(){
        return coffeeShop;
    }

    public String getCoffeeShopURL(){
        return coffeeShopURL;
    }

    public int getCoffeeShopImage(){
        return image;
    }
}
