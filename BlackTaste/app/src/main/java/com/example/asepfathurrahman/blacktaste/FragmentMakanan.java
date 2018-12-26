package com.example.asepfathurrahman.blacktaste;

import android.app.ProgressDialog;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;

import com.android.volley.DefaultRetryPolicy;
import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.RetryPolicy;
import com.android.volley.VolleyError;
import com.android.volley.VolleyLog;
import com.android.volley.toolbox.JsonArrayRequest;
import com.android.volley.toolbox.StringRequest;
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

public class FragmentMakanan extends Fragment {

    View v;
    private RecyclerView myrecyclerview;

    private ArrayList<Makanan> oneMakanan = new ArrayList<Makanan>();

    RecyclerViewAdapter recyclerAdapter;

    int socketTimeout = 30000;
    RetryPolicy policy = new DefaultRetryPolicy(socketTimeout,
            DefaultRetryPolicy.DEFAULT_MAX_RETRIES,
            DefaultRetryPolicy.DEFAULT_BACKOFF_MULT);

    private ProgressDialog pDialog;

    public FragmentMakanan() {
    }

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        v = inflater.inflate(R.layout.makanan_fragment,container,false);
        myrecyclerview = (RecyclerView) v.findViewById(R.id.makanan_recyclerview);
        recyclerAdapter = new RecyclerViewAdapter(getContext(),oneMakanan);
        myrecyclerview.setLayoutManager(new LinearLayoutManager(getActivity()));
        oneMakanan.clear();
        myrecyclerview.setAdapter(recyclerAdapter);
        return v;
    }

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        pDialog = new ProgressDialog(getActivity());
        pDialog.setCancelable(false);

        oneMakanan = new ArrayList<>();
        dataBuku();

    }

    public void dataBuku(){
        //Tag used to cancel the request
        String tag_string_req = "req";

        pDialog.setMessage("Please Wait.....");
        showDialog();

        StringRequest strReq = new StringRequest(Request.Method.GET,
                Config_URL.dataMenu, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                Log.d(getTag(), "Login Response: " + response.toString());
                hideDialog();
                try {
                    JSONObject jObj = new JSONObject(response);

                    JSONArray data = jObj.getJSONArray("data");

                    for (int i = 0; i < data.length(); i++) {
                            JSONObject obj = data.getJSONObject(i);
                            String kodeMakanan = obj.getString("id_menu_kategori");
                            if(kodeMakanan.equals("2")){
                                String nama     = obj.getString("nama_menu");
                                double harga    = obj.getDouble("harga_menu");
                                String stok     = obj.getString("stock_menu");
                                String foto     = obj.getString("foto_menu");

                                DecimalFormat kursIndonesia = (DecimalFormat) DecimalFormat.getCurrencyInstance();
                                DecimalFormatSymbols formatRp = new DecimalFormatSymbols();

                                formatRp.setCurrencySymbol("Rp. ");
                                formatRp.setMonetaryDecimalSeparator(',');
                                formatRp.setGroupingSeparator('.');

                                kursIndonesia.setDecimalFormatSymbols(formatRp);
                                oneMakanan.add(new Makanan(nama, kursIndonesia.format(harga), stok, foto));
                            }
                        }

                }catch (JSONException e){
                    //JSON error
                    e.printStackTrace();
                }
                recyclerAdapter.notifyDataSetChanged();
            }
        }, new Response.ErrorListener(){

            @Override
            public void onErrorResponse(VolleyError error){
                Log.e(getTag(), "Login Error : " + error.getMessage());
                error.printStackTrace();
                hideDialog();
            }
        }){

            @Override
            protected Map<String, String> getParams(){
                Map<String, String> params = new HashMap<String, String>();
                return params;
            }
        };

        //strReq.setRetryPolicy(policy);
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

}
