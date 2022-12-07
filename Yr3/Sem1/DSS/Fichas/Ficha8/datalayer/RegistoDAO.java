package datalayer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

public class DAOconfig {
    static final String USERNAME = "jfc";                       // Actualizar
    static final String PASSWORD = "jfc";                       // Actualizar
    private static final String DATABASE = "turmas3l";          // Actualizar
    private static final String DRIVER = "jdbc:mariadb";        // Usar para MariaDB
    //private static final String DRIVER = "jdbc:mysql";        // Usar para MySQL
    static final String URL = DRIVER+"://localhost:3300/"+DATABASE;
}

public class RegistoDAO implements Map<String, Registo>{
	private static RegistoDAO singleton = null;

	private RegistoDAO() {
		try (Connection conn = DriverManager.getConnection(DAOconfig.URL, DAOconfig.USERNAME, DAOconfig.PASSWORD);
		Statement stm = conn.createStatement()) {
			String sql = "CREATE TABLE IF NOT EXISTS parque (" +
                    "codP varchar(10) NOT NULL PRIMARY KEY" + 
					")";
            stm.executeUpdate(sql);
			sql = "CREATE TABLE IF NOT EXISTS registo (" +
                    "num varchar(10) NOT NULL PRIMARY KEY," +
                    "entrada date," +
                    "saida date" +
					"idParque varchar(10)," +
					"FOREIGN KEY (idParque) references parque(codP)";
            stm.executeUpdate(sql);
        } catch (SQLException e) {
            // Erro a criar tabela...
            e.printStackTrace();
            throw new NullPointerException(e.getMessage());
        }
	}

	/**
     * Implementação do padrão Singleton
     *
     * @return devolve a instância única desta classe
     */
    public static RegistoDAO getInstance() {
        if (RegistoDAO.singleton == null) {
            RegistoDAO.singleton = new RegistoDAO();
        }
        return RegistoDAO.singleton;
    }

	@Override
    public int size() {
        int i = 0;
        try (Connection conn = DriverManager.getConnection(DAOconfig.URL, DAOconfig.USERNAME, DAOconfig.PASSWORD);
             Statement stm = conn.createStatement();
             ResultSet rs = stm.executeQuery("SELECT count(*) FROM registo")) {
            if(rs.next()) {
                i = rs.getInt(1);
            }
        }
        catch (Exception e) {
            // Erro a criar tabela...
            e.printStackTrace();
            throw new NullPointerException(e.getMessage());
        }
        return i;
    }


	@Override
    public Turma get(Object key) {
        Turma t = null;
        try (Connection conn = DriverManager.getConnection(DAOconfig.URL, DAOconfig.USERNAME, DAOconfig.PASSWORD);
             Statement stm = conn.createStatement();
             ResultSet rs = stm.executeQuery("SELECT * FROM registo WHERE num='"+key+"'")) {
            if (rs.next()) {  // A chave existe na tabela
				ResultSet rsa = stm.executeQuery("SELECT * FROM parque WHERE codP='"+key+"'");
            }
			// TODO

			// Reconstruir a turma cokm os dados obtidos da BD 
			t = new Registo(rs.getString("Id"), rs.getDate("entrada"), rs.getDate("saida"), rs.getString("idParque"), );
        } catch (SQLException e) {
            // Database error!
            e.printStackTrace();
            throw new NullPointerException(e.getMessage());
        }
        return t;
    }


	@Override
    public boolean isEmpty() {
        return this.size() == 0;
    }

	@Override
    public boolean containsKey(Object key) {
        boolean r;
        try (Connection conn = DriverManager.getConnection(DAOconfig.URL, DAOconfig.USERNAME, DAOconfig.PASSWORD);
             Statement stm = conn.createStatement();
             ResultSet rs =
                     stm.executeQuery("SELECT num FROM registo WHERE num='"+key.toString()+"'")) {
            r = rs.next();
        } catch (SQLException e) {
            // Database error!
            e.printStackTrace();
            throw new NullPointerException(e.getMessage());
        }
        return r;
    }

	@Override
    public boolean containsValue(Object value) {
        Registo t = (Registo) value;
        return this.containsKey(t.getId());
    }


	

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
		} else if (aObject instanceof RegistoDAO) {
			RegistoDAO lRegistoDAOObject = (RegistoDAO) aObject;
			boolean lEquals = true;
			return lEquals;
		}
		return false;
	}
}