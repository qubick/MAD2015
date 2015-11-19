package com.example.jeeeunkim.lab10;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

public class ReceiveCoffeeActivity extends AppCompatActivity {

    private String  coffeeShop;
    private String  coffeeShopURL;
    private int     coffeeShopImg;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_receive_coffee);

        //get intent
        Intent intent = getIntent();
        coffeeShop = intent.getStringExtra("coffeeShopName");
        coffeeShopURL = intent.getStringExtra("coffeeShopURL");
        coffeeShopImg = intent.getIntExtra("coffeeShopImg", 1);

        //update text view
        TextView messageView = (TextView) findViewById(R.id.coffeeShoptextView);
        messageView.setText("You would better to check out " + coffeeShop);

        //update image view
        ImageView logoView = (ImageView) findViewById(R.id.coffeeShopImgView);
        logoView.setImageResource(coffeeShopImg);

    }


    //load implicit activity intent
    public void loadWebSite(View view){
        Intent intent = new Intent(Intent.ACTION_VIEW);
        intent.setData(Uri.parse(coffeeShopURL));
        startActivity(intent);
    }
}
