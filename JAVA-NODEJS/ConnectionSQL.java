import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;

public class ConnectionSQL {

    public static void main(String[] args) {
        String jdbcUrl = "jdbc:sqlserver://REGULUS:1433;databaseNome=BD23325";
        String usuario = "seu_usuario";
        String senha = "sua_senha";

        try (Connection connection = DriverManager.getConnection(jdbcUrl, usuario, senha)) {
            exibirTabelas(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static void exibirTabelas(Connection connection) {
        try {
            DatabaseMetaData metaData = connection.getMetaData();
            ResultSet resultSet = metaData.getTables(null, null, "%", new String[]{"TABLE"});

            System.out.println("Tabelas no banco de dados:");

            while (resultSet.next()) {
                String nomeTabela = resultSet.getString("TABLE_NAME");
                System.out.println(nomeTabela);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}