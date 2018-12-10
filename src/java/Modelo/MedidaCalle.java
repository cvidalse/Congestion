package Modelo;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author cvidalse
 */
public class MedidaCalle {

    private double latA;
    private double longA;
    private double latB;
    private double longB;
    private String descripcion;
    private double tasaFlujoSiete;
    private double tasaFlujoTrece;
    private double tasaFlujoDiezOcho;

    public MedidaCalle(double lat1, double long1, double lat2, double long2, String descripcion, double tasaFlujo7, double tasaFlujo13, double tasaFlujo16) {
        this.latA = lat1;
        this.longA = long1;
        this.latB = lat2;
        this.longB = long2;
        this.descripcion = descripcion;
        this.tasaFlujoSiete = tasaFlujo7;
        this.tasaFlujoTrece = tasaFlujo13;
        this.tasaFlujoDiezOcho = tasaFlujo16;
    }

    @Override
    public String toString() {
        return "{" + "\"latA\":" + latA + ", \"longA\":" + longA
                + ", \"latB\":" + latB + ", \"longB\":" + longB
                + ", \"descripcion\":\"" + descripcion + "\", \"tasaFlujoSiete\":" + tasaFlujoSiete
                + ", \"tasaFlujoTrece\":" + tasaFlujoTrece + ", \"tasaFlujoDiezOcho\":" + tasaFlujoDiezOcho
                + '}';

    }

    public double getLatA() {
        return latA;
    }

    public void setLatA(double latA) {
        this.latA = latA;
    }

    public double getLongA() {
        return longA;
    }

    public void setLongA(double longA) {
        this.longA = longA;
    }

    public double getLatB() {
        return latB;
    }

    public void setLatB(double latB) {
        this.latB = latB;
    }

    public double getLongB() {
        return longB;
    }

    public void setLongB(double longB) {
        this.longB = longB;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getTasaFlujoSiete() {
        return tasaFlujoSiete;
    }

    public void setTasaFlujoSiete(double tasaFlujoSiete) {
        this.tasaFlujoSiete = tasaFlujoSiete;
    }

    public double getTasaFlujoTrece() {
        return tasaFlujoTrece;
    }

    public void setTasaFlujoTrece(double tasaFlujoTrece) {
        this.tasaFlujoTrece = tasaFlujoTrece;
    }

    public double getTasaFlujoDiezOcho() {
        return tasaFlujoDiezOcho;
    }

    public void setTasaFlujoDiezOcho(double tasaFlujoDiezOcho) {
        this.tasaFlujoDiezOcho = tasaFlujoDiezOcho;
    }
}
