package businesslayer.ssparques;

import java.time.LocalDateTime;
import datalayer.ParqueDAO;

public class Registo {
	private String _num;
	private LocalDateTime _entrada;
	private LocalDateTime _saida;
	private String _parque;
	private ParqueDAO _parqueDAO;

	public Registo(String num, LocalDateTime entrada, LocalDateTime saida, String codP, ParqueDAO pdao) {
		this._num = num;
		this._entrada = entrada;
		this._saida = saida;
		this._parque = codP;
		this._parqueDAO = pdao;
	}

	public int hashCode() {
		int lHashCode = 0;
		if ( this._num != null ) {
			lHashCode += this._num.hashCode();
		}
		if ( this._entrada != null ) {
			lHashCode += this._entrada.hashCode();
		}
		if ( this._saida != null ) {
			lHashCode += this._saida.hashCode();
		}
		if ( this._parque != null ) {
			lHashCode += this._parque.hashCode();
		}
		if ( this._parqueDAO != null ) {
			lHashCode += this._parqueDAO.hashCode();
		}
		if ( lHashCode == 0 ) {
			lHashCode = super.hashCode();
		}
		return lHashCode;
	}

	public boolean equals(Object aObject) {
		if (this == aObject) {
			return true;
		} else if (aObject instanceof Registo) {
			Registo lRegistoObject = (Registo) aObject;
			boolean lEquals = true;
			lEquals &= ((this._num == lRegistoObject._num)
				|| (this._num != null && this._num.equals(lRegistoObject._num)));
			lEquals &= ((this._entrada == lRegistoObject._entrada)
				|| (this._entrada != null && this._entrada.equals(lRegistoObject._entrada)));
			lEquals &= ((this._saida == lRegistoObject._saida)
				|| (this._saida != null && this._saida.equals(lRegistoObject._saida)));
			lEquals &= ((this._parque == lRegistoObject._parque)
				|| (this._parque != null && this._parque.equals(lRegistoObject._parque)));
			lEquals &= ((this._parqueDAO == lRegistoObject._parqueDAO)
				|| (this._parqueDAO != null && this._parqueDAO.equals(lRegistoObject._parqueDAO)));
			return lEquals;
		}
		return false;
	}
}