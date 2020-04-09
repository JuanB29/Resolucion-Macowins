class Prenda{
	var precio
	var estado
	
	method precioTotal() = estado.precioTotal(precio)
}

class Nueva{
	method precioTotal(precio) = precio
}

class Promocion{
	var descuento
	method modificacion(precio) = 0.max(precio-descuento)
}

class Liquidacion{
	method modificacion(precio) = precio/2
}

class Local{
	var ventas=[]
	method gananciasDeUna(fecha){
		ventas.filter{unaVenta => unaVenta.esDeFecha(fecha)}.sum{unaVenta => unaVenta.ganancia()}
	}
}

class VentaEnEfectivo{
	var prendasVendidas = []
	const fechaDeVenta
	
	method esDeFecha(fecha) = fechaDeVenta.equals(fecha)
	
	method valorPrendas () = prendasVendidas.sum{unaPrenda => unaPrenda.precioTotal()} 
	
	method ganancia(){
		return self.valorPrendas()
	}
}

class VentaConTarjeta inherits VentaEnEfectivo{
	var cuotas
	var coeficienteFijo
	
    method recargo() = cuotas * coeficienteFijo + 0.01 * self.valorPrendas()
    
    override method ganancia(){
    	return super() + self.recargo()
    }
	
}