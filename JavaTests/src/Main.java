import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;

public class Main {

    public static void main(String[] args) {
        String jdbcUrl = "jdbc:sqlserver://seu_servidor:porta;databaseNome=seu_banco_dados";
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