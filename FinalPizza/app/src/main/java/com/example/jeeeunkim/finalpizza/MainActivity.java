package com.example.jeeeunkim.finalpizza;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.CheckBox;
import android.widget.ImageView;
import android.widget.RadioGroup;
import android.widget.Spinner;
import android.widget.Switch;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    public void buildPizza(View view){

        TextView pizzaTitle = (TextView)findViewById(R.id.pizzaName);
        String pizza_string = pizzaTitle.getText().toString();

        String crusttype = "";
        RadioGroup crust = (RadioGroup) findViewById(R.id.radioCrust);

        int crust_id = crust.getCheckedRadioButtonId();
        switch(crust_id){
            case -1:
                crusttype=" classic basic";
                break;
            case R.id.thin:
                crusttype=" thin";
                break;
            case R.id.thick:
                crusttype=" thick";
                break;
            default:
                crusttype=" classic basic";
        }

        String checkbox_string1 = "";
        CheckBox check1 = (CheckBox) findViewById(R.id.checkBox1);
        boolean checked1 = check1.isChecked();
        if(checked1){
            checkbox_string1 = " pepperoni";
        }

        String checkbox_string2 = "";
        CheckBox check2 = (CheckBox) findViewById(R.id.checkBox2);
        boolean checked2 = check2.isChecked();
        if(checked2){
            checkbox_string2 = " mushroom";
        }

        String checkbox_string3 = "";
        CheckBox check3 = (CheckBox) findViewById(R.id.checkBox3);
        boolean checked3 = check3.isChecked();
        if(checked3){
            checkbox_string3 = " onions";
        }

        String checkbox_string4 = "";
        CheckBox check4 = (CheckBox) findViewById(R.id.checkBox4);
        boolean checked4 = check4.isChecked();
        if(checked4){
            checkbox_string4 = " sausage";
        }

        Spinner sizeSpinner = (Spinner)findViewById(R.id.spinner);
        String sizeText = String.valueOf(sizeSpinner.getSelectedItem());


        String glutenfree_string = ""; //if not on, leave as empty string --> not a glutenfree option
        Switch glutenfree_switch = (Switch) findViewById(R.id.glutenfree_switch);
        boolean glutenfree = glutenfree_switch.isChecked();
        if(glutenfree){
            glutenfree_string = " glutenfree";
        }

        int image;
        //img
        ImageView pizza = (ImageView) findViewById(R.id.imageView);

        if(checked1){
            image = R.drawable.pizza_meat;
        } else if(checked2){
            image = R.drawable.pizza_supreme;
        } else if(checked3){
            image = R.drawable.pizza_veggie;
        } else if(checked4){
            image = R.drawable.pizza_supreme;
        } else {
            image = R.drawable.pizza_supreme;
            System.out.println("This cannot happened");
        }
        pizza.setImageResource(image);


        TextView feeling = (TextView)findViewById(R.id.pizzaExplanation);
        feeling.setText(pizza_string + " is a " + sizeText + " sized" + crusttype + glutenfree_string + " pizza with tooppings of" +
                        checkbox_string1 + checkbox_string2 + checkbox_string3 + checkbox_string4
               );
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }
}
