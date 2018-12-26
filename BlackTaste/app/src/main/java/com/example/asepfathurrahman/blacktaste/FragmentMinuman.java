package com.example.asepfathurrahman.blacktaste;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import java.util.ArrayList;
import java.util.List;

public class FragmentMinuman extends Fragment {

    View v;
    private RecyclerView myrecyclerview;
    private List<Minuman> oneMinuman;

    public FragmentMinuman() {
    }

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        v = inflater.inflate(R.layout.minuman_fragment,container,false);
        myrecyclerview = (RecyclerView) v.findViewById(R.id.minuman_recyclerview);
        RecyclerViewAdapterB recyclerAdapter = new RecyclerViewAdapterB(getContext(),oneMinuman);
        myrecyclerview.setLayoutManager(new LinearLayoutManager(getActivity()));
        myrecyclerview.setAdapter(recyclerAdapter);
        return v;
    }

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        oneMinuman = new ArrayList<>();
        oneMinuman.add(new Minuman("Jus Mangga", "Rp. 20.000", "Stok = 10", R.drawable.mangga));
        oneMinuman.add(new Minuman("Jus Alpukat","Rp. 20.000","Stok = 10", R.drawable.alpukat));
        oneMinuman.add(new Minuman("Es Cappucino","Rp. 20.000","Stok = 10", R.drawable.capucino));
        oneMinuman.add(new Minuman("Jus Mangga", "Rp. 20.000", "Stok = 10", R.drawable.mangga));
        oneMinuman.add(new Minuman("Jus Alpukat","Rp. 20.000","Stok = 10", R.drawable.alpukat));
        oneMinuman.add(new Minuman("Es Cappucino","Rp. 20.000","Stok = 10", R.drawable.capucino));
        oneMinuman.add(new Minuman("Jus Mangga", "Rp. 20.000", "Stok = 10", R.drawable.mangga));
        oneMinuman.add(new Minuman("Jus Alpukat","Rp. 20.000","Stok = 10", R.drawable.alpukat));
        oneMinuman.add(new Minuman("Es Cappucino","Rp. 20.000","Stok = 10", R.drawable.capucino));
        oneMinuman.add(new Minuman("Jus Mangga", "Rp. 20.000", "Stok = 10", R.drawable.mangga));
        oneMinuman.add(new Minuman("Jus Alpukat","Rp. 20.000","Stok = 10", R.drawable.alpukat));
        oneMinuman.add(new Minuman("Es Cappucino","Rp. 20.000","Stok = 10", R.drawable.capucino));
        oneMinuman.add(new Minuman("Jus Mangga", "Rp. 20.000", "Stok = 10", R.drawable.mangga));
        oneMinuman.add(new Minuman("Jus Alpukat","Rp. 20.000","Stok = 10", R.drawable.alpukat));
        oneMinuman.add(new Minuman("Es Cappucino","Rp. 20.000","Stok = 10", R.drawable.capucino));

    }
}
