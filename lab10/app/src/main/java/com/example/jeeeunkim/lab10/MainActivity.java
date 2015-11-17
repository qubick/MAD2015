package com.example.jeeeunkim.lab10;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Spinner;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    private Coffeshop myCoffeeShop = new Coffeshop();

    public void findCoffee(View view){
        Spinner crowdSpinner = (Spinner)findViewById(R.id.spinner);
        String crowd = String.valueOf(crowdSpinner.getSelectedItem());
        myCoffeeShop.setCoffeeShop(crowd);

        String suggestedCoffeeShop = myCoffeeShop.getCoffeeShop();
        String suggestedCoffeeShopURL = myCoffeeShop.getCoffeeShopURL();
        int suggestedCoffeeShopImg = myCoffeeShop.getCoffeeShopImage();

        System.out.println(suggestedCoffeeShop);
        System.out.println(suggestedCoffeeShopURL);

    }
}
