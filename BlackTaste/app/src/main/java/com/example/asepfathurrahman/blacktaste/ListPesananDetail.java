package com.example.asepfathurrahman.blacktaste;

import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.support.v4.content.ContextCompat;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.Toolbar;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Log;
import android.view.Gravity;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.DefaultRetryPolicy;
import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.RetryPolicy;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.example.asepfathurrahman.blacktaste.adapter.AdapterDaftarPesanan;
import com.example.asepfathurrahman.blacktaste.adapter.AdapterDetailTransaksi;
import com.example.asepfathurrahman.blacktaste.data.DetailTransaksi;
import com.example.asepfathurrahman.blacktaste.server.AppController;
import com.example.asepfathurrahman.blacktaste.server.Config_URL;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ListPesananDetail extends AppCompatActivity {

    int socketTimeout = 30000;
    RetryPolicy policy = new DefaultRetryPolicy(socketTimeout,
            DefaultRetryPolicy.DEFAULT_MAX_RETRIES,
            DefaultRetryPolicy.DEFAULT_BACKOFF_MULT);

    private ProgressDialog pDialog;

    private Toolbar mTopToolbar;



    ArrayList<DetailTransaksi> dataNya = new ArrayList<DetailTransaksi>();

    AdapterDetailTransaksi adapter;
    ListView list;

    String idTransaksi;

    Dialog myDialog;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_list_pesanan_detail);

        pDialog = new ProgressDialog(this);
        pDialog.setCancelable(false);

        mTopToolbar = (Toolbar) findViewById(R.id.my_toolbar);
        setSupportActionBar(mTopToolbar);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        getSupportActionBar().setTitle("Detail Pesanan");
        mTopToolbar.setTitleTextColor(ContextCompat.getColor(this, R.color.colorText));


        Intent a    = getIntent();
        idTransaksi = a.getStringExtra("idtransaksi");


        list = (ListView) findViewById(R.id.array_list);
        //dataNya.clear();
        list.setItemsCanFocus(false);
        adapter = new AdapterDetailTransaksi(ListPesananDetail.this, dataNya);
        list.setAdapter(adapter);

        myDialog = new Dialog(this);

        data(idTransaksi);
        fungsiDialog();
    }


    public void data(final String idtransaksi){
        //Tag used to cancel the request
        String tag_string_req = "req";

        pDialog.setMessage("Please Wait.....");
        showDialog();

        StringRequest strReq = new StringRequest(Request.Method.POST,
                Config_URL.listDetail, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                Log.d("Data", "Login Response: " + response.toString());
                hideDialog();
                try {
                    JSONObject jObj = new JSONObject(response);

                    String msg =jObj.getString("msg");

                    if(msg.equals("ok")) {
                        JSONArray data = jObj.getJSONArray("data");
                        for (int i = 0; i < data.length(); i++) {

                            JSONObject obj          = data.getJSONObject(i);
                            String idtransaksii     = obj.getString("id_transaksi");
                            String idMenu           = obj.getString("id_menu");
                            String idtransDetail    = obj.getString("id_transaksi_detail");
                            String nama_menu        = obj.getString("nama_menu");
                            String foto             = obj.getString("foto_menu");
                            String jumlahBeli       = obj.getString("jumlah_beli");
                            String total                   = obj.getString("total");
                            String harga            = obj.getString("harga_menu");
                            String catatan          = obj.getString("catatan_detail");
                            String stok             = obj.getString("stock_menu");
                            String grandtot         = obj.getString("total_bayar");
                            String status           = obj.getString("status");

                            DecimalFormat kursIndonesia = (DecimalFormat) DecimalFormat.getCurrencyInstance();
                            DecimalFormatSymbols formatRp = new DecimalFormatSymbols();

                            formatRp.setCurrencySymbol("");
                            formatRp.setMonetaryDecimalSeparator(',');
                            formatRp.setGroupingSeparator('.');


                            kursIndonesia.setDecimalFormatSymbols(formatRp);

                            if(!status.equals("cancel") && !status.equals("done")){
                                dataNya.add(new
                                        DetailTransaksi(idtransaksii, idMenu, idtransDetail,nama_menu, foto, jumlahBeli, harga, total, catatan, stok, grandtot, status));
                            }
                            //Toast.makeText(getApplicationContext(), "Ini ada data", Toast.LENGTH_LONG).show();
                        }
                    }else {
                        Intent a = new Intent(ListPesananDetail.this, DaftarPesanan.class);
                        startActivity(a);
                        finish();
                    }


                }catch (JSONException e){
                    //JSON error
                    e.printStackTrace();
                }
                adapter.notifyDataSetChanged();
            }
        }, new Response.ErrorListener(){

            @Override
            public void onErrorResponse(VolleyError error){
                Log.e("Data", "Login Error : " + error.getMessage());
                error.printStackTrace();
                hideDialog();
            }
        }){

            @Override
            protected Map<String, String> getParams(){
                Map<String, String> params = new HashMap<String, String>();
                params.put("idtransaksi", idtransaksi);
                return params;
            }
        };

        strReq.setRetryPolicy(policy);
        AppController.getInstance().addToRequestQueue(strReq, tag_string_req);
    }

    private void showDialog() {
        if (!pDialog.isShowing())
            pDialog.show();
    }

    private void hideDialog() {
        if (pDialog.isShowing())
            pDialog.dismiss();
    }


    @Override
    public void onBackPressed() {
        Intent a = new Intent(ListPesananDetail.this, DaftarPesanan.class);
        startActivity(a);
        finish();
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case android.R.id.home:
                onBackPressed();
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }

    public void fungsiDialog(){
        list.setOnItemLongClickListener(new AdapterView.OnItemLongClickListener() {
            @Override
            public boolean onItemLongClick(AdapterView<?> parent, View view, final int position, long id) {
                myDialog.setContentView(R.layout.edit_hapus_pesanan);
                TextView txtclose;
                txtclose =(TextView) myDialog.findViewById(R.id.txtclose);


                EditText namaMakanan = myDialog.findViewById(R.id.namaMakanan);
                final EditText jumbel      = myDialog.findViewById(R.id.jumlahBeli);
                EditText catatan     = myDialog.findViewById(R.id.catatan);
                final EditText harga       = myDialog.findViewById(R.id.harga);
                final EditText totHarga    = myDialog.findViewById(R.id.totalHarga);

                namaMakanan.setText(dataNya.get(position).getNamaMenu());
                namaMakanan.setEnabled(false);
                jumbel.setText(dataNya.get(position).getJumlahBeli());
                catatan.setText(dataNya.get(position).getCatatan());

                harga.setText(dataNya.get(position).getHarga());
                harga.setEnabled(false);
                totHarga.setText(dataNya.get(position).getTotalHarga());
                totHarga.setEnabled(false);

                final Button btnEdit = (Button) myDialog.findViewById(R.id.btnEdit);
                final Button btnEdit2 = (Button) myDialog.findViewById(R.id.btnEdit2);
               //x Toast.makeText(getApplicationContext(), dataNya.get(position).getIdTransaksiDetail(), Toast.LENGTH_LONG).show();


                final String[] text = new String[1];
                final String[] intJumbel = new String[1];
                final String[] intHarga = new String[1];
                final int[] intTotHarga = new int[1];
                jumbel.addTextChangedListener(new TextWatcher() {

                    public void afterTextChanged(Editable s) {}

                    public void beforeTextChanged(CharSequence s, int start, int count, int after) {}

                    public void onTextChanged(CharSequence query, int start, int before, int count) {

                        text[0] = jumbel.getText().toString();
                        if(text[0].equals("")){
                            totHarga.setText("0");
                            totHarga.setEnabled(false);
                        }else {
                            intJumbel[0] = jumbel.getText().toString();
                            intHarga[0] = harga.getText().toString();
                            intTotHarga[0] = Integer.parseInt(intJumbel[0]) * Integer.parseInt(intHarga[0]);
                            totHarga.setText(String.valueOf(intTotHarga[0]));
                            totHarga.setEnabled(false);

                            int hitStok = Integer.parseInt(jumbel.getText().toString());
                            final int stoksUntukEdit = Integer.parseInt(dataNya.get(position).getStok()) - hitStok;

                            int intConvertIntText = Integer.parseInt(text[0]);
                            int intConvertJumbel  = Integer.parseInt(dataNya.get(position).getJumlahBeli());

                            final int grandtotal;

                            if(intConvertIntText > intConvertJumbel){
                                grandtotal =  Integer.parseInt(dataNya.get(position).getGrandTot()) * intConvertIntText;
                                //Toast.makeText(getApplicationContext(), String.valueOf(total), Toast.LENGTH_LONG).show();
                            }else if(intConvertIntText == intConvertJumbel){
                                grandtotal = Integer.parseInt(dataNya.get(position).getGrandTot());
                            }else {

                                //int hargaTotharga = Integer.parseInt(dataNya.get(position).getHarga()) * Integer.parseInt(text[0]);
                                //int hasil         = Integer.parseInt(dataNya.get(position).getGrandTot()) - hargaTotharga;
                                //Toast.makeText(getApplicationContext(), String.valueOf(total), Toast.LENGTH_LONG).show();
                            }

                            btnEdit2.setVisibility(View.GONE);
                            btnEdit.setVisibility(View.VISIBLE);

                            btnEdit.setOnClickListener(new View.OnClickListener() {
                                @Override
                                public void onClick(View v) {

                                    /*editPesanan(dataNya.get(position).getIdTransaksiDetail(),dataNya.get(position).getIdMenu()
                                            ,String.valueOf(stoksUntukEdit),String.valueOf(grandtotal));*/
                                }
                            });
                        }
                    }
                });

                txtclose.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        myDialog.dismiss();
                    }
                });

                final int stoksUntukHapus = Integer.parseInt(dataNya.get(position).getStok()) + Integer.parseInt(dataNya.get(position).getJumlahBeli());
                final int totalHarga   = Integer.parseInt(dataNya.get(position).getGrandTot()) - Integer.parseInt(dataNya.get(position).getTotalHarga());

                Button btnHapus = (Button) myDialog.findViewById(R.id.btnDelete);
                btnHapus.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {

                        String cekJumbel = jumbel.getText().toString();

                        if(!cekJumbel.isEmpty()){

                            deletePesanan(dataNya.get(position).getIdTransaksiDetail(), dataNya.get(position).getIdMenu(),
                                    String.valueOf(stoksUntukHapus), String.valueOf(totalHarga), dataNya.get(position).getIdTransaksi());

                            //Toast.makeText(getApplication()," Stok"+String.valueOf(stoksUntukHapus) +"Grand Total "+String.valueOf(totalHarga), Toast.LENGTH_LONG).show();
                        }else {
                            Toast.makeText(getApplicationContext(), "Jumlah beli salah", Toast.LENGTH_LONG).show();
                        }
                    }
                });


                //edit tanpa jumlah beli
                btnEdit2.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {

                                    /*editPesanan(dataNya.get(position).getIdTransaksiDetail(),dataNya.get(position).getIdMenu()
                                            ,String.valueOf(stoksUntukEdit),);*/
                        Toast.makeText(getApplicationContext(), "Ini Button untuk catatan", Toast.LENGTH_LONG).show();

                    }
                });


                myDialog.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
                myDialog.show();

                return true;
            }
        });
    }


    public void editPesanan(final String idTransaksiDetail, final String idMenu, final String stok, final String grandTotal,
                            final String idtransaksi, final String catatan, final String jumlahBeli){

        String tag_string_req = "req_login";

        pDialog.setMessage("Mohon Tunggu");
        showDialog();

        StringRequest strReq = new StringRequest(Request.Method.POST,
                Config_URL.editPesanan, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                Log.d("Data", "Login Response: " + response.toString());
                //loginBtn.revertAnimation();
                hideDialog();

                try {
                    JSONObject jObj = new JSONObject(response);
                    boolean status = jObj.getBoolean("status");

                    if(status == true){
                        String msg          = jObj.getString("msg");
                        Toast.makeText(getApplicationContext(), msg, Toast.LENGTH_LONG).show();
                        Intent a = new Intent(getApplicationContext(), ListPesananDetail.class);
                        a.putExtra("idtransaksi", idTransaksi);
                        startActivity(a);
                        finish();
                    }else {
                        String error_msg = jObj.getString("msg");
                        Toast.makeText(getApplicationContext(), error_msg, Toast.LENGTH_LONG).show();

                    }

                }catch (JSONException e){
                    //JSON error
                    e.printStackTrace();
                }
            }
        }, new Response.ErrorListener(){

            @Override
            public void onErrorResponse(VolleyError error){
                //Log.e(String.valueOf("Data", "Login Error : " + error.getMessage());
                error.printStackTrace();
                //loginBtn.revertAnimation();
                hideDialog();
            }
        }){

            @Override
            protected Map<String, String> getParams(){
                Map<String, String> params = new HashMap<String, String>();
                params.put("idTransaksiDetail", idTransaksiDetail);
                params.put("idMenu", idMenu);
                params.put("stok", stok);
                params.put("grandTotal", grandTotal);
                params.put("idtransaksi", idtransaksi);
                params.put("catatan", catatan);
                params.put("jumlahBeli", jumlahBeli);
                return params;
            }
        };

        strReq.setRetryPolicy(policy);
        AppController.getInstance().addToRequestQueue(strReq, tag_string_req);
    }

    public void deletePesanan(final String id, final String idMenu, final String stok, final String totBayar, final String idtransaksi){

        String tag_string_req = "req_login";

        pDialog.setMessage("Mohon Tunggu");
        showDialog();

        StringRequest strReq = new StringRequest(Request.Method.POST,
                Config_URL.cancelPesananDetail, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                Log.d("Data", "Login Response: " + response.toString());
                //loginBtn.revertAnimation();
                hideDialog();

                try {
                    JSONObject jObj = new JSONObject(response);
                    boolean status = jObj.getBoolean("status");

                    if(status == true){
                        String msg          = jObj.getString("msg");
                        Toast.makeText(getApplicationContext(), msg, Toast.LENGTH_LONG).show();
                        Intent a = new Intent(getApplicationContext(), ListPesananDetail.class);
                        a.putExtra("idtransaksi", idTransaksi);
                        startActivity(a);
                        finish();
                    }else {
                        String error_msg = jObj.getString("msg");
                        Toast.makeText(getApplicationContext(), error_msg, Toast.LENGTH_LONG).show();

                    }

                }catch (JSONException e){
                    //JSON error
                    e.printStackTrace();
                }
            }
        }, new Response.ErrorListener(){

            @Override
            public void onErrorResponse(VolleyError error){
                //Log.e(String.valueOf("Data", "Login Error : " + error.getMessage());
                error.printStackTrace();
                //loginBtn.revertAnimation();
                hideDialog();
            }
        }){

            @Override
            protected Map<String, String> getParams(){
                Map<String, String> params = new HashMap<String, String>();
                params.put("id", id);
                params.put("idMenu", idMenu);
                params.put("stok", stok);
                params.put("totbayar", totBayar);
                params.put("idtransaksi", idtransaksi);
                return params;
            }
        };

        strReq.setRetryPolicy(policy);
        AppController.getInstance().addToRequestQueue(strReq, tag_string_req);
    }


}
