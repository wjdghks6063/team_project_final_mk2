package command.index;

import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import common.Command;
import common.CommonUtil;
import dao.Dona_dao;
import dao.Local_dao;
import dao.Manager_dao;
import dao.Missing_dao;
import dao.Vol_dao;
import dto.Dona_dto;
import dto.Local_dto;
import dto.Missing_dto;
import dto.Vol_dto;

public class IndexFunction implements Command {

	@Override
	public void execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		Manager_dao managerdao = new Manager_dao();
		request.setAttribute("Vol_list", managerdao.getVolToday());
		request.setAttribute("list", managerdao.getSearchList());
		
		//-----------기부-----------------------------------------------------------------------------------------------------//
		Dona_dao dao = new Dona_dao();	
		//검색기능q
		String search = request.getParameter("t_search");
		if(search == null) {
		search = "";
		}
		//페이징
		//페이지기능
			String nowPage = request.getParameter("t_nowPage");
			int current_page = 0; //현재 페이지번호
					
			String gulsu = request.getParameter("t_list_setup_count"); 		
			if(gulsu == null){ gulsu="4";}
			int list_setup_count = Integer.parseInt(gulsu); //몇개씩 조회해 올것인가?
						
			int total_count = dao.getTotalCount(search); //전체 행수, 전체 게시글의 수
							
			int total_page = total_count / list_setup_count; //전체 페이지 수	(전체행수 나누기 나누고 싶은 수)	
			int rest = total_count % list_setup_count;//
			if(rest !=0) total_page = total_page+1;
							
			if(nowPage == null){ current_page = 1; 
			}else current_page = Integer.parseInt(nowPage);
						
			int start = (current_page-1)*list_setup_count+1;
			int end = current_page * list_setup_count;
			int k=0;
			int number = total_count-(list_setup_count * (current_page-1));
			String pageView = CommonUtil.pageListPost(current_page, total_page, 2);
						
					
			request.setAttribute("t_gulsu", gulsu);
			request.setAttribute("t_list_setup_count", list_setup_count);
			request.setAttribute("t_total_page", total_page);
			request.setAttribute("t_current_page", current_page);
			request.setAttribute("t_number", number);
			request.setAttribute("t_pageView", pageView);
			request.setAttribute("t_total_count", total_count);
						
			ArrayList<Dona_dto> dtos = dao.DonaList(search,start,end);
			request.setAttribute("t_dtos", dtos);
						
			request.setAttribute("t_search", search);
			
	//-----------봉사-----------------------------------------------------------------------------------------------------//
			Vol_dao vdao = new Vol_dao();
			//검색기능
			
			String vsearch = request.getParameter("t_local");
			if(vsearch == null) {
				
				vsearch = "";
			}
			//페이징
			//페이지기능
					String vnowPage = request.getParameter("t_nowPage");
					int vcurrent_page = 0; //현재 페이지번호
					
					String vgulsu = request.getParameter("t_list_setup_count"); 		
					if(vgulsu == null){ vgulsu="3";}
					int vlist_setup_count = Integer.parseInt(vgulsu); //몇개씩 조회해 올것인가?
							
					int vtotal_count = vdao.getTotalCount(vsearch); //전체 행수, 전체 게시글의 수
						
					int vtotal_page = vtotal_count / vlist_setup_count; //전체 페이지 수	(전체행수 나누기 나누고 싶은 수)	
					int vrest = vtotal_count % vlist_setup_count;//
					if(vrest !=0) vtotal_page = vtotal_page+1;
						
					if(vnowPage == null){ vcurrent_page = 1; 
					}else vcurrent_page = Integer.parseInt(vnowPage);
					
					int vstart = (vcurrent_page-1)*vlist_setup_count+1;
					int vend = vcurrent_page * vlist_setup_count;
					int vk=0;
					int vnumber = vtotal_count-(vlist_setup_count * (vcurrent_page-1));
					String vpageView = CommonUtil.pageListPost(vcurrent_page, vtotal_page, 2);
					
				
					request.setAttribute("t_vgulsu", vgulsu);
					request.setAttribute("t_vlist_setup_count", vlist_setup_count);
					request.setAttribute("t_vtotal_page", vtotal_page);
					request.setAttribute("t_vcurrent_page", vcurrent_page);
					request.setAttribute("t_vnumber", vnumber);
					request.setAttribute("t_vpageView", vpageView);
					request.setAttribute("t_vtotal_count", vtotal_count);
			
			
			
					ArrayList<Vol_dto> vdtos = vdao.VolList(vsearch,vstart,vend);
					request.setAttribute("t_vdtos", vdtos);
					
					request.setAttribute("t_vsearch", vsearch);
		
	//-----------지역뉴스-----------------------------------------------------------------------------------------------------//
	Local_dao ldao = new Local_dao();
	//검색기능
	
	String lsearch = request.getParameter("t_search");//기부뉴스냐 봉사뉴스냐
	if(lsearch == null) {
		
		lsearch = "";
	}
	//페이징
	//페이지기능
			String lnowPage = request.getParameter("t_nowPage");
			int lcurrent_page = 0; //현재 페이지번호
			
			String lgulsu = request.getParameter("t_llist_setup_count"); 		
			if(lgulsu == null){ lgulsu="4";}
			int llist_setup_count = Integer.parseInt(lgulsu); //몇개씩 조회해 올것인가?
					
			int ltotal_count = ldao.getTotalCount(lsearch); //전체 행수, 전체 게시글의 수
				
			int ltotal_page = ltotal_count / llist_setup_count; //전체 페이지 수	(전체행수 나누기 나누고 싶은 수)	
			int lrest = ltotal_count % llist_setup_count;//
			if(lrest !=0) ltotal_page = ltotal_page+1;
				
			if(lnowPage == null){ lcurrent_page = 1; 
			}else lcurrent_page = Integer.parseInt(lnowPage);
			
			int lstart = (lcurrent_page-1)*llist_setup_count+1;
			int lend = lcurrent_page * llist_setup_count;
			int lk=0;
			int lnumber = ltotal_count-(llist_setup_count * (lcurrent_page-1));
			String lpageView = CommonUtil.pageListPost(lcurrent_page, ltotal_page, 2);
			
		
			request.setAttribute("t_lgulsu", lgulsu);
			request.setAttribute("t_llist_setup_count", llist_setup_count);
			request.setAttribute("t_ltotal_page", ltotal_page);
			request.setAttribute("t_lcurrent_page", lcurrent_page);
			request.setAttribute("t_lnumber", lnumber);
			request.setAttribute("t_lpageView", lpageView);
			request.setAttribute("t_ltotal_count", ltotal_count);
	
	
	
			ArrayList<Local_dto> ldtos = ldao.LocalList(lsearch,lstart,lend);
			request.setAttribute("t_ldtos", ldtos);
			
			request.setAttribute("t_lsearch", lsearch);
	
			//-----------실종아동-----------------------------------------------------------------------------------------------------//

			Missing_dao mdao = new Missing_dao();
			
			String lost_area 		= request.getParameter("t_lost_area");
			String lost_date_start 	= request.getParameter("t_lost_date_start");
			String lost_date_end 	= request.getParameter("t_lost_date_end");
			String gender 			= request.getParameter("t_gender");
	 
			if(lost_area == null) {
				Calendar mon = Calendar.getInstance();
				mon.add(Calendar.MONTH , -1);
				String beforeMonth = new java.text.SimpleDateFormat("yyyy-MM-dd").format(mon.getTime());				
				
				lost_area ="대전";
				lost_date_start = beforeMonth; //오늘날짜 부터 한달 전
				lost_date_end = CommonUtil.getToday();
				gender ="all";
			}	
			
			/* paging start*/
			String mnowPage = request.getParameter("t_nowPage");
			int mcurrent_page = 0; // 현재페이지 번호
			int mtotal_page = 0;    // 전체 페이지 수
			int mtotal_count = mdao.getTotalCount(lost_area,lost_date_start,lost_date_end,gender); // 전체 행수 21
			int mlist_setup_count = 10;  //한페이지당 출력 행수 
			
			if(mnowPage == null || mnowPage.equals("")) mcurrent_page = 1; 
			else mcurrent_page = Integer.parseInt(mnowPage);
			
			mtotal_page = mtotal_count / mlist_setup_count;  // 몫 : 2
			int mrest = 	mtotal_count % mlist_setup_count;   // 나머지:1
			if(mrest !=0) mtotal_page = mtotal_page + 1;     // 3
			
			int mstart = (mcurrent_page -1) * mlist_setup_count + 1;
			int mend   = mcurrent_page * mlist_setup_count;
			
			// 넘버링 순서
			int morder = mtotal_count - ((mcurrent_page-1) * mlist_setup_count);
			/* paging end*/			

			ArrayList<Missing_dto> mdtos = mdao.getMissingList(lost_area, lost_date_start,lost_date_end,gender,start,end); 
			
			/* 지역별 지도 중심 위치 좌표
			// 대전JSL 36.32726796209588, 127.40736201995023
			// 서울시청 37.56592564927031, 126.97804425449569
			// 대구시청 35.87158715263924, 128.60177155550676
			// 부산시청 35.179835430196796, 129.07498636436745 
			*/
			//default : 대전
			String mapLat="36.32726796209588";
			String mapLng="127.40736201995023";
			if(lost_area.equals("서울")) {
				mapLat = "37.56592564927031";
				mapLng = "126.97804425449569";			
			} else if(lost_area.equals("대구")) {
				mapLat = "35.87158715263924";
				mapLng = "128.60177155550676";			
			} else if(lost_area.equals("부산")) {
				mapLat = "35.179835430196796";
				mapLng = "129.07498636436745";			
			}
			request.setAttribute("t_mapLat", mapLat);
			request.setAttribute("t_mapLng", mapLng);		
			
			request.setAttribute("t_mdtos", mdtos);
			request.setAttribute("t_lost_area", lost_area);
			request.setAttribute("t_lost_date_start", lost_date_start);
			request.setAttribute("t_lost_date_end", lost_date_end);
			request.setAttribute("t_gender", gender);
			request.setAttribute("t_mcurrent_page", mcurrent_page); 
			request.setAttribute("t_mtotal_page", mtotal_page);
			request.setAttribute("t_mtotal_count", mtotal_count);
			request.setAttribute("t_morder", morder);			
			
			//-----------오늘의 참여현황-----------------------------------------------------------------------------------------------------//
			
			
			
			
			
			
			
	}	
	
}
