package com.example.asepfathurrahman.blacktaste.adapter;

import android.app.Dialog;
import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import com.example.asepfathurrahman.blacktaste.R;
import com.example.asepfathurrahman.blacktaste.data.Pesanan;

import java.util.ArrayList;
import java.util.List;

public class AdapterPesanan extends ArrayAdapter<Pesanan> {


    private Context context;

    public AdapterPesanan(Context context, ArrayList<Pesanan> a) {
        super(context,0,a);
        this.context = context;
    }


    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        LayoutInflater inflater = LayoutInflater.from(this.context);
        convertView = inflater.inflate(R.layout.content_pesanan, parent, false);

        Pesanan news = getItem(position);

        TextView id         = (TextView) convertView.findViewById(R.id.id);
        TextView nama       = (TextView) convertView.findViewById(R.id.nama_menu);
        TextView noMeja     = (TextView) convertView.findViewById(R.id.id_meja);
        TextView idMenu     = (TextView) convertView.findViewById(R.id.id_menu);
        TextView jumlahBeli = (TextView) convertView.findViewById(R.id.jumlah_beli);
        TextView catatan    = (TextView) convertView.findViewById(R.id.catatan);
        TextView total      = (TextView) convertView.findViewById(R.id.price);

        id.setText(news.getId());
        id.setVisibility(View.GONE);
        nama.setText("Nama \t\t\t\t: " + news.getNamaMenu());
        noMeja.setText("No Meja \t\t\t: "+ news.getIdMeja());
        idMenu.setText("Id Menu \t\t: " + news.getIdMenu());
        idMenu.setVisibility(View.GONE);
        jumlahBeli.setText("Jumlah Beli\t: "+news.getJumlahBeli());
        catatan.setText("Catatan \t\t\t: " + news.getCatatan());
        total.setText("Total \t\t\t\t\t: "+news.getPrice());
        return convertView;
    }
}

