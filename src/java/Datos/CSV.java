package Datos;

import Modelo.MedidaCalle;
import java.io.*;
import java.util.ArrayList;

public class CSV {

    public static ArrayList<String> deserializarCSV(String ruta) throws FileNotFoundException {

        String latA;
        String longA;
        String latB;
        String longB;
        String descripcion;
        String tasaFlujoSiete;
        String tasaFlujoTrece;
        String tasaFlujoDiezOcho;

        MedidaCalle cuadra = null;

        ArrayList<String> arrayList = new ArrayList<String>();

        BufferedReader br = null;
        String linea = "";

        String separador = ",";

        try {
            br = new BufferedReader(new FileReader(ruta));
            while ((linea = br.readLine()) != null) {

                String[] atr = linea.split(separador);
                
                latA = atr[0];
                longA = atr[1];
                latB = atr[2];
                longB = atr[3];
                descripcion = atr[4];
                tasaFlujoSiete = atr[5];
                tasaFlujoTrece = atr[6];
                tasaFlujoDiezOcho = atr[7];
                
                cuadra = new MedidaCalle(Double.parseDouble(latA),Double.parseDouble(longA),
                        Double.parseDouble(latB),Double.parseDouble(longB),descripcion,
                        Double.parseDouble(tasaFlujoSiete),Double.parseDouble(tasaFlujoTrece),
                        Double.parseDouble(tasaFlujoDiezOcho));
                arrayList.add(cuadra.toString());
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        return arrayList;
    }

    public static void serializarCSV(ArrayList<String> arrayList, String encabezado, String ruta) throws FileNotFoundException {
        PrintWriter pw = new PrintWriter(new File(ruta));
        StringBuilder sb = new StringBuilder();

        sb.append(encabezado + "\n");

        for (String s : arrayList) {
            sb.append(s + "\n");
        }

        pw.write(sb.toString());
        pw.close();
    }
}