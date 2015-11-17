package com.example.jeeeunkim.lab9;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.CheckBox;
import android.widget.ImageView;
import android.widget.RadioGroup;
import android.widget.Spinner;
import android.widget.Switch;
import android.widget.TextView;
//import android.R;

public class MainActivity extends AppCompatActivity { //controller view in iOS
    public void findMood(View view){

        String checkbox_string1 = "";
        CheckBox check1 = (CheckBox) findViewById(R.id.check1);
        boolean checked1 = check1.isChecked();
        if(checked1){
            checkbox_string1 = " enlightened";
        }

        String checkbox_string2 = "";
        CheckBox check2 = (CheckBox) findViewById(R.id.check2);
        boolean checked2 = check2.isChecked();
        if(checked2){
            checkbox_string2 = " conservative";
        }

        String checkbox_string3 = "";
        CheckBox check3 = (CheckBox) findViewById(R.id.check3);
        boolean checked3 = check3.isChecked();
        if(checked3){
            checkbox_string3 = " sarcastic";
        }

        String checkbox_string4 = "";
        CheckBox check4 = (CheckBox) findViewById(R.id.check4);
        boolean checked4 = check4.isChecked();
        if(checked4){
            checkbox_string4 = " secretive";
        }

        RadioGroup yoga = (RadioGroup) findViewById(R.id.yoga_type);
        String yogatype;
        int yoga_id = yoga.getCheckedRadioButtonId();
        switch(yoga_id){
            case -1:
                yogatype="doing nothing";
                break;
            case R.id.radioButton1:
                yogatype="music";
                break;
            case R.id.radioButton2:
                yogatype="sports";
                break;
            case R.id.radioButton3:
                yogatype="reading";
                break;
            default:
                yogatype="doing nothing";
        }

        String meditate_string = "";
        Switch meditate_switch = (Switch) findViewById(R.id.switch1);
        boolean meditate = meditate_switch.isChecked();
        if(meditate){
            meditate_string = " and meditates by " + yogatype;
        }

        //img
        ImageView emotion = (ImageView) findViewById(R.id.imageView);
        Spinner moodSpinner = (Spinner)findViewById(R.id.spinner);
        String moodText = String.valueOf(moodSpinner.getSelectedItem());
        int image;

        if(moodText.equals("happy")){
            image = R.drawable.happy;
        } else if(moodText.equals("gloomy")){
            image = R.drawable.gloomy;
        } else if(moodText.equals("creepy")){
            image = R.drawable.creepy;
        } else if(moodText.equals("depressed")){
            image = R.drawable.depressed;
        } else if(moodText.equals("confused")){
            image = R.drawable.confused;
        } else if (moodText.equals("sad")){
            image = R.drawable.sad;
        } else {
            image = R.drawable.happy;
            System.out.println("This cannot happened");
        }
        emotion.setImageResource(image);
        //update mood textview
        TextView feeling = (TextView)findViewById(R.id.feelingText);
        feeling.setText("I am a " + checkbox_string1 + checkbox_string2 + checkbox_string3 + checkbox_string4
                + " person, in a " + moodText + " mood " + meditate_string);

    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }
}
