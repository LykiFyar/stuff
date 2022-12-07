package businesslayer.ssparques;

public class Parque {
	private String _cod;
	private Float _tab_preços;

	public int hashCode() {
		int lHashCode = 0;
		if ( this._cod != null ) {
			lHashCode += this._cod.hashCode();
		}
		if ( this._tab_preços != null ) {
			lHashCode += this._tab_preços.hashCode();
		}
		if ( lHashCode == 0 ) {
			lHashCode = super.hashCode();
		}
		return lHashCode;
	}

	public boolean equals(Object aObject) {
		if (this == aObject) {
			return true;
		} else if (aObject instanceof Parque) {
			Parque lParqueObject = (Parque) aObject;
			boolean lEquals = true;
			lEquals &= ((this._cod == lParqueObject._cod)
				|| (this._cod != null && this._cod.equals(lParqueObject._cod)));
			lEquals &= ((this._tab_preços == lParqueObject._tab_preços)
				|| (this._tab_preços != null && this._tab_preços.equals(lParqueObject._tab_preços)));
			return lEquals;
		}
		return false;
	}
}