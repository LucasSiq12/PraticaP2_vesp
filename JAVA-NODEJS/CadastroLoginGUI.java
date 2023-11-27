import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.HashMap;
import java.util.Map;

public class CadastroLoginGUI extends JFrame {
    private Map<String, String> usuarios; 

    public CadastroLoginGUI() {
        usuarios = new HashMap<>();

   
        setTitle("Cadastro e Login");
        setSize(300, 200);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);

    
        JPanel painel = new JPanel();
        JLabel rotulo = new JLabel("Bem-vindo! Escolha uma opção:");
        JButton btnCadastro = new JButton("Cadastro");
        JButton btnLogin = new JButton("Login");

        painel.add(rotulo);
        painel.add(btnCadastro);
        painel.add(btnLogin);


        add(painel);

        btnCadastro.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                cadastrarUsuario();
            }
        });

        btnLogin.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                fazerLogin();
            }
        });
    }

    private void cadastrarUsuario() {
        String usuario = JOptionPane.showInputDialog("Digite o nome de usuário:");
        String senha = JOptionPane.showInputDialog("Digite a senha:");

        if (usuario != null && senha != null) {
            usuarios.put(usuario, senha);
            JOptionPane.showMessageDialog(this, "Cadastro realizado com sucesso!");
        }
    }

    private void fazerLogin() {
        String usuario = JOptionPane.showInputDialog("Digite o nome de usuário:");
        String senha = JOptionPane.showInputDialog("Digite a senha:");

        if (usuario != null && senha != null) {
            if (usuarios.containsKey(usuario) && usuarios.get(usuario).equals(senha)) {
                JOptionPane.showMessageDialog(this, "Login bem-sucedido!");
            } else {
                JOptionPane.showMessageDialog(this, "Usuário ou senha incorretos. Tente novamente.");
            }
        }
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(new Runnable() {
            @Override
            public void run() {
                new CadastroLoginGUI().setVisible(true);
            }
        });
    }
}