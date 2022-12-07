package businesslayer.ssparques;

import datalayer.RegistoDAO;
import java.util.ArrayList;
import Physical.businesslayer.ssparques.String;

public class Identificador {
	private String _id;
	private RegistoDAO _registoDAO;
	private Viatura _viatura;
	private ArrayList<String> _registos = new ArrayList<String>();

	public int hashCode() {
		int lHashCode = 0;
		if ( this._id != null ) {
			lHashCode += this._id.hashCode();
		}
		if ( this._registoDAO != null ) {
			lHashCode += this._registoDAO.hashCode();
		}
		if ( this._viatura != null ) {
			lHashCode += this._viatura.hashCode();
		}
		if ( this._registos != null ) {
			lHashCode += this._registos.hashCode();
		}
		if ( lHashCode == 0 ) {
			lHashCode = super.hashCode();
		}
		return lHashCode;
	}

	public boolean equals(Object aObject) {
		if (this == aObject) {
			return true;
		} else if (aObject instanceof Identificador) {
			Identificador lIdentificadorObject = (Identificador) aObject;
			boolean lEquals = true;
			lEquals &= ((this._id == lIdentificadorObject._id)
				|| (this._id != null && this._id.equals(lIdentificadorObject._id)));
			lEquals &= ((this._registoDAO == lIdentificadorObject._registoDAO)
				|| (this._registoDAO != null && this._registoDAO.equals(lIdentificadorObject._registoDAO)));
			lEquals &= ((this._viatura == lIdentificadorObject._viatura)
				|| (this._viatura != null && this._viatura.equals(lIdentificadorObject._viatura)));
			lEquals &= ((this._registos == lIdentificadorObject._registos)
				|| (this._registos != null && this._registos.equals(lIdentificadorObject._registos)));
			return lEquals;
		}
		return false;
	}
}