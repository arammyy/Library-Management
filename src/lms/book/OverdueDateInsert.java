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


/*설명서
 * setOverdue() 메서드를 호출하면 연체일 수를 연산해서 
 * lib_member 테이블의 mem_overdue 칼럼에 연체 끝나는 날짜가 입력됩니다.
 * */

public class OverdueDateInsert{
	//GregorianCalendar calendar;	
	ConnectionManager conn;
	String rental_id;	//이사람의 대출번호
	String member_id;	//이사람의 회원ID
	
	public OverdueDateInsert() {	//생성자
		rental_id="1";	//임시
		conn=new ConnectionManager();
		
		//호출하면 lib_member에 연체일 입력됨
		setOverdue();
	}
	
	//연체할 값을 오늘 날짜에 더해서 lib_member의 mem_overdue에 update 하자
	public void setOverdue() {
		long diffDays=getOverdue();	//몇일 연체할지의 값
		String plusDate=plusDate(diffDays);	//연체가 끝나는 날짜
		
		Connection con=conn.getConn();
		PreparedStatement pstmt=null;
		
		String sql="update lib_member set mem_overdue="+plusDate+" where mem_id="+member_id+"";
		//update lib_member set mem_overdue="+plusDate+" where mem_id="+이사람의 회원ID
		
		try {
			pstmt=con.prepareStatement(sql);
			int result=pstmt.executeUpdate();
			
			if(result==1) {
				JOptionPane.showMessageDialog(null, "연체 종료날짜는 : "+plusDate+"입니다.");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conn.disconnect(pstmt);
		}
	}
	
	//대출날짜와 반납날짜를 비교해서 몇일 연체시킬지 정하는 메서드
	//필요한 외부부품 -> 반납한 사람의 회원ID
	public long getOverdue() {
		Connection con=conn.getConn();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		long diffDays=0;
		
		//rental_id는 방금 도서 반납한 사람의 대출ID
		String sql="select rental_id, member_id, rental_date, return_date from lib_rental_Table where rental_id="+rental_id;
		System.out.println(sql);
		try {
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				rental_id=rs.getString("rental_id");	//대출ID
				member_id=rs.getString("member_id");	//해당 대출ID에 대응하는 회원ID
				String rental_date=rs.getString("rental_date");	//대출날짜
				String return_date=rs.getString("return_date");	//반납예정일
				System.out.println("이사람의 대출날짜는 : "+rental_date);
				System.out.println("이사람의 원래 반납예정날짜는 : "+return_date);
				//rental_date와 return_date 날짜 차이
				diffDays=diffDays(rental_date, return_date);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conn.disconnect(pstmt, rs);
		}
		return diffDays;
	}
	
	//오늘의 날짜 구하는 메서드
	public String todayDate() {
		SimpleDateFormat fm1 = new SimpleDateFormat("yyyyMMdd");
	    String date = fm1.format(new Date());
	    System.out.println("현재시간 년월일 = " + date);
	    
	    return date;
	}
	
	//두날짜의 차이 구하기
	public long diffDays(String start, String end) {
		long dDays=0;
		try {
			SimpleDateFormat formatter=new SimpleDateFormat("yyyyMMdd");
			Date beginDate = formatter.parse(start);
			Date endDate = formatter.parse(end);
			
			//시간차이를 시간,분,초를 곱한 값으로 나누면 하루 단위가 나옴
			long diff = endDate.getTime() - beginDate.getTime();
			long diffDays = diff / (24*60*60*1000);
			dDays=diffDays;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return dDays;
	}
	
	//현재날짜에 연체해야 될 날짜 더하는 메서드
	public String plusDate(long diffDays) {
		Calendar calendar = new GregorianCalendar(Locale.KOREA);
		calendar.setTime(new Date());
		int diffDaysInt=(int)diffDays;
		
		calendar.add(Calendar.DAY_OF_YEAR, diffDaysInt); // 오늘 날짜에서 연체일 수 더하기.

	    SimpleDateFormat fm = new SimpleDateFormat("yyyyMMdd");
	    String strDate = fm.format(calendar.getTime());
	    System.out.println("연체가 끝나는 날짜는 : "+strDate);
	    
	    return strDate;
	}
}
