package businesslayer.ssparques;

import datalayer.ParqueDAO;
import datalayer.IdentificadorDAO;
import datalayer.RegistoDAO;
import java.time.LocalDateTime;

public class GesPark implements IGesPark {
	private TipoViatura _tipos_viatura;
	private ParqueDAO _todos_parques;
	private IdentificadorDAO _identificadores;
	private RegistoDAO _todos_registos;

	public float montanteAPagarViatura(String aIdViatura, LocalDateTime aEntrada, LocalDateTime aSaida) {
		throw new UnsupportedOperationException();
	}

	public int totalParquesVisitados(String aIdViatura) {
		throw new UnsupportedOperationException();
	}

	public float montanteAPagarUtente(String aIdUtente, LocalDateTime aEntrada, LocalDateTime aSaida) {
		throw new UnsupportedOperationException();
	}

	public int hashCode() {
		int lHashCode = 0;
		if ( this._tipos_viatura != null ) {
			lHashCode += this._tipos_viatura.hashCode();
		}
		if ( this._todos_parques != null ) {
			lHashCode += this._todos_parques.hashCode();
		}
		if ( this._identificadores != null ) {
			lHashCode += this._identificadores.hashCode();
		}
		if ( this._todos_registos != null ) {
			lHashCode += this._todos_registos.hashCode();
		}
		if ( lHashCode == 0 ) {
			lHashCode = super.hashCode();
		}
		return lHashCode;
	}

	public boolean equals(Object aObject) {
		if (this == aObject) {
			return true;
		} else if (aObject instanceof GesPark) {
			GesPark lGesParkObject = (GesPark) aObject;
			boolean lEquals = true;
			lEquals &= ((this._tipos_viatura == lGesParkObject._tipos_viatura)
				|| (this._tipos_viatura != null && this._tipos_viatura.equals(lGesParkObject._tipos_viatura)));
			lEquals &= ((this._todos_parques == lGesParkObject._todos_parques)
				|| (this._todos_parques != null && this._todos_parques.equals(lGesParkObject._todos_parques)));
			lEquals &= ((this._identificadores == lGesParkObject._identificadores)
				|| (this._identificadores != null && this._identificadores.equals(lGesParkObject._identificadores)));
			lEquals &= ((this._todos_registos == lGesParkObject._todos_registos)
				|| (this._todos_registos != null && this._todos_registos.equals(lGesParkObject._todos_registos)));
			return lEquals;
		}
		return false;
	}
}