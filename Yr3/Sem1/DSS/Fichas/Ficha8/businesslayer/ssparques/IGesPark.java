package businesslayer.ssparques;

import java.time.LocalDateTime;

public interface IGesPark {

	public float montanteAPagarViatura(String aIdViatura, LocalDateTime aEntrada, LocalDateTime aSaida);

	public int totalParquesVisitados(String aIdViatura);

	public float montanteAPagarUtente(String aIdUtente, LocalDateTime aEntrada, LocalDateTime aSaida);

	public int hashCode();

	public boolean equals(Object aObject);
}