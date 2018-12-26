package com.example.asepfathurrahman.blacktaste;

import android.app.Dialog;
import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.cepheuen.elegantnumberbutton.view.ElegantNumberButton;
import com.example.asepfathurrahman.blacktaste.server.Config_URL;
import com.squareup.picasso.Picasso;

import java.util.List;

public class RecyclerViewAdapterB extends RecyclerView.Adapter<RecyclerViewAdapterB.MyViewHolder> {

    Context bContext;
    List<Minuman> bData;
    Dialog bDialog;

    public RecyclerViewAdapterB(Context bContext, List<Minuman> bData) {
        this.bContext = bContext;
        this.bData = bData;
    }

    @Override
    public RecyclerViewAdapterB.MyViewHolder onCreateViewHolder(ViewGroup parent, final int viewType) {
        View v = LayoutInflater.from(bContext).inflate(R.layout.item_minuman, parent, false);

        return new MyViewHolder(v);
    }

    @Override
    public void onBindViewHolder(RecyclerViewAdapterB.MyViewHolder holder, final int position) {

        holder.tv_nama.setText(bData.get(position).getNamaMinuman());
        holder.tv_harga.setText("Harga\t: "+bData.get(position).getHargaMinuman());
        holder.tv_stok.setText("Stok\t\t: "+bData.get(position).getStokMinuman());

        Picasso.get()
                .load(Config_URL.base_URL+"/assets/images/produk/"+ bData.get(position).getFotoMinuman())
                .resize(50, 50)
                .centerCrop()
                .into(holder.img);

        bDialog = new Dialog(bContext);
        bDialog.setContentView(R.layout.dialog_minuman);

        holder.button_get.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                final TextView dialog_nama_tv = (TextView) bDialog.findViewById(R.id.dialog_nama_minuman);
                TextView dialog_stok_tv = (TextView) bDialog.findViewById(R.id.dialog_nama_stok);
                Button btnInputMinuman = bDialog.findViewById(R.id.button_input_minuman);
                Button btnBatalMinuman = bDialog.findViewById(R.id.button_batal_minuman);
                final ElegantNumberButton quantitiBtn = bDialog.findViewById(R.id.quantiti_button_minuman);
                dialog_nama_tv.setText(bData.get(position).getNamaMinuman());
                dialog_stok_tv.setText(bData.get(position).getStokMinuman());

                btnInputMinuman.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        Toast.makeText(bContext, "Nama makanan " + dialog_nama_tv.getText().toString() + " jumlah quantitas "
                                + quantitiBtn.getNumber() + " buah", Toast.LENGTH_SHORT).show();
                    }
                });
                btnBatalMinuman.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        bDialog.dismiss();
                    }
                });
                bDialog.show();
            }
        });
    }

    @Override
    public int getItemCount() {
        return bData.size();
    }

    public static class MyViewHolder extends RecyclerView.ViewHolder {

        TextView tv_nama;
        TextView tv_harga;
        TextView tv_stok;
        ImageView img;
        Button button_get;

        public MyViewHolder(View itemView) {
            super(itemView);

            tv_nama = (TextView) itemView.findViewById(R.id.nama_minuman);
            tv_harga = (TextView) itemView.findViewById(R.id.harga_minuman);
            tv_stok = (TextView) itemView.findViewById(R.id.stok_minuman);
            img = (ImageView) itemView.findViewById(R.id.img_minuman);
            button_get = (Button) itemView.findViewById(R.id.button_minuman);

        }
    }


}

