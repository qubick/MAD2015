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

        TextView feeling = (TextView)findViewById(R.id.feelingText);
        Spinner moodSpinner = (Spinner)findViewById(R.id.spinner);
        String moodText = String.valueOf(moodSpinner.getSelectedItem());
        feeling.setText("I'm in a" + moodText + " mood!");


        String checkbox_string = "";
        CheckBox check1 = (CheckBox) findViewById(R.id.checkBox1);
        boolean checked1 = check1.isChecked();
        if(checked1){
            checkbox_string += " enlightened";
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

        RadioGroup yoga = (RadioGroup) findViewById(R.id.yoga_type);
        String yogatype;
        int yoga_id = yoga.getCheckedRadioButtonId();
        switch(yoga_id){
            case -1:
                yogatype="no";
                break;
            case R.id.radioButton1:
                yogatype="Yin";
                break;
            case R.id.radioButton2:
                yogatype="Bikram";
                break;
            case R.id.radioButton3:
                yogatype="Hatha";
                break;
            default:
                yogatype="no";
        }

        String meditate_string = "";
        Switch meditate_switch = (Switch) findViewById(R.id.switch1);
        boolean meditate = meditate_switch.isChecked();
        if(meditate){
            meditate_string = "and meditates with " + yogatype;
        }

        //img
        ImageView emotion = (ImageView) findViewById(R.id.imageView);
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
        feeling.setText("I am in a " + checkbox_string + moodText + " person" + meditate_string);

    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }
}
