package businesslayer.ssparques;

public class TipoViatura {
	private String _idTV;

	public int hashCode() {
		int lHashCode = 0;
		if ( this._idTV != null ) {
			lHashCode += this._idTV.hashCode();
		}
		if ( lHashCode == 0 ) {
			lHashCode = super.hashCode();
		}
		return lHashCode;
	}

	public boolean equals(Object aObject) {
		if (this == aObject) {
			return true;
		} else if (aObject instanceof TipoViatura) {
			TipoViatura lTipoViaturaObject = (TipoViatura) aObject;
			boolean lEquals = true;
			lEquals &= ((this._idTV == lTipoViaturaObject._idTV)
				|| (this._idTV != null && this._idTV.equals(lTipoViaturaObject._idTV)));
			return lEquals;
		}
		return false;
	}
}