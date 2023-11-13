import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionSQL
{
    public static void main(String[] args)
    {
        String url = "jdbc:sqlserver://REGULUS:1433;datbaseName=BD23325";
        String usuario = "BD23325";
        String senha = "BD23325";

        try
        {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conexao = DriverManager.getConnection(url, usuario, senha);

            //Lógica

            conexao.close();
        }
        catch (ClassNotFoundException | SQLException e)
        {
            e.printStackTrace();
        }
    }
}