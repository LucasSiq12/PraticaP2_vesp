import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class java {

    private static final String URL = "jdbc:sqlserver://seuserver:1433;databaseName=suabase";
    private static final String USUARIO = "seuusuario";
    private static final String SENHA = "suasenha";

    public static void main(String[] args) {
        Map<String, Object> dadosInsercao = new HashMap<>();
        dadosInsercao.put("coluna1", "Valor1");
        dadosInsercao.put("coluna2", "Valor2");

        inserirDados("SuaTabela", dadosInsercao);

        Map<String, Object> dadosAtualizacao = new HashMap<>();
        dadosAtualizacao.put("coluna1", "NovoValor");
        dadosAtualizacao.put("coluna2", "ValorAntigo");

        atualizarDados("SuaTabela", dadosAtualizacao);

        Map<String, Object> dadosExclusao = new HashMap<>();
        dadosExclusao.put("coluna1", "ValorASerExcluido");

        excluirDados("SuaTabela", dadosExclusao);
    }

    private static Connection conectar() throws SQLException {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            return DriverManager.getConnection(URL, USUARIO, SENHA);
        } catch (ClassNotFoundException e) {
            throw new SQLException("Driver JDBC não encontrado", e);
        }
    }

    private static void fecharConexao(Connection conexao) {
        try {
            if (conexao != null && !conexao.isClosed()) {
                conexao.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static void inserirDados(String tabela, Map<String, Object> dados) {
        try (Connection conexao = conectar()) {
            StringBuilder sqlBuilder = new StringBuilder("INSERT INTO ").append(tabela).append(" (");

            for (String coluna : dados.keySet()) {
                sqlBuilder.append(coluna).append(", ");
            }

            sqlBuilder.delete(sqlBuilder.length() - 2, sqlBuilder.length()); 
            sqlBuilder.append(") VALUES (");

            for (int i = 0; i < dados.size(); i++) {
                sqlBuilder.append("?, ");
            }

            sqlBuilder.delete(sqlBuilder.length() - 2, sqlBuilder.length()); 
            sqlBuilder.append(")");

            try (PreparedStatement preparedStatement = conexao.prepareStatement(sqlBuilder.toString())) {
                int index = 1;
                for (Object valor : dados.values()) {
                    preparedStatement.setObject(index++, valor);
                }

                int linhasAfetadas = preparedStatement.executeUpdate();

                System.out.println("Inserção realizada com sucesso. Linhas afetadas: " + linhasAfetadas);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static void atualizarDados(String tabela, Map<String, Object> dados) {
        try (Connection conexao = conectar()) {
            StringBuilder sqlBuilder = new StringBuilder("UPDATE ").append(tabela).append(" SET ");

            for (String coluna : dados.keySet()) {
                sqlBuilder.append(coluna).append(" = ?, ");
            }

            sqlBuilder.delete(sqlBuilder.length() - 2, sqlBuilder.length()); 


            try (PreparedStatement preparedStatement = conexao.prepareStatement(sqlBuilder.toString())) {
                int index = 1;
                for (Object valor : dados.values()) {
                    preparedStatement.setObject(index++, valor);
                }


                int linhasAfetadas = preparedStatement.executeUpdate();

                System.out.println("Atualização realizada com sucesso. Linhas afetadas: " + linhasAfetadas);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static void excluirDados(String tabela, Map<String, Object> dados) {
        try (Connection conexao = conectar()) {
            StringBuilder sqlBuilder = new StringBuilder("DELETE FROM ").append(tabela).append(" WHERE ");

            for (String coluna : dados.keySet()) {
                sqlBuilder.append(coluna).append(" = ? AND ");
            }

            sqlBuilder.delete(sqlBuilder.length() - 5, sqlBuilder.length()); // Remover o último "AND"

            try (PreparedStatement preparedStatement = conexao.prepareStatement(sqlBuilder.toString())) {
                int index = 1;
                for (Object valor : dados.values()) {
                    preparedStatement.setObject(index++, valor);
                }

                int linhasAfetadas = preparedStatement.executeUpdate();

                System.out.println("Exclusão realizada com sucesso. Linhas afetadas: " + linhasAfetadas);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
