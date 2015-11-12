package com.example.jeeeunkim.lab9;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Spinner;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.CheckBox;
import android.widget.ImageView;

public class MainActivity extends AppCompatActivity { //controller view in iOS
    public void findMood(View view){
        TextView feeling = (TextView)findViewById(R.id.feelingText);
        Spinner moodSpinner = (Spinner)findViewById(R.id.spinner);
        String moodText = String.valueOf(moodSpinner.getSelectedItem());
        feeling.setText("I'm in a " + moodText + " mood!");

        /*
        if (moodText == "happy"){
            feeling.setText("I am happy too!");
        }
        */

        String checkbox_string = "";
        CheckBox check1 = (CheckBox) findViewById(R.id.checkBox1);
        boolean checked1 = check1.isChecked();
        if(checked1){
            checkbox_string += " sarcastic";
        }

        CheckBox check2 = (CheckBox) findViewById(R.id.checkBox2);
        boolean checked2 = check2.isChecked();
        if(checked2){
            checkbox_string += " conservative";
        }
        CheckBox check3 = (CheckBox) findViewById(R.id.checkBox3);
        boolean checked3 = check3.isChecked();
        if(checked1){
            checkbox_string += " sarcastic";
        }

        CheckBox check4 = (CheckBox) findViewById(R.id.checkBox4);
        boolean checked4 = check4.isChecked();
        if(checked2){
            checkbox_string += " secretive";
        }

        String meditate_string = "";
        Switch meditate_switch = (Switch) findViewById(R.id.switch1);
        boolean meditate = meditate_switch.isChecked();
        if(meditate){
            meditate_string = " and mediates";
        }

        //update mood textview
        feeling.setText("I am in a " + checkbox_string + " person" + meditate_string);

        //img
        ImageView emotion = (ImageView) findViewById(R.id.imageView);
        int image;

        if(moodText.equals("happy")){

        } else if(moodText.equals("gloomy")){
            image = R.drawable.feeling1;
        } else if(moodText.equals("creepy")){
            image = R.drawable.feeling1;
        } else if(moodText.equals("depressed")){
            image = R.drawable.feeling1;
        } else if(moodText.equals("confused")){
            image = R.drawable.feeling1;
        } else if(moodText.equals("sad")){
            image = R.drawable.feeling1;
        } else if(moodText.equals("confused")){
            image = R.drawable.feeling1;
        } else {
            System.out.println("This cannot happened");
        }
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }
}
