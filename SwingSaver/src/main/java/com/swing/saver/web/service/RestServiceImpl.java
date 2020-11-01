package com.swing.saver.web.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.swing.saver.web.entity.AdminVo;
import com.swing.saver.web.entity.AreaVo;
import com.swing.saver.web.entity.FarVo;
import com.swing.saver.web.entity.GolfVo;
import com.swing.saver.web.entity.GroupVo;
import com.swing.saver.web.entity.LoginVo;
import com.swing.saver.web.entity.ProVo;
import com.swing.saver.web.entity.ScoreMaster;
import com.swing.saver.web.entity.UserVo;
import com.swing.saver.web.exception.ApiException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;
import java.util.Base64.Encoder;

/**
 * Created by mycom on 2019-05-29.
 */
@Service
public class RestServiceImpl implements RestService {
    private final static Logger LOGGER = LoggerFactory.getLogger(RestServiceImpl.class);

    @Autowired
    private SendMessage sendMessage;

    @Value("${oAuth.grant_type}")
    private String grantType;

    @Resource(name = "uploadPath")
    private String uploadPath;
    
    @Override
    public LoginVo loginProcess(LoginVo loginVo, HttpSession session) throws ApiException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        String json = "";
        String rtnJson = "";

        try {

            LOGGER.debug("authUser 시작:{}",json);
            rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(loginVo),"/ords/swing/saver/authenticate","POST", "application/json",false);

            loginVo = mapper.readValue(rtnJson,LoginVo.class);
            LOGGER.debug("authUser 시작:{}",rtnJson);

        } catch (JsonProcessingException e) {
            throw new ApiException(e.getMessage());
        }
        return loginVo;
    }
    @Override
    public LoginVo loginSnsProcess(LoginVo loginVo, HttpSession session) throws ApiException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        String json = "";
        String rtnJson = "";

        try {

            LOGGER.debug("authUser 시작:{}",json);
            rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(loginVo),"/ords/swing/saver/snsauth","POST", "application/json",false);

            loginVo = mapper.readValue(rtnJson,LoginVo.class);
            LOGGER.debug("authUser 시작:{}",rtnJson);

        } catch (JsonProcessingException e) {
            throw new ApiException(e.getMessage());
        }
        return loginVo;
    }
    @Override
    public String emailList(UserVo userVo) throws ApiException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        String rtnJson = "";
        Map<String,String> map = new HashMap<String, String>();
        map.put("firstname",userVo.getFirstname());
        map.put("lastname",userVo.getLastname());
        map.put("dob",userVo.getDob());

        LOGGER.debug("emailList 시작:{}",map.toString());

        rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(map),"/ords/swing/saver/email","POST", "application/json",false);
        LOGGER.debug("emailList 끝:{}",rtnJson);

        return rtnJson;
    }

    @Override
    public String oAuthToken() {

        String rtnJson = "";

        try {
            rtnJson = sendMessage.sendHttpsStr(grantType,"/ords/swing/oauth/token","POST", "application/x-www-form-urlencoded",true);

            LOGGER.debug("oAuthToken 파라미터:{},응답:{}",grantType,rtnJson);
        } catch (ApiException e) {
            e.printStackTrace();
        }

        return rtnJson;
    }

    @Override
    public String join(Map<String, String> joinMap) throws ApiException, JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(joinMap),"/ords/swing/saver/preuser","POST", "application/json",true);

        LOGGER.debug("회원 가입 파라미터:{},응답:{}",joinMap.toString(),rtnJson);

        return rtnJson;
    }

    @Override
    public UserVo getMemberInfo(long userId) throws ApiException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        UserVo userVo = null;

        String rtnJson= "";
        String param = Long.toString(userId);
        rtnJson = sendMessage.sendHttpsStr("/ords/swing/saver/user4web/"+param,"GET", "application/json",true);
        LOGGER.debug("회원 정보 파라미터:{},응답:{}",param,rtnJson);
        userVo = mapper.readValue(rtnJson,UserVo.class);

        return userVo;
    }

    @Override
    public String modify(Map<String, String> params) throws ApiException,JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(params),"/ords/swing/saver/user4web","PUT", "application/json",true);

        LOGGER.debug("회원 수정 파라미터:{},응답:{}",mapper.writeValueAsString(params),rtnJson);

        return rtnJson;
    }

    @Override
    public String emailConfirm(String key) throws JsonProcessingException, ApiException {
        ModelAndView mv = new ModelAndView();
        ObjectMapper mapper = new ObjectMapper();
        Map<String,String> map = new HashMap<String, String>();
        map.put("confirmCode",key);

        String rtnJson = "";
        rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(map),"/ords/swing/saver/user","POST", "application/json",true);

        LOGGER.debug("회원 가입 인증Key 파라미터:{},응답:{}",mapper.writeValueAsString(map),rtnJson);

        return rtnJson;
    }

    @Override
    public GroupVo getUserGroupInfo(String groupId) throws ApiException, IOException {

        ObjectMapper mapper = new ObjectMapper();
        GroupVo groupVo = new GroupVo();

        String rtnJson= "";
        rtnJson = sendMessage.sendHttpsStr("/ords/swing/saver/group/"+groupId,"GET", "application/json",true);
        LOGGER.debug("회원 그룹 정보 파라미터:{},응답:{}",groupId,rtnJson);
        groupVo = mapper.readValue(rtnJson,GroupVo.class);

        return groupVo;
    }

    @Override
    public String groupCreate(Map<String, String> params) throws JsonProcessingException, ApiException {
        ObjectMapper mapper = new ObjectMapper();
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(params),"/ords/swing/saver/group","POST", "application/json",true);

        LOGGER.debug("그룹 가입 파라미터:{},응답:{}",params.toString(),rtnJson);

        return rtnJson;
    }   
    /**
     * 관리자모드에서 선택된 그룹을 삭제한다. 
     */
    @Override
    public String groupDelete(Map<String, String> params) throws JsonProcessingException, ApiException {
        ObjectMapper mapper = new ObjectMapper();
        String rtnJson = "";
        if(params.get("groupid").indexOf(",") == -1) {
            rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(params), "/ords/swing/saver/group", "DELETE", "application/json", true);
        }else{
            String[] subgrpList = params.get("groupid").split(",");
            Map<String,String> sendMap = new HashMap<String, String>();
            for (String str: subgrpList) {
                sendMap.clear();
                sendMap.put("groupid",str);
                rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(sendMap), "/ords/swing/saver/group", "DELETE", "application/json", true);
            }

        }
        LOGGER.debug("그룹 삭제 파라미터:{},응답:{}",params.toString(),rtnJson);

        return rtnJson;
    }    

    /**
     * 그룹 멤버 가입
     * 
     */
    @Override
    public String grpMemberCreate(Map<String, String> params) throws JsonProcessingException, ApiException {
        ObjectMapper mapper = new ObjectMapper();
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(params),"/ords/swing/saver/groupmember","POST", "application/json",true);

        LOGGER.debug("그룹 멤버 가입 파라미터:{},응답:{}",params.toString(),rtnJson);

        return rtnJson;
    }

    @Override
    public String groupModify(Map<String, String> params) throws JsonProcessingException, ApiException {
        ObjectMapper mapper = new ObjectMapper();
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(params),"/ords/swing/saver/group","PUT", "application/json",true);

        LOGGER.debug("그룹 수정 파라미터:{},응답:{}",mapper.writeValueAsString(params),rtnJson);

        return rtnJson;
    }

    @Override
    public String getGroupMember(String groupId) throws ApiException {
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr("/ords/swing/saver/groupmembers/"+groupId,"GET", "application/x-www-form-urlencoded",true);

        LOGGER.debug("그룹 멤버 조회 파라미터:{},응답:{}",groupId.toString(),rtnJson);

        return rtnJson;
    }

    @Override
    public String getSubGroup(String groupId) throws ApiException {
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr("/ords/swing/saver/subgroups/"+groupId,"GET", "application/x-www-form-urlencoded",true);

        LOGGER.debug("서브 그룹 조회 파라미터:{},응답:{}",groupId.toString(),rtnJson);

        return rtnJson;
    }

    @Override
    public String getSubGroupMembers(String subgroupid) throws ApiException {
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr("/ords/swing/saver/subgroup/"+subgroupid,"GET", "application/x-www-form-urlencoded",true);

        LOGGER.debug("서브 그룹 상세 조회 파라미터:{},응답:{}",subgroupid.toString(),rtnJson);

        return rtnJson;
    }

    @Override
    public String subGroupInsert(Map<String, String> params) throws JsonProcessingException, ApiException {
        ObjectMapper mapper = new ObjectMapper();
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(params),"/ords/swing/saver/subgroup","POST", "application/json",true);

        LOGGER.debug("서브그룹 생성 파라미터:{},응답:{}",params.toString(),rtnJson);

        return rtnJson;
    }

    @Override
    public String subGroupUpdate(Map<String, String> params) throws JsonProcessingException, ApiException {
        ObjectMapper mapper = new ObjectMapper();
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(params),"/ords/swing/saver/subgroup","PUT", "application/json",true);

        LOGGER.debug("서브그룹 수정 파라미터:{},응답:{}",params.toString(),rtnJson);

        return rtnJson;
    }

    @Override
    public String subGroupDelete(Map<String, String> params) throws JsonProcessingException, ApiException {
        ObjectMapper mapper = new ObjectMapper();
        String rtnJson = "";
        if(params.get("subgroupid").indexOf(",") == -1) {
            rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(params), "/ords/swing/saver/subgroup", "DELETE", "application/json", true);
        }else{
            String[] subgrpList = params.get("subgroupid").split(",");
            Map<String,String> sendMap = new HashMap<String, String>();
            for (String str: subgrpList) {
                sendMap.clear();
                sendMap.put("subgroupid",str);
                rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(sendMap), "/ords/swing/saver/subgroup", "DELETE", "application/json", true);
            }

        }
        LOGGER.debug("서브그룹 삭제 파라미터:{},응답:{}",params.toString(),rtnJson);

        return rtnJson;
    }

    @Override
    public String subGroupUserDelete(Map<String, String> params) throws JsonProcessingException, ApiException {
        ObjectMapper mapper = new ObjectMapper();
        String rtnJson = "";

        if(params.get("userid").indexOf(",") == -1) {
            rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(params), "/ords/swing/saver/subgroupmember", "DELETE", "application/json", true);
        }else{
            String[] useridList = params.get("userid").split(",");
            Map<String,Object> sendMap = new HashMap<String, Object>();
            for (String str: useridList) {
                sendMap.clear();
                sendMap.put("subgroupid",params.get("subgroupid"));
                sendMap.put("userid",Long.parseLong(str));
                rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(sendMap), "/ords/swing/saver/subgroupmember", "DELETE", "application/json", true);
            }

        }
        LOGGER.debug("서브그룹 멤버 삭제 파라미터:{},응답:{}",params.toString(),rtnJson);

        return rtnJson;
    }

    @Override
    public String subGroupUserMove(Map<String, String> params) throws JsonProcessingException, ApiException {
        ObjectMapper mapper = new ObjectMapper();
        String rtnJson = "";

        if(params.get("userid").indexOf(",") == -1) {
            rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(params), "/ords/swing/saver/subgroupmember/move", "POST", "application/json", true);
        }else{
            String[] useridList = params.get("userid").split(",");
            Map<String,Object> sendMap = new HashMap<String, Object>();
            for (String str: useridList) {
                sendMap.clear();
                sendMap.put("sourceid",params.get("sourceid"));
                sendMap.put("targetid",params.get("targetid"));
                sendMap.put("userid",Long.parseLong(str));
                rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(sendMap), "/ords/swing/saver/subgroupmember/move", "POST", "application/json", true);
            }

        }
        LOGGER.debug("서브그룹 이동 파라미터:{},응답:{}",params.toString(),rtnJson);

        return rtnJson;
    }


    @Override
    public String groupUserDelete(Map<String, String> params) throws JsonProcessingException, ApiException {
        ObjectMapper mapper = new ObjectMapper();
        String rtnJson = "";

        if(params.get("userid").indexOf(",") == -1) {
            rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(params), "/ords/swing/saver/groupmember", "DELETE", "application/json", true);
        }else{
            String[] useridList = params.get("userid").split(",");
            Map<String,Object> sendMap = new HashMap<String, Object>();
            for (String str: useridList) {
                sendMap.clear();
                sendMap.put("groupid",params.get("groupid"));
                sendMap.put("userid",Long.parseLong(str));
                rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(sendMap), "/ords/swing/saver/groupmember", "DELETE", "application/json", true);
            }

        }
        LOGGER.debug("서브그룹 이동 파라미터:{},응답:{}",params.toString(),rtnJson);

        return rtnJson;

    }

    @Override
    public String passwordReset(Map<String, String> params) throws JsonProcessingException, ApiException {
        ObjectMapper mapper = new ObjectMapper();
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(params),"/ords/swing/saver/password/sendemail","POST", "application/json",true);

        LOGGER.debug("비밀번호 재설정 파라미터:{},응답:{}",params.toString(),rtnJson);

        return rtnJson;
    }

    @Override
    public String passwordProcess(Map<String, String> params) throws JsonProcessingException, ApiException {
        ObjectMapper mapper = new ObjectMapper();
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(params),"/ords/swing/saver/password","POST", "application/json",true);

        LOGGER.debug("비밀번호 재설정 완료 파라미터:{},응답:{}",params.toString(),rtnJson);

        return rtnJson;
    }
    
    public String imgProfileInsert(Map<String,String> params) throws JsonProcessingException, ApiException{
    	ObjectMapper mapper = new ObjectMapper();
        String rtnJson = "{\"result\":\"true\"}";
        String url = "/ords/swing/saver/photo";
        
        LOGGER.debug("profile재설정 재설정 완료 파라미터:{},응답:{}",params.toString(),rtnJson);
        if(uploadPath != null && uploadPath.lastIndexOf("/") == uploadPath.length() -1 && uploadPath.length() > 0) {
        	uploadPath = uploadPath.substring(0,uploadPath.length()-1);
		}
        String sendPath = uploadPath + params.get("photo");
        
        File file = new File(sendPath);
        
        byte[] bytes = new byte[(int) file.length()]; 
        try {
        	FileInputStream fis = new FileInputStream(file);
    		fis.read(bytes); //read file into bytes[]
    		fis.close();
    		Encoder encoder = Base64.getEncoder();
    		String data = new String(encoder.encode(bytes));
    		params.put("photo",data);
    		rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(params),url,"POST", "application/json",true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
        
        return rtnJson;
    }
    
    private String getFile (String path) {
    	
    	return null;
    }
    
    /**
     * 그룹 승인 취소 요청
     * */
    public String groupMemberAcceptCancel(Map<String,String> params)throws JsonProcessingException, ApiException{
    	String[] useridList = params.get("userid").split(",");
        String[] membertypeList = params.get("membertype").split(",");
        String groupid = params.get("groupid");
        String status = params.get("status");
        
    	ObjectMapper mapper = new ObjectMapper();
        String rtnJson = "";
        
        //https://www.swingsaver.co.kr/ords/swing/saver/groupmember
        if(params.get("userid").indexOf(",") == -1) {
        	Map<String,Object> sendMap = new HashMap<String, Object>();
        	sendMap.put("groupid",groupid);
            sendMap.put("status",status);
            sendMap.put("userid",Long.parseLong(params.get("userid")));
            sendMap.put("membertype", params.get("membertype"));
            
            rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(sendMap), "/ords/swing/saver/groupmember", "PUT", "application/json", true);
        }else{
            
             
            Map<String,Object> sendMap = new HashMap<String, Object>();
            int i = 0 ;
            for (String str: useridList) {
                sendMap.clear();
                
                sendMap.put("groupid",groupid);
                sendMap.put("status",status);
                sendMap.put("userid",Long.parseLong(str));
                sendMap.put("membertype", membertypeList[i]);
                
                rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(sendMap), "/ords/swing/saver/groupmember", "PUT", "application/json", true);
                i ++;
            }

        }
        LOGGER.debug("그룹 승인 취소 파라미터:{},응답:{}",params.toString(),rtnJson);

        return rtnJson;
    }

    /**
     * Admin Login Process
     */
	@Override
	public AdminVo adminLoginProcess(AdminVo loginVo, HttpSession session) throws ApiException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        String json = "";
        String rtnJson = "";

        try {

            LOGGER.debug("authUser 시작:{}",json);
            rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(loginVo),"/ords/swing/saver/admin","POST", "application/json",false);

            loginVo = mapper.readValue(rtnJson,AdminVo.class);
            LOGGER.debug("authUser 시작:{}",rtnJson);

        } catch (JsonProcessingException e) {
            throw new ApiException(e.getMessage());
        }
        return loginVo;
	}

	/**
	 * 그룹 리스트 정보를 가져온다.
	 */
	@Override
	public String getGroupList() throws ApiException {
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr("/ords/swing/saver/grouplist", "GET", "application/x-www-form-urlencoded",true);

        LOGGER.debug("그룹 리스트 조회 응답:{}",rtnJson);

        return rtnJson;
	}

	/***
	 * 그룹 관리자로 등록할 회원 리스트를 조회한다.
	 */
	@Override
	public String getGroupAdminList() throws ApiException {
		String rtnJson = "";
		rtnJson = sendMessage.sendHttpsStr("/ords/swing/saver/user", "GET", "application/x-www-form-urlencoded", true);
		LOGGER.debug("그룹 관리자 등록할 회원리스트 조회 : {}", rtnJson);
		
		return rtnJson;
	}

	/**
	 * 코드 정보를 조회한다. 
	 */
	@Override
	public String getCodeList(String groupType) throws ApiException {
		// TODO Auto-generated method stub
		String rtnJson = "";
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> sendMap = new HashMap<String, Object>();
		sendMap.put("codegroup",groupType);
		try {
			rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(sendMap), "/ords/swing/saver/codelist", "POST", "application/json", true);
			LOGGER.debug("코드 리스트 조회 : {}", rtnJson);
        } catch (JsonProcessingException e) {
            throw new ApiException(e.getMessage());
        }
		return rtnJson;
	} 
	/**
	 * 그룹 상세정보를 조회한다. 
	 */
    @Override
    public GroupVo getGroupInfo(long groupid) throws ApiException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        GroupVo groupVo = null;

        String rtnJson= "";
        String param = Long.toString(groupid);
        rtnJson = sendMessage.sendHttpsStr("/ords/swing/saver/groupinfo/"+param,"GET", "application/json",true);
        LOGGER.debug("그룹 정보 파라미터:{},응답:{}",param,rtnJson);
        groupVo = mapper.readValue(rtnJson,GroupVo.class);

        return groupVo;
    }
    
	/**
	 * 그룹 상세정보를 조회한다. 
	 */
    @Override
    public GroupVo getGroupInfo(String groupid) throws ApiException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        GroupVo groupVo = null;

        String rtnJson= "";
        String param = groupid;
        rtnJson = sendMessage.sendHttpsStr("/ords/swing/saver/groupinfo/"+param,"GET", "application/json",true);
        LOGGER.debug("그룹 정보 파라미터:{},응답:{}",param,rtnJson);
        groupVo = mapper.readValue(rtnJson,GroupVo.class);

        return groupVo;
    }    
	
    /**
     * 관리자모드에서 그룹정보 업데이트 처리 
     */
    @Override
    public String groupUpdate(Map<String, String> params) throws JsonProcessingException, ApiException {
        ObjectMapper mapper = new ObjectMapper();
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(params),"/ords/swing/saver/grouplist","PUT", "application/json",true);

        LOGGER.debug("그룹 수정 파라미터:{},응답:{}",mapper.writeValueAsString(params),rtnJson);

        return rtnJson;
    }

	/**
	 * 지역  리스트 정보를 가져온다.
	 */
	@Override
	public String getAreaList() throws ApiException {
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr("/ords/swing/saver/arealist", "GET", "application/x-www-form-urlencoded",true);

        LOGGER.debug("지역 리스트 조회 응답:{}",rtnJson);

        return rtnJson;
	}
	
	/**
	 * 지역  리스트 정보를 가져온다.
	 */
	@Override
	public String getAreaList(String country_id) throws ApiException {
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr("/ords/swing/saver/arealist/"+country_id, "GET", "application/json",true);

        LOGGER.debug("지역 리스트 조회 응답:{}",rtnJson);

        return rtnJson;
	}
	
	/**
	 * 지역 정보를 신규 등록한다
	 */
    @Override
    public String areaCreate(Map<String, String> params) throws JsonProcessingException, ApiException {
        ObjectMapper mapper = new ObjectMapper();
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(params),"/ords/swing/saver/area","POST", "application/json",true);

        LOGGER.debug("지역 정보 가입 파라미터:{},응답:{}",params.toString(),rtnJson);

        return rtnJson;
    } 
    
    /**
     * 관리자모드에서 선택된 지역정보를 삭제한다. 
     */
    @Override
    public String areaDelete(Map<String, String> params) throws JsonProcessingException, ApiException {
        ObjectMapper mapper = new ObjectMapper();
        String rtnJson = "";
        if(params.get("zone_id").indexOf(",") == -1) {
            rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(params), "/ords/swing/saver/area", "DELETE", "application/json", true);
        }else{
            String[] subgrpList = params.get("zone_id").split(",");
            String[] subctryList = params.get("country_id").split(",");
            Map<String,String> sendMap = new HashMap<String, String>();
            int i=0;
            for (String str: subgrpList) {
                sendMap.clear();
                sendMap.put("zone_id",str);
                sendMap.put("country_id", subctryList[i]);
                i++;
                rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(sendMap), "/ords/swing/saver/area", "DELETE", "application/json", true);
            }

        }
        LOGGER.debug("지역정보 삭제 파라미터:{},응답:{}",params.toString(),rtnJson);

        return rtnJson;
    }  
	/**
	 * 지역정보 상세정보를 조회한다. 
	 */
    @Override
    public AreaVo getAreaInfo(String country_id, String zone_id) throws ApiException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        AreaVo areaVo = null;

        String rtnJson= "";

        rtnJson = sendMessage.sendHttpsStr("/ords/swing/saver/areainfo/"+country_id+"/"+zone_id,"GET", "application/json",true);
        LOGGER.debug("지역정보 파라미터:{},응답:{}",zone_id,rtnJson);
        areaVo = mapper.readValue(rtnJson,AreaVo.class);

        return areaVo;
    }
    
	
    /**
     * 관리자모드에서 지역정보 업데이트 처리 
     */
    @Override
    public String areaUpdate(Map<String, String> params) throws JsonProcessingException, ApiException {
        ObjectMapper mapper = new ObjectMapper();
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(params),"/ords/swing/saver/arealist","PUT", "application/json",true);

        LOGGER.debug("지역정보 수정 파라미터:{},응답:{}",mapper.writeValueAsString(params),rtnJson);

        return rtnJson;
    }  

	/**
	 * 골프장정보  리스트 정보를 가져온다.
	 */
	@Override
	public String getGolfList() throws ApiException {
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr("/ords/swing/saver/golflist", "GET", "application/x-www-form-urlencoded",true);

        LOGGER.debug("골프장정보 리스트 조회 응답:{}",rtnJson);

        return rtnJson;
	}
	
	/**
	 * 골프장정보  리스트 정보를 가져온다.
	 */
	@Override
	public String getGolfList(String country_id, String zone_id) throws ApiException {
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr("/ords/swing/saver/golfinfo/"+country_id+"/"+zone_id, "GET", "application/json",true);

        LOGGER.debug("골프장정보 리스트 조회 응답:{}",rtnJson);

        return rtnJson;
	}	
	
	/**
	 * 골프장정보를 신규 등록한다
	 */
    @Override
    public String golfCreate(Map<String, String> params) throws JsonProcessingException, ApiException {
        ObjectMapper mapper = new ObjectMapper();
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(params),"/ords/swing/saver/golf","POST", "application/json",true);

        LOGGER.debug("골프장정보 가입 파라미터:{},응답:{}",params.toString(),rtnJson);

        return rtnJson;
    } 	
    
    /**
     * 관리자모드에서 선택된 골프장정보를 삭제한다. 
     */
    @Override
    public String golfDelete(Map<String, String> params) throws JsonProcessingException, ApiException {
        ObjectMapper mapper = new ObjectMapper();
        String rtnJson = "";
        if(params.get("zone_id").indexOf(",") == -1) {
            rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(params), "/ords/swing/saver/golf", "DELETE", "application/json", true);
        }else{
            String[] subgrpList = params.get("zone_id").split(",");
            String[] subctryList = params.get("country_id").split(",");
            String[] subclubList = params.get("countryclub_id").split(",");
            Map<String,String> sendMap = new HashMap<String, String>();
            int i=0;
            for (String str: subgrpList) {
                sendMap.clear();
                sendMap.put("zone_id",str);
                sendMap.put("country_id", subctryList[i]);
                sendMap.put("countryclub_id", subclubList[i]);
                i++;
                rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(sendMap), "/ords/swing/saver/golf", "DELETE", "application/json", true);
            }

        }
        LOGGER.debug("골프장정보 삭제 파라미터:{},응답:{}",params.toString(),rtnJson);

        return rtnJson;
    }   
    
	/**
	 * 골프장정보 상세정보를 조회한다. 
	 */
    @Override
    public GolfVo getGolfInfo(String country_id, String zone_id, String countryclub_id) throws ApiException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        GolfVo golfVo = null;

        String rtnJson= "";

        rtnJson = sendMessage.sendHttpsStr("/ords/swing/saver/golfinfo/"+country_id+"/"+zone_id+"/"+countryclub_id,"GET", "application/json",true);
        LOGGER.debug("골프장정보 파라미터:{},응답:{}",zone_id,rtnJson);
        golfVo = mapper.readValue(rtnJson,GolfVo.class);

        return golfVo;
    }  
    
	/**
	 * 골프장정보 상세정보를 조회한다. 
	 * 이미지 포함해서 조회한다.
	 */
    @Override
    public String getGolfDetail(String country_id, String zone_id, String countryclub_id) throws ApiException, IOException {
        String rtnJson = sendMessage.sendHttpsStr("/ords/swing/saver/golfinfo/"+country_id+"/"+zone_id+"/"+countryclub_id,"GET", "application/json",true);
        LOGGER.debug("골프장정보 파라미터:{},응답:{}",zone_id,rtnJson);

        return rtnJson;
    } 
    public String getGolfImgIncludeDetail(String country_id, String zone_id, String countryclub_id) throws ApiException, IOException
    {
        ObjectMapper mapper = new ObjectMapper();
        GolfVo golfVo = null;

        String rtnJson= "";

        rtnJson = sendMessage.sendHttpsStr("/ords/swing/saver/golfinfo/"+country_id+"/"+zone_id+"/"+countryclub_id,"POST", "application/json",true);
        LOGGER.debug("골프장정보 파라미터:{},응답:{}",zone_id,rtnJson);


        return rtnJson;
    }
    
    /**
     * 관리자모드에서 골프장정보 업데이트 처리 
     */
    @Override
    public String golfUpdate(Map<String, String> params) throws JsonProcessingException, ApiException {
        ObjectMapper mapper = new ObjectMapper();
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(params),"/ords/swing/saver/golflist","PUT", "application/json",true);

        LOGGER.debug("골프장정보 수정 파라미터:{},응답:{}",mapper.writeValueAsString(params),rtnJson);

        return rtnJson;
    }  
    
	/**
	 * Par  리스트 정보를 가져온다.
	 */
	@Override
	public String getParList(String countryclub_id) throws ApiException {
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr("/ords/swing/saver/parlist/"+countryclub_id, "GET", "application/json",true);

        LOGGER.debug("Par 리스트 조회 응답:{}",rtnJson);

        return rtnJson;
	}   
	
	/**
	 * Par  리스트 정보를 가져온다.
	 */
	@Override
	public String getParList(String country_id, String zone_id, String countryclub_id) throws ApiException {
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr("/ords/swing/saver/parlist/"+country_id+"/"+zone_id+"/"+countryclub_id, "GET", "application/json",true);

        LOGGER.debug("Par 리스트 조회 응답:{}",rtnJson);

        return rtnJson;
	} 	
	
	/**
	 * 골프장 Par 정보를 신규 등록한다
	 */
    @Override
    public String parCreate(Map<String, String> params) throws JsonProcessingException, ApiException {
        ObjectMapper mapper = new ObjectMapper();
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(params),"/ords/swing/saver/par","POST", "application/json",true);

        LOGGER.debug("골프장 Par 정보 가입 파라미터:{},응답:{}",params.toString(),rtnJson);

        return rtnJson;
    } 	
    
	/**
	 * 골프장 Par 정보 상세정보를 조회한다. 
	 */
    @Override
    public FarVo getParInfo(String country_id, String zone_id, String countryclub_id, String course) throws ApiException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        FarVo farVo = null;

        String rtnJson= "";

        rtnJson = sendMessage.sendHttpsStr("/ords/swing/saver/parinfo/"+country_id+"/"+zone_id+"/"+countryclub_id+"/"+course,"GET", "application/json",true);
        LOGGER.debug("골프장 Par 정보 파라미터:{},응답:{}",course,rtnJson);
        farVo = mapper.readValue(rtnJson,FarVo.class);

        return farVo;
    }  
    
	/**
	 * 골프장 Par 정보 상세정보를 조회한다. 
	 */
    @Override
    public String getParDetail(String country_id, String zone_id, String countryclub_id, String course) throws ApiException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        String rtnJson= "";

        rtnJson = sendMessage.sendHttpsStr("/ords/swing/saver/parinfo/"+country_id+"/"+zone_id+"/"+countryclub_id+"/"+course,"GET", "application/json",true);
        LOGGER.debug("골프장 Par 정보 파라미터:{},응답:{}",course,rtnJson);
        return rtnJson;
    }   
    
    
    
    /**
     * 관리자모드에서 선택된 골프장 Par정보를 삭제한다. 
     */
    @Override
    public String parDelete(Map<String, String> params) throws JsonProcessingException, ApiException {
        ObjectMapper mapper = new ObjectMapper();
        String rtnJson = "";
        if(params.get("zone_id").indexOf(",") == -1) {
            rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(params), "/ords/swing/saver/par", "DELETE", "application/json", true);
        }else{
            String[] subgrpList = params.get("zone_id").split(",");
            String[] subctryList = params.get("country_id").split(",");
            String[] subclubList = params.get("countryclub_id").split(",");
            String[] subcourseList = params.get("course").split(",");
            Map<String,String> sendMap = new HashMap<String, String>();
            int i=0;
            for (String str: subgrpList) {
                sendMap.clear();
                sendMap.put("zone_id",str);
                sendMap.put("country_id", subctryList[i]);
                sendMap.put("countryclub_id", subclubList[i]);
                sendMap.put("course", subcourseList[i]);
                i++;
                rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(sendMap), "/ords/swing/saver/par", "DELETE", "application/json", true);
            }

        }
        LOGGER.debug("골프장정보 삭제 파라미터:{},응답:{}",params.toString(),rtnJson);

        return rtnJson;
    }  
    
    /**
     * 관리자모드에서 골프장 Far 정보 업데이트 처리 
     */
    @Override
    public String parUpdate(Map<String, String> params) throws JsonProcessingException, ApiException {
        ObjectMapper mapper = new ObjectMapper();
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(params),"/ords/swing/saver/par","PUT", "application/json",true);

        LOGGER.debug("골프장 Far 정보 수정 파라미터:{},응답:{}",mapper.writeValueAsString(params),rtnJson);

        return rtnJson;
    } 
    /**
     * 스코어정보 개인별 신규 등록
     */
    @Override
    public String scoreCreate(Map<String, String> params) throws JsonProcessingException, ApiException {	     
        ObjectMapper mapper = new ObjectMapper();
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(params),"/ords/swing/saver/score","POST", "application/json",true);

        LOGGER.debug("스코어정보 개인별 신규 등록 가입 파라미터:{},응답:{}",params.toString(),rtnJson);

        return rtnJson;
    }
    /**
     * 스코어정보 개인별 상세 신규 등록
     */
    @Override
    public String scoreDetailCreate(Map<String, String> params) throws JsonProcessingException, ApiException {	 
        ObjectMapper mapper = new ObjectMapper();
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(params),"/ords/swing/saver/scoredetail","POST", "application/json",true);

        LOGGER.debug("스코어정보 개인별 상세 신규 가입 파라미터:{},응답:{}",params.toString(),rtnJson);

        return rtnJson;
    }
    /**
     *  스코어정보 리스트 조회
     */
    @Override
    public String scoreList(String user_id, String stdate, String etdate, String country_id, String zone_id, String countryclub_id) throws ApiException, IOException		
    {
        ObjectMapper mapper = new ObjectMapper();
        String rtnJson = "";
        Map<String,String> sendMap = new HashMap<String, String>();
        sendMap.put("user_id",        user_id);
        sendMap.put("stdate", 	  	  stdate);		    // 시작날짜 
        sendMap.put("etdate",     	  etdate);		    // 종료날짜
        sendMap.put("country_id", 	  country_id);	    // 국가코드
        sendMap.put("zone_id",		  zone_id);		    // 지역코드
        sendMap.put("countryclub_id", countryclub_id);	// 골프장 코드
        
        rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(sendMap), "/ords/swing/saver/scorelist", "POST", "application/json",true);
        
        return rtnJson;
    }
    /**
     * 스코어정보 상세보기
     */
    @Override
    public ScoreMaster getScoreInfo(String visit_date, String countryclub_id, String seq_no, String user_id) throws ApiException, IOException		
    {
        ObjectMapper mapper = new ObjectMapper();
        ScoreMaster scoreVo = null;
        Map<String,String> sendMap = new HashMap<String, String>();
        sendMap.put("visit_date",     visit_date);
        sendMap.put("seq_no", 	  	  seq_no);		     
        sendMap.put("user_id",     	  user_id);		     
        sendMap.put("countryclub_id", countryclub_id);	 
        String rtnJson= "";

        rtnJson = sendMessage.sendHttpsStr( "/ords/swing/saver/scoredetail/"+visit_date+"/"+countryclub_id+"/"+seq_no+"/"+user_id, "GET", "application/json",true);
        LOGGER.debug("스코어정보 정보 파라미터:{},응답:{}",sendMap.toString(),rtnJson);
        scoreVo = mapper.readValue(rtnJson, ScoreMaster.class);

        return scoreVo;
    }
    /**
     * 개인별 스코어 정보 삭제
     */
    @Override
    public String scoreDelete(Map<String, String> params) throws JsonProcessingException, ApiException
    {
        ObjectMapper mapper = new ObjectMapper();
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(params), "/ords/swing/saver/score", "DELETE", "application/json", true);

        LOGGER.debug("개인별 스코어 삭제 파라미터:{},응답:{}",params.toString(),rtnJson);

        return rtnJson;
    }
    /**
     * 개인별 스코어 정보 수정 
     */
    @Override
    public String scoreUpdate(Map<String, String> params) throws JsonProcessingException, ApiException
    {
        ObjectMapper mapper = new ObjectMapper();
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(params),"/ords/swing/saver/score","PUT", "application/json",true);

        LOGGER.debug("스코어정보 개인별 수정 가입 파라미터:{},응답:{}",params.toString(),rtnJson);

        return rtnJson;
    }
    /**
     * 개인별 스코어 상세 정보 수정
     */
    @Override
    public String scoreDetailUpdate(Map<String, String> params) throws JsonProcessingException, ApiException
    {
        ObjectMapper mapper = new ObjectMapper();
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(params),"/ords/swing/saver/scoredetail","PUT", "application/json",true);

        LOGGER.debug("스코어정보 개인별 상세 수정 파라미터:{},응답:{}",params.toString(),rtnJson);

        return rtnJson;
    }
    /**
     * 마켓 프로 리스트 조회
     */
    @Override
    public String proList() throws JsonProcessingException, ApiException
    {
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr("/ords/swing/saver/market","GET", "application/json",true);

        LOGGER.debug("마켓 프로 조회 파라미터:응답:{}",rtnJson);

        return rtnJson;
    }
    
    /**
     * 마켓 프로 리스트 조회
     */
    @Override
    public String proList(String level) throws JsonProcessingException, ApiException
    {
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr("/ords/swing/saver/market/"+level,"GET", "application/json",true);

        LOGGER.debug("마켓 프로 조회 파라미터:응답:{}",rtnJson);

        return rtnJson;
    }
    /**
     * 마켓 프로 등록 가능 사용자 조회
     */
    @Override
    public String proUserList() throws JsonProcessingException, ApiException
    {
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr("/ords/swing/saver/prounlist","GET", "application/json",true);

        LOGGER.debug("마켓 프로 등록 가능 사용자 조회 파라미터:응답:{}",rtnJson);

        return rtnJson;
    }
    
    /**
     * 마켓 프로 등록 가능 사용자 조회
     */
    @Override
    public String proUserList(String id) throws JsonProcessingException, ApiException
    {
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr("/ords/swing/saver/prounlist/"+id,"GET", "application/json",true);

        LOGGER.debug("마켓 프로 등록 가능 사용자 조회 파라미터:응답:{}",rtnJson);

        return rtnJson;
    }
    
    /**
     * 마켓 프로 등록
     */
    @Override
    public String marketProCreate(Map<String, String> params) throws JsonProcessingException, ApiException
    {
        ObjectMapper mapper = new ObjectMapper();
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(params),"/ords/swing/saver/market","POST", "application/json",true);

        LOGGER.debug("마켓 프로 등록 가입 파라미터:{},응답:{}",params.toString(),rtnJson);

        return rtnJson;
    }
    /**
     * 마켓 프로 수정
     */
    public String proUpdate(Map<String, String> params) throws JsonProcessingException, ApiException
    {
        ObjectMapper mapper = new ObjectMapper();
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(params),"/ords/swing/saver/market","PUT", "application/json",true);

        LOGGER.debug("마켓 프로 수정 가입 파라미터:{},응답:{}",params.toString(),rtnJson);

        return rtnJson;
    }
    /**
     * 마켓 프로 상세 정보 조회
     */
    @Override
    public ProVo getProDetail(String id) throws ApiException, IOException		
    {
        ObjectMapper mapper = new ObjectMapper();
        ProVo proVo = null;

        String rtnJson= "";

        rtnJson = sendMessage.sendHttpsStr( "/ords/swing/saver/market/pro/"+id, "GET", "application/json",true);
        LOGGER.debug("마켓 프로 상세 정보 파라미터:{},응답:{}",id,rtnJson);
        proVo = mapper.readValue(rtnJson, ProVo.class);

        return proVo;
    }  
    /**
     * 마켓 프로 삭제
     */
    @Override
    public String proDelete(Map<String, String> params) throws JsonProcessingException, ApiException
    {
        ObjectMapper mapper = new ObjectMapper();
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(params), "/ords/swing/saver/market", "DELETE", "application/json", true);

        LOGGER.debug("마켓 프로 삭제 파라미터:{},응답:{}",params.toString(),rtnJson);

        return rtnJson;
    }
}
