package businesslayer.ssparques;

import datalayer.UtenteDAO;

public class Viatura {
	private String _matricula;
	private String _nIFproprietario;
	private TipoViatura _tipo;
	private UtenteDAO _utenteDAO;

	public int hashCode() {
		int lHashCode = 0;
		if ( this._matricula != null ) {
			lHashCode += this._matricula.hashCode();
		}
		if ( this._nIFproprietario != null ) {
			lHashCode += this._nIFproprietario.hashCode();
		}
		if ( this._tipo != null ) {
			lHashCode += this._tipo.hashCode();
		}
		if ( this._utenteDAO != null ) {
			lHashCode += this._utenteDAO.hashCode();
		}
		if ( lHashCode == 0 ) {
			lHashCode = super.hashCode();
		}
		return lHashCode;
	}

	public boolean equals(Object aObject) {
		if (this == aObject) {
			return true;
		} else if (aObject instanceof Viatura) {
			Viatura lViaturaObject = (Viatura) aObject;
			boolean lEquals = true;
			lEquals &= ((this._matricula == lViaturaObject._matricula)
				|| (this._matricula != null && this._matricula.equals(lViaturaObject._matricula)));
			lEquals &= ((this._nIFproprietario == lViaturaObject._nIFproprietario)
				|| (this._nIFproprietario != null && this._nIFproprietario.equals(lViaturaObject._nIFproprietario)));
			lEquals &= ((this._tipo == lViaturaObject._tipo)
				|| (this._tipo != null && this._tipo.equals(lViaturaObject._tipo)));
			lEquals &= ((this._utenteDAO == lViaturaObject._utenteDAO)
				|| (this._utenteDAO != null && this._utenteDAO.equals(lViaturaObject._utenteDAO)));
			return lEquals;
		}
		return false;
	}
}