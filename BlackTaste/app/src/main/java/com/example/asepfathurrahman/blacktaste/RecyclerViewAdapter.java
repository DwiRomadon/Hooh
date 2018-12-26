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

public class RecyclerViewAdapter extends RecyclerView.Adapter<RecyclerViewAdapter.MyViewHolder> {


    Context mContext;
    List<Makanan> mData;
    Dialog mDialog;

    public RecyclerViewAdapter(Context mContext, List<Makanan> mData) {
        this.mContext = mContext;
        this.mData = mData;
    }

    @Override
    public MyViewHolder onCreateViewHolder(ViewGroup parent, final int viewType) {
        View v = LayoutInflater.from(mContext).inflate(R.layout.item_makanan, parent, false);

        return new MyViewHolder(v);
    }

    @Override
    public void onBindViewHolder(MyViewHolder holder, final int position) {

        holder.tv_nama.setText(mData.get(position).getNamaMakanan());
        holder.tv_harga.setText("Harga\t: "+ mData.get(position).getHargaMakanan());
        holder.tv_stok.setText("Stok\t\t: "+ mData.get(position).getStokMakanan());
        //holder.img.setImageResource(mData.get(position).getFotoMakanan());

        Picasso.get()
                .load(Config_URL.base_URL+"/assets/images/produk/"+ mData.get(position).getFotoMakanan())
                .resize(50, 50)
                .centerCrop()
                .into(holder.img);

        mDialog = new Dialog(mContext);
        mDialog.setContentView(R.layout.dialog_makanan);

        holder.button_get.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                final TextView dialog_nama_tv = (TextView) mDialog.findViewById(R.id.dialog_nama_makanan);
                TextView dialog_stok_tv = (TextView) mDialog.findViewById(R.id.dialog_nama_stok);
                Button btnInputMakanan = mDialog.findViewById(R.id.button_input_makanan);
                Button btnBatalMakanan = mDialog.findViewById(R.id.button_batal_makanan);
                final ElegantNumberButton quantitiBtn = mDialog.findViewById(R.id.quantiti_button_makanan);
                dialog_nama_tv.setText(mData.get(position).getNamaMakanan());
                dialog_stok_tv.setText(mData.get(position).getStokMakanan());

                btnInputMakanan.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        Toast.makeText(mContext, "Nama makanan " + dialog_nama_tv.getText().toString() + " jumlah quantitas "
                                + quantitiBtn.getNumber() + " buah", Toast.LENGTH_SHORT).show();
                    }
                });

                btnBatalMakanan.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        mDialog.dismiss();
                    }
                });
                mDialog.show();
            }
        });
    }

    @Override
    public int getItemCount() {
        return mData.size();
    }

    public static class MyViewHolder extends RecyclerView.ViewHolder {

        TextView tv_nama;
        TextView tv_harga;
        TextView tv_stok;
        ImageView img;
        Button button_get;

        public MyViewHolder(View itemView) {
            super(itemView);

            tv_nama = (TextView) itemView.findViewById(R.id.nama_makanan);
            tv_harga = (TextView) itemView.findViewById(R.id.harga_makanan);
            tv_stok = (TextView) itemView.findViewById(R.id.stok_makanan);
            img = (ImageView) itemView.findViewById(R.id.img_makanan);
            button_get = (Button) itemView.findViewById(R.id.button_makanan);

        }
    }


}

