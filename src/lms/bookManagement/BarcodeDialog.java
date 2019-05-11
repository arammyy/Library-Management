package lms.bookManagement;

import java.awt.BorderLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class BarcodeDialog extends JDialog{
	JPanel p_center, p_south;
	JLabel l_barcode;
	JTextField t_barcode;
	JButton bt_ok, bt_cancel;
	BookList main;
	BookRequest req;
	boolean flag;
	public BarcodeDialog(JPanel main, int index) {
		// TODO Auto-generated constructor stub
		if(index == 0) {
			this.main = (BookList)main;
			flag = true;
		}
		else if(index ==1){
			this.req = (BookRequest)main;
			flag = false;
		}	
		setLayout(new BorderLayout());
		p_center = new JPanel();
		l_barcode = new JLabel("바코드 : ");
		t_barcode = new JTextField(13);
		
		p_center.add(l_barcode);
		p_center.add(t_barcode);
		
		p_south = new JPanel();
		bt_ok = new JButton("확인");
		bt_ok.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				if(t_barcode.getText().equals(""))
				{
					JOptionPane.showMessageDialog(main, "바코드를 스캔하세요");
					t_barcode.setFocusable(true);
				}
				else {
					buttonOption();
					dispose();
				}
			}
		});
		bt_cancel = new JButton("취소");
		bt_cancel.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				dispose();
			}
		});
		p_south.add(bt_ok);
		p_south.add(bt_cancel);
		
		add(p_center);
		add(p_south, BorderLayout.SOUTH);
		this.pack();
		setModal(true);
		setLocationRelativeTo(main);
		setVisible(true);
	}
	public void buttonOption() {
		Long barcode = new Long(t_barcode.getText());
		if(flag) {
			barcode = Long.parseLong(t_barcode.getText());
			main.registBook(barcode);
			main.t_num.setText("");
			main.t_name.setText("");
			main.t_publisher.setText("");
			main.t_writer.setText("");
			main.t_registDay.setText("");
			main.t_rentalPerson.setText("");
			main.ch_category.select(0);
			main.ch_condition.select(0);
			
			main.t_registDay.setEditable(true);
			main.t_rentalPerson.setEditable(true);
			main.ch_condition.setEnabled(true);
			main.ch_rentalCondition.setEnabled(true);
			main.showBookList(0);
			main.bt_regist.setText("신규");
			main.b_btflag=true;
		}
		else
		{
			req.edit(barcode);
			req.delete();
			req.selectRequest();
		}
	}
}
