package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;


public class CommonUtil {
//	//첨부파일 기부게시판  주소 용우	
//	public static String getFile_dir_dona() {
//		return "C:/Users/jsl505/Desktop/park_work/spring_team_pjt/src/main/webapp/webContent/file_room/dona/";
//				
//	}	
//
////첨부파일 봉사게시판  주소 용우
//	public static String getFile_dir_vol() {
//		return "C:/Users/jsl505/Desktop/park_work/spring_team_pjt/src/main/webapp/webContent/file_room/vol/";
//				
//	}	
	
	//첨부파일 기부게시판 주소 병준
	public static String getFile_dir_dona() {
		return "C:/Users/chlch/Desktop/programming_source/Eclipse_working_spsace/team_project22/src/main/webapp/webContent/file_room/dona";
				
	}	

	//첨부파일 봉사게시판  병준
	public static String getFile_dir_vol() {
		return "C:/Users/chlch/Desktop/programming_source/Eclipse_working_spsace/team_project22/src/main/webapp/webContent/file_room/vol";
				
	}
	
////첨부파일 기부게시판 주소 정환
//	public static String getFile_dir_dona() {
//		return "C:/Users/JSL505-014/Desktop/work_LJH/java_project/team_project33/src/main/webapp/file_room/dona/";
//				
//	}	
//
////첨부파일 봉사게시판  주소	정환
//	public static String getFile_dir_vol() {
//		return "C:/Users/JSL505-014/Desktop/work_LJH/java_project/team_project33/src/main/webapp/file_room/vol/";
//				
//	}
	
//첨부파일 뉴스 주소	
public static String getFile_dir_news() {
	return "C:/Users/admin/eclipse-workspace/jsp_homepage_1/WebContent/file_room/news/";
	
}	


//첨부파일 공지사항 주소	
public static String getFile_dir_notice() {
return "C:/Users/admin/eclipse-workspace/jsp_homepage_1/WebContent/file_room/notice/";

}
//첨부파일 공지사항 주소	
public static String getFile_dir_notice1() {
	return "C:/Users/jsl505/Desktop/park_work/spring_mvc_homepage/src/main/webapp/webContent/file_room/notice/";
	
}	
//	
//	//첨부파일 프리보드
//	public static String getFile_dir_freeboard() {		
//		return "C:/Users/cbjub/eclipse-workspace/jsp_homepage_2/WebContent/file_room/freeboard/";
//	}
//	
	//null이면 공백으로 만들어주는 메소드
	public static String checkNull(String value) {
		
		
		String result="";
		if(value !=null) result = value;
		
		return result;
	}
	
	//오늘날짜
	public static String getToday(){
		Date time = new Date();
		
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		String today = format1.format(time);

		return today;
	}

	//오늘날짜 초단위
	public static String getToday2(){
		Date time = new Date();
		
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
		String today = format1.format(time);

		return today;
	}
	
	//오늘날짜 조회2
	public static String getTodayTime() {
		Date time = new Date();
		SimpleDateFormat format2 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		String time2 = format2.format(time);
		return time2;
	}
	
	//오늘날짜 0000용
	public static String getToday00(){
		Date time = new Date();
		
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		String today = format1.format(time);
		return today+"-00-00-00";
	}
	
	//오늘날짜 23:59:59용
	public static String getToday23(){
		Date time = new Date();
		
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		String today = format1.format(time);
		return today+" 23:59:59";
	}
	//1주 전 날짜 00시00분부터
	public static String getWeek() {
		Calendar week = Calendar.getInstance();
	    week.add(Calendar.DATE , -7);
	    String beforeWeek = new java.text.SimpleDateFormat("yyyy-MM-dd").format(week.getTime());

	    return beforeWeek+"-00-00-00";
	}
	
	//10일 전 날짜 00시 00분부터
	public static String get10ago() {
		Calendar thirtyago = Calendar.getInstance();
	    thirtyago.add(Calendar.DATE , -7);
	    String beforemonth = new java.text.SimpleDateFormat("yyyy-MM-dd").format(thirtyago.getTime());

	    return beforemonth +"-00-00-00";
	}
	
	//오늘날짜-기준날짜 계산 String
	public static String dayaccount(String date) {
		String today = CommonUtil.getToday2();

		
		   String date1 =  today; //날짜1
	       String date2 = date;
	        Date format1 = null;
			try {
				format1 = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss").parse(date1);
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
	        Date format2 = null;
			try {
				format2 = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss").parse(date2);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        
	
	        long diffSec = (format1.getTime() - format2.getTime()) / 1000;
	        long diffMin = (format1.getTime() - format2.getTime()) / 60000; 
	        long diffHor = (format1.getTime() - format2.getTime()) / 3600000; 
	        long diffDays = diffSec / (24*60*60); 
	      
	        String result = "";
	      
	        if(diffSec <= 59){
	        	 result = (diffSec+" 초전");
	        }else if(diffSec>=60 && diffMin <= 59) {
	        	result = (diffMin+" 분 전");
	        }else if(diffMin >= 60 && diffHor <24) {
	        	result = (diffHor+" 시간 전");
	        }else if(diffHor >= 24) {
	        	result =(diffDays+ "일 전");
	        }
	        return result;
	}
	
	//방법 1 (쓸 데에서 객체생성)
	Connection con 		 = null;
	PreparedStatement ps = null;
	ResultSet rs 		= null;
	
	public void setHitCountCommon(String no, String tableName){
		String query ="update "+tableName+" \r\n" + 
					" set hit = hit +1 \r\n" + 
					" where no ='"+no+"'";
		try {
			con = DBConnection.getConnection();
			ps 	= con.prepareStatement(query);
			ps.executeUpdate();
		}catch(SQLException e) {
			System.out.println("setHitCountCommon() 메소드 오류~ ");
			System.out.println("query :"+query);
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
	}
	
	//방법2 static 붙이고 변수 메서드 안쪽에
	public static void setHitCountCommon1(String no, String tableName){
		Connection con 		 = null;
		PreparedStatement ps = null;
		ResultSet rs 		= null;
		String query ="update "+tableName+" \r\n" + 
					" set hit = hit +1 \r\n" + 
					" where no ='"+no+"'";
		try {
			con = DBConnection.getConnection();
			ps 	= con.prepareStatement(query);
			ps.executeUpdate();
		}catch(SQLException e) {
			System.out.println("setHitCountCommon() 메소드 오류~ ");
			System.out.println("query :"+query);
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
	}
	
	
	// 페이지
	public static String pageListPost(int current_page,int totalpage, int pageColCount){
		int pagenumber;    //화면에 보여질 페이지 인덱스수
		int startpage;     //화면에 보여질 시작 페이지 번호
		int endpage;       //화면에 보여질 마지막 페이지 번호
		int curpage;       //이동하고자 하는 페이지 번호
		
		String strList=""; //리턴될 페이지 인덱스 리스트

		pagenumber = pageColCount;   //한 화면의 페이지 인덱스수
		
		//시작 페이지 번호 구하기
		startpage = ((current_page - 1)/ pagenumber) * pagenumber + 1;
		//마지막 페이지 번호 구하기
		endpage = (((startpage -1) + pagenumber) / pagenumber)*pagenumber;
		//총페이지수가 계산된 마지막 페이지 번호보다 작을 경우
		//총페이지수가 마지막 페이지 번호가 됨
		
		if(totalpage <= endpage)  endpage = totalpage;
					
		//첫번째 페이지 인덱스 화면이 아닌경우
		if(current_page > pagenumber){
			curpage = startpage -1;  //시작페이지 번호보다 1적은 페이지로 이동
			strList = strList +"<a href=javascript:goPage('"+curpage+"') ><i class='fa fa-angle-double-left'></i></a>";
		}
						
		//시작페이지 번호부터 마지막 페이지 번호까지 화면에 표시
		curpage = startpage;
		while(curpage <= endpage){
			if(curpage == current_page){
				strList = strList +"<a class='active'>"+current_page+"</a>";
			} else {
				strList = strList +"<a href=javascript:goPage('"+curpage+"')>"+curpage+"</a>";
			}
			curpage++;
		}
		//뒤에 페이지가 더 있는 경우
		if(totalpage > endpage){
			curpage = endpage+1;
			strList = strList + "<a href=javascript:goPage('"+curpage+"') ><i class='fa fa-angle-double-right'></i></a>";
		}
		return strList;
	}	
	
	public static String pageListPost2(int current_page,int totalpage, int pageColCount){
		int pagenumber;    //화면에 보여질 페이지 인덱스수
		int startpage;     //화면에 보여질 시작 페이지 번호
		int endpage;       //화면에 보여질 마지막 페이지 번호
		int curpage;       //이동하고자 하는 페이지 번호
		
		String strList=""; //리턴될 페이지 인덱스 리스트

		pagenumber = pageColCount;   //한 화면의 페이지 인덱스수
		
		//시작 페이지 번호 구하기
		startpage = ((current_page - 1)/ pagenumber) * pagenumber + 1;
		//마지막 페이지 번호 구하기
		endpage = (((startpage -1) + pagenumber) / pagenumber)*pagenumber;
		//총페이지수가 계산된 마지막 페이지 번호보다 작을 경우
		//총페이지수가 마지막 페이지 번호가 됨
		
		if(totalpage <= endpage)  endpage = totalpage;
					
		//첫번째 페이지 인덱스 화면이 아닌경우
		if(current_page > pagenumber){
			curpage = startpage -1;  //시작페이지 번호보다 1적은 페이지로 이동
			strList = strList +"<a class='pag-prev' href=javascript:goPage('"+curpage+"') ></a>";
			//<a class="pag-prev" href=""><span class="blind">prev</span></a>
		}
						
		//시작페이지 번호부터 마지막 페이지 번호까지 화면에 표시
		curpage = startpage;
		strList = strList +"<span class='num'>";
		while(curpage <= endpage){
			
			if(curpage == current_page){
				strList = strList +"<span class='active'>"+current_page+"</span>";
			} else {
				strList = strList +"<a href=javascript:goPage('"+curpage+"')>"+curpage+"</a>";
			}
			curpage++;
		}
		strList = strList +"</span>";
		//뒤에 페이지가 더 있는 경우
		if(totalpage > endpage){
			curpage = endpage+1;
			strList = strList + "<a class='pag-next' href=javascript:goPage('"+curpage+"') ></a>";
		}
		return strList;
	}	
	
}
