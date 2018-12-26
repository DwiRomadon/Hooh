package com.example.asepfathurrahman.blacktaste;

import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.CardView;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;

import com.example.asepfathurrahman.blacktaste.session.SessionManager;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class MainActivity extends AppCompatActivity {

    CardView PesanCard, DaftarCard, LoginCard;

    private SessionManager session;
    private ProgressDialog pDialog;

    SharedPreferences prefs;
    String id       ;
    String namaKar  ;
    String userNmae ;
    String jabatan  ;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Session manager
        session = new SessionManager(getApplicationContext());

        //Session Login
        if(session.isLoggedIn()){
            prefs = getSharedPreferences("UserDetails",
                    Context.MODE_PRIVATE);
             id       = prefs.getString("id","");
             namaKar  = prefs.getString("namaKar","");
             userNmae = prefs.getString("userName", "");
             jabatan  = prefs.getString("jabatan", "");
        }

        PesanCard = (CardView) findViewById(R.id.pesan_card);
        DaftarCard = (CardView) findViewById(R.id.daftar_card);
        LoginCard = (CardView) findViewById(R.id.login_card);

        PesanCard.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                final Dialog dialog = new Dialog(MainActivity.this);
                dialog.setContentView(R.layout.input_nomer_meja);
                Button btnInput = dialog.findViewById(R.id.button_input_meja);
                Button btnBatal = dialog.findViewById(R.id.button_batal_input);
                btnInput.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        startActivity(new Intent(MainActivity.this, DaftarMenu.class));
                    }
                });
                btnBatal.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        dialog.dismiss();
                    }
                });
                dialog.show();
            }
        });

        DaftarCard.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(MainActivity.this, DaftarPesanan.class));
            }
        });


        LoginCard.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                session.setLogin(false);
                session.setSkip(false);
                session.setSessid(0);

                // Launching the login activity
                Intent intent = new Intent(MainActivity.this, LoginActivity.class);
                startActivity(intent);
                finish();
            }
        });
    }

}
