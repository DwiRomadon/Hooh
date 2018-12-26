package com.example.asepfathurrahman.blacktaste;


public class Minuman {

    private String NamaMinuman;
    private String HargaMinuman;
    private String StokMinuman;
    private int FotoMinuman;

    public Minuman() {
    }

    public Minuman(String nama, String harga, String stok, int foto) {
        NamaMinuman = nama;
        HargaMinuman = harga;
        StokMinuman = stok;
        FotoMinuman = foto;
    }

    //Getter


    public String getNamaMinuman() {
        return NamaMinuman;
    }

    public String getHargaMinuman() {
        return HargaMinuman;
    }

    public String getStokMinuman() {
        return StokMinuman;
    }

    public int getFotoMinuman() {
        return FotoMinuman;
    }

    //Setter


    public void setNamaMinuman(String nama) {
        NamaMinuman = nama;
    }

    public void setHargaMinuman(String harga) {
        HargaMinuman = harga;
    }

    public void setStokMinuman(String stok) {
        StokMinuman = stok;
    }

    public void setFotoMinuman(int foto) {
        FotoMinuman = foto;
    }
}
