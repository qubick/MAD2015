package com.example.jeeeunkim.lab9;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity { //controller view in iOS
    public void findMood(View view){
        TextView feeling = (TextView)findViewById(R.id.feelingText);
        feeling.setText("I'm in the mood to create Android apps!");


    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }
}
