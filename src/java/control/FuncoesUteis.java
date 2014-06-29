package control;

import java.text.NumberFormat;

public class FuncoesUteis {

    public String converterMoeda(double moeda) {
        NumberFormat formato = NumberFormat.getCurrencyInstance(); //Formato de moeda atual do sistema
        String format = formato.format(moeda);
        return format;
    }
}
