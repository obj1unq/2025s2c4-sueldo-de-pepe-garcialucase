object pepe {
    var categoria = cadete
    var faltas = 0
    var property bonoPorPresentismo = bonoPorPresentismoAjuste
    var property bonoPorResultados = bonoPorResultadoMontoFijo
    
	method categoria(_categoria){
        categoria = _categoria
    }
    
    method categoria(){
        return categoria
    }
    
    method faltas(_faltas){
        faltas = _faltas
    }

    method faltas(){
        return faltas
    }

    method neto(){
        return categoria.neto()
    }

    method sueldo(){
        return self.neto() 
        + bonoPorPresentismo.monto(self.neto(),faltas) 
        + bonoPorResultados.monto(self.neto()) 
    }

}

object cadete {
    const neto = 20000
    method neto(){
        return neto
    }
}

object gerente {
    const neto = 15000
    method neto(){
        return neto
    }
}

object bonoPorResultadoMontoFijo {
    method monto(neto) = 800
}

object bonoPorPresentismoNormal {
    method monto (monto, faltas) {
        if (faltas == 0) return 2000
    else if (faltas == 1) return 1000
    else return 0
    }
}


object bonoPorPresentismoAjuste {
    method monto(neto, faltas){
        if(faltas == 0) return 100
        else return 0
    }
}

object bonoPorPresentismoDemagogico {
    method monto (neto, faltas) {
        if (faltas == 0) return 100
        else return 0
    }
}

object bonoPorResultadosPorcentaje {
    method monto(neto) = neto * 0.10
}

object bonoPorResultadosMontoFijo {
    method monto(){
        return 800
    }
}

object bonoPorPresentismoNulo {
    method monto(){
        return 0
    }
}

object sofia {
    var property categoria = cadete
    var property bonoResultado = bonoPorResultadoMontoFijo

    method neto() = categoria.neto() * 1.3

    method sueldo () = self.neto() + bonoResultado.monto(self.neto())
}



