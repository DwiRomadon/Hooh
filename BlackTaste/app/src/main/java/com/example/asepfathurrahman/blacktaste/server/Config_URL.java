package com.example.asepfathurrahman.blacktaste.server;

//This class is for storing all URLs as a model of URLs

public class Config_URL
{
    public static String base_URL           = "http://192.168.1.120/resto";
    public static String dataMenu           = base_URL + "/API/menu";
    public static String loginUrl           = base_URL + "/API/login";
    public static String noMeja             = base_URL + "/API/meja";
    public static String sumCount           = base_URL + "/API/sumCountPreTransaksi";
    public static String addPreTransaction  = base_URL + "/API/addPreeTransaktion";
    public static String detailPreTransakti = base_URL + "/API/detailPreTransakti";
    public static String getStok            = base_URL + "/API/getStok";
    public static String hapusPesanan       = base_URL + "/API/hapusPesanan";
    public static String inputTransaksi     = base_URL + "/API/inputPesanan";
    public static String inputTransaksiDetail     = base_URL + "/API/transaksiDetail";
}