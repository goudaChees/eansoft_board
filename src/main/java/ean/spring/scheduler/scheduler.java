package ean.spring.scheduler;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import ean.spring.dao.TempDAO;
import ean.spring.dto.joadb_usersDTO;

@Component
public class scheduler {
	
	int num = 1;
	
	public scheduler() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(Exception e) {
			e.printStackTrace();	
		}
	}
	
	private Connection getAnotherConnection() throws Exception {
		return DriverManager.getConnection("jdbc:oracle:thin:@192.168.0.17:1521:xe","joadb","joadb");
	}	
	
	private Connection getConnection() throws Exception {
		return DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","eansoft","eansoft");
	}	
	
	
	@Scheduled(cron = "0 10 19 * * *")
	public void autoUpdate() {
		
		System.out.println("minutes Scheduled Automatic : "+num);
		num++;
	
    	String sql = "select * from users order by user_no";
    	List<joadb_usersDTO> list = new ArrayList<>();
    	
		try (
				Connection con = this.getAnotherConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
				System.out.println(con.isClosed()?"접속종료":"접속중");// 접속중(false), 접속종료(true)
			//pstat.setString(1, id);
				while (rs.next()) {
					
					int user_no = rs.getInt("user_no");
					String id = rs.getString("id");
					String password = rs.getString("password");
					String name = rs.getString("name");
					String phone = rs.getString("phone");
					String email = rs.getString("email");
					
					joadb_usersDTO dto = new joadb_usersDTO(user_no,id,password,name,phone,email);
					list.add(dto);					
					
					System.out.println("select 완료");
					
				}
				con.close();
				System.out.println(con.isClosed()?"접속종료":"접속중");
				
		}catch (Exception e) {
            e.printStackTrace();
        }
		
    	String sql2 = "insert into joadb_users values(?, ?, ?, ?, ?, ?)";
    	try (
    			Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql2);
				){
    		
    		for(int i = 0; i < list.size(); i++) {
	    		pstat.setInt(1, list.get(i).getUser_no());
	    		pstat.setString(2, list.get(i).getId());
	    		pstat.setString(3, list.get(i).getPassword());
				pstat.setString(4, list.get(i).getName());
				pstat.setString(5, list.get(i).getPhone());
				pstat.setString(6, list.get(i).getEmail());
	
				pstat.executeUpdate();
				System.out.println("insert 완료");
    		}
			//con.commit();
			System.out.println("commit 완료");
		}catch (Exception e) {
			e.printStackTrace();
		}
		
    }

	
	@Scheduled(cron = "0 12 19 * * *")
	public void autoUpdate2() {
		try {
			URL url = new URL("http://192.168.0.17:8088/JOA/api/stat");
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			//String tmp;
			String tmp2 =  br.readLine();
			System.out.println("DATA >> " + tmp2);

			
			for (int i = 0; i < tmp2.split(",").length; i++ ) {
				System.out.println("split ["+i+"] >> "+tmp2.split(",")[i]);
			}
			
			/*while((tmp = br.readLine()) != null) {
				if (tmp.contains("REGDATE")) {
					//System.out.println(tmp.split("\">")[1].split("<")[0]);
					//System.out.println("firstsplit"+tmp.split("\">")[1]);
					System.out.println("split >> "+tmp.split(",")[0]);
				}
			}*/
			
			con.disconnect();
			br.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	
		
//		Connection conn = null;		 
        // 2. 연결 문자열 생성
        // -접속에 필요한 정보로 구성된 문자열, Connection String
//        String url = "jdbc:oracle:thin:@192.168.0.17:1521:xe"; //localhost대신 ip주소가 들어갈수도
//        String id = "joadb";
//        String pw = "joadb";
 
        // DB작업 > 외부 입출력 > try-catch 필수 
//        try {
//            // 3. JDBC 드라이버 로딩
//            Class.forName("oracle.jdbc.driver.OracleDriver");
// 
//            // 4. 접속
//            // - Connection 객체 생성 + 접속 작업.
//            conn = DriverManager.getConnection(url, id, pw);
//            System.out.println(con.isClosed()?"접속종료":"접속중");// 접속중(false), 접속종료(true)         
            // 5. SQL
            // 6. 접속종료
//            con.close();
//            System.out.println(con.isClosed()?"접속종료":"접속중");// 접속중(false), 접속종료(true)

// insert 
/*			String sql = "insert into contact values(contact_seq.nextval, ? , ?, default)";
    		try (Connection con = this.getConnection();
    				PreparedStatement pstat = con.prepareStatement(sql);
    				){
    			pstat.setString(1, dto.getPname());
    			pstat.setString(2, dto.getPcontact());

    			int result = pstat.executeUpdate();
    			con.commit();
    			
    		}	*/	
	
// select 에 value 포함
/*			String sql = "select * from board where seq = ?";
		try (
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);		
				) {
			pstat.setInt(1, bseq);
			try (
					ResultSet rs = pstat.executeQuery();	
					) {
				BoardDTO dto = null;
				if(rs.next()) {
					int seq = rs.getInt("seq");
					String title = rs.getString("title");
					String contents = rs.getString("contents");
					String writer = rs.getString("writer");
					Timestamp write_date = rs.getTimestamp("write_date");
					int view_count = rs.getInt("view_count");
					
					dto = new BoardDTO(seq,title,contents,writer,write_date,view_count);
				}
				return dto;
			}
		}	*/
	
// select all
/*			String sql = "select * from board order by seq desc";
		try (
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			List<BoardDTO> list = new ArrayList<>();

			while(rs.next()) {
				int seq = rs.getInt("seq");
				String title = rs.getString("title");
				String contents = rs.getString("contents");
				String writer = rs.getString("writer");
				Timestamp write_date = rs.getTimestamp("write_date");
				int view_count = rs.getInt("view_count");

				BoardDTO dto = new BoardDTO(seq,title,contents,writer,write_date,view_count);
				list.add(dto);
			}
			return list;
		}	*/
		
//	update
/*			String sql = "update board set title =?, contents=? where seq=?";
		try (
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, dto.getTitle());
			pstat.setString(2, dto.getContents());
			pstat.setInt(3, dto.getSeq());
			
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}	*/
	
	
// delete
/*			String sql = "delete from board where seq = ?";
		try (
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}	
		
			*
			*/
	
	
	
	
	
}
