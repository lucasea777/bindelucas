/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.awt.event.KeyEvent;
import static java.awt.image.ImageObserver.WIDTH;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.DefaultListModel;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.ListModel;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Luks
 */
public final class ContactList extends javax.swing.JFrame {

    /**
     * Creates new form ContactList
     */
    DefaultTableModel model;
    ArrayList<String> list;
    static String gargs[];
    String dir = "";

    public ContactList() {        
        String filter = "";
        initComponents();
        setLocationRelativeTo(null);
        for (int i = 0; i < gargs.length; i++) {
            if (null != gargs[i]) {
                switch (gargs[i]) {
                    case "-dir":
                        dir = gargs[i + 1];
                        break;
                    case "-filter":
                        filter = gargs[i + 1];
                        break;
                    case "-h":
                        printHelp();
                        System.exit(0);
                        break;
                    case "--help":
                        printHelp();
                        System.exit(0);
                        break;
                }
            }
        }
        dir = "".equals(dir) ? "." : dir;
        setTitle("ContactList - " + dir);
	setAlwaysOnTop(true);
        jTextField1.setText(filter);
        // Listen for changes in the text        
        model = (DefaultTableModel) jTable1.getModel();
        //build master list
        Scanner s = null;
        String datatxtPath = combine(dir,"data.txt");
        try {            
            s = new Scanner(new File(datatxtPath));
        } catch (FileNotFoundException ex) {
            System.out.println("No encuentro el archivo "+datatxtPath+" :/");
            System.exit(0);
        }
        list = new ArrayList<>();
        while (s.hasNextLine()) {
            list.add(s.nextLine());
        }
        s.close();

        jTextField1.getDocument().addDocumentListener(new DocumentListener() {
            @Override
            public void changedUpdate(DocumentEvent e) {
                refresh();
            }

            @Override
            public void removeUpdate(DocumentEvent e) {
                refresh();
            }

            @Override
            public void insertUpdate(DocumentEvent e) {
                refresh();
            }
        });
        jTextField1.addKeyListener(new java.awt.event.KeyAdapter() {
            @Override
            public void keyPressed(java.awt.event.KeyEvent evt) {
                if (evt.getKeyChar() == '\n') {
                    System.out.println(jTable1.getValueAt(jTable1.getSelectedRow(), 0) + "\t"
                            + jTable1.getValueAt(jTable1.getSelectedRow(), 1));
                    System.exit(0);
                } else if (KeyEvent.VK_DOWN == evt.getKeyCode() || evt.getKeyCode() == KeyEvent.VK_UP) {
                    int newRow = jTable1.getSelectedRow() + (KeyEvent.VK_DOWN == evt.getKeyCode() ? 1 : -1);
                    if (newRow < jTable1.getRowCount() && newRow > -1) {
                        jTable1.setRowSelectionInterval(newRow, newRow);
                    }
                }
            }
        });
        
        jTable1.getSelectionModel().addListSelectionListener(new ListSelectionListener() {

            @Override
            public void valueChanged(ListSelectionEvent e) {

                if (jTable1.getSelectedRow() != -1) {
                    String uid = (String) jTable1.getValueAt(jTable1.getSelectedRow(), 1);     
                    String iconPath = combine(combine(dir,"img"),uid + ".jpg");
                    jLabel1.setIcon(new javax.swing.ImageIcon(iconPath));
                }
            }
        });

        refresh();

    }
    private void printHelp() {
        System.out.println("[-dir <directorio> (directorio con data.txt y carpeta img)] [-filter <filtro>]");
    }
    
    public static String combine(String path1, String path2) {
        File file1 = new File(path1);
        File file2 = new File(file1, path2);
        return file2.getPath();
    }

    public void refresh() {
        //limpiar tabla
        while (model.getRowCount() > 0) {
            for (int i = 0; i < model.getRowCount(); ++i) {
                model.removeRow(i);
            }
        }
        for (String e : list) {
            e = e.toLowerCase();
            String f = jTextField1.getText().toLowerCase();
            if (e.startsWith(f) || e.contains(' ' + f)) {
                String str[] = e.split("\t");
                model.addRow(new Object[]{str[0], str[1]});

            }
        }

        if (model.getRowCount() > 0) {
            jTable1.setRowSelectionInterval(0, 0);
        }
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jTextField1 = new javax.swing.JTextField();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        jLabel1 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("ContactList");

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Name", "UID"
            }
        ));
        jScrollPane1.setViewportView(jTable1);

        //jLabel1.setIcon(new javax.swing.ImageIcon("---\\NetBeansProjects\\ContactList\\icon.jpg")); // NOI18N

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 0, Short.MAX_VALUE)
                    .addComponent(jTextField1)
                    .addGroup(javax.swing.GroupLayout.Alignment.LEADING, layout.createSequentialGroup()
                        .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 276, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(0, 0, Short.MAX_VALUE)))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jTextField1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 65, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 203, Short.MAX_VALUE)
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        gargs = args;
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(ContactList.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(ContactList.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(ContactList.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(ContactList.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new ContactList().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel jLabel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable jTable1;
    private javax.swing.JTextField jTextField1;
    // End of variables declaration//GEN-END:variables

}
