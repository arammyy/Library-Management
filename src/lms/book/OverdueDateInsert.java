package lms.book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;

import javax.swing.JOptionPane;

import lms.db.ConnectionManager;


/*����
 * setOverdue() �޼��带 ȣ���ϸ� ��ü�� ���� �����ؼ� 
 * lib_member ���̺��� mem_overdue Į���� ��ü ������ ��¥�� �Էµ˴ϴ�.
 * */

public class OverdueDateInsert{
	//GregorianCalendar calendar;	
	ConnectionManager conn;
	String rental_id;	//�̻���� �����ȣ
	String member_id;	//�̻���� ȸ��ID
	
	public OverdueDateInsert() {	//������
		rental_id="1";	//�ӽ�
		conn=new ConnectionManager();
		
		//ȣ���ϸ� lib_member�� ��ü�� �Էµ�
		setOverdue();
	}
	
	//��ü�� ���� ���� ��¥�� ���ؼ� lib_member�� mem_overdue�� update ����
	public void setOverdue() {
		long diffDays=getOverdue();	//���� ��ü������ ��
		String plusDate=plusDate(diffDays);	//��ü�� ������ ��¥
		
		Connection con=conn.getConn();
		PreparedStatement pstmt=null;
		
		String sql="update lib_member set mem_overdue="+plusDate+" where mem_id="+member_id+"";
		//update lib_member set mem_overdue="+plusDate+" where mem_id="+�̻���� ȸ��ID
		
		try {
			pstmt=con.prepareStatement(sql);
			int result=pstmt.executeUpdate();
			
			if(result==1) {
				JOptionPane.showMessageDialog(null, "��ü ���ᳯ¥�� : "+plusDate+"�Դϴ�.");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conn.disconnect(pstmt);
		}
	}
	
	//���⳯¥�� �ݳ���¥�� ���ؼ� ���� ��ü��ų�� ���ϴ� �޼���
	//�ʿ��� �ܺκ�ǰ -> �ݳ��� ����� ȸ��ID
	public long getOverdue() {
		Connection con=conn.getConn();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		long diffDays=0;
		
		//rental_id�� ��� ���� �ݳ��� ����� ����ID
		String sql="select rental_id, member_id, rental_date, return_date from lib_rental_Table where rental_id="+rental_id;
		System.out.println(sql);
		try {
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				rental_id=rs.getString("rental_id");	//����ID
				member_id=rs.getString("member_id");	//�ش� ����ID�� �����ϴ� ȸ��ID
				String rental_date=rs.getString("rental_date");	//���⳯¥
				String return_date=rs.getString("return_date");	//�ݳ�������
				System.out.println("�̻���� ���⳯¥�� : "+rental_date);
				System.out.println("�̻���� ���� �ݳ�������¥�� : "+return_date);
				//rental_date�� return_date ��¥ ����
				diffDays=diffDays(rental_date, return_date);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conn.disconnect(pstmt, rs);
		}
		return diffDays;
	}
	
	//������ ��¥ ���ϴ� �޼���
	public String todayDate() {
		SimpleDateFormat fm1 = new SimpleDateFormat("yyyyMMdd");
	    String date = fm1.format(new Date());
	    System.out.println("����ð� ����� = " + date);
	    
	    return date;
	}
	
	//�γ�¥�� ���� ���ϱ�
	public long diffDays(String start, String end) {
		long dDays=0;
		try {
			SimpleDateFormat formatter=new SimpleDateFormat("yyyyMMdd");
			Date beginDate = formatter.parse(start);
			Date endDate = formatter.parse(end);
			
			//�ð����̸� �ð�,��,�ʸ� ���� ������ ������ �Ϸ� ������ ����
			long diff = endDate.getTime() - beginDate.getTime();
			long diffDays = diff / (24*60*60*1000);
			dDays=diffDays;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return dDays;
	}
	
	//���糯¥�� ��ü�ؾ� �� ��¥ ���ϴ� �޼���
	public String plusDate(long diffDays) {
		Calendar calendar = new GregorianCalendar(Locale.KOREA);
		calendar.setTime(new Date());
		int diffDaysInt=(int)diffDays;
		
		calendar.add(Calendar.DAY_OF_YEAR, diffDaysInt); // ���� ��¥���� ��ü�� �� ���ϱ�.

	    SimpleDateFormat fm = new SimpleDateFormat("yyyyMMdd");
	    String strDate = fm.format(calendar.getTime());
	    System.out.println("��ü�� ������ ��¥�� : "+strDate);
	    
	    return strDate;
	}
}
