package datalayer;

public class IdentificadorDAO {

	public int hashCode() {
		int lHashCode = 0;
		if ( lHashCode == 0 ) {
			lHashCode = super.hashCode();
		}
		return lHashCode;
	}

	public boolean equals(Object aObject) {
		if (this == aObject) {
			return true;
		} else if (aObject instanceof IdentificadorDAO) {
			IdentificadorDAO lIdentificadorDAOObject = (IdentificadorDAO) aObject;
			boolean lEquals = true;
			return lEquals;
		}
		return false;
	}
}