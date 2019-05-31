package poly.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.AdminDTO;
import poly.dto.ChatDTO;
import poly.dto.UserDTO;
import poly.persistance.mapper.AdminMapper;
import poly.service.IAdminService;

@Service("AdminService")
public class AdminService implements IAdminService {
	@Resource(name="AdminMapper")
	private AdminMapper adminMapper;
	
	// 관리자 로그인
	@Override
	public AdminDTO getAdmin(AdminDTO aDTO) throws Exception {
		return adminMapper.getAdmin(aDTO);
	}
	
	@Override
	public List<ChatDTO> getChatListCount() throws Exception {
		return adminMapper.getChatListCount();
	}
	
	@Override
	public List<UserDTO> getUserListCount() throws Exception {
		return adminMapper.getUserListCount();
	}
	
	@Override
	public int getUserListTotalCount() throws Exception {
		return adminMapper.getUserListTotalCount();
	}

	@Override
	public List<UserDTO> getUserList(HashMap<String, Integer> hMap) throws Exception {
		return adminMapper.getUserList(hMap);
	}

	@Override
	public int getUserListSearchTotalCount(HashMap<String, Object> hMap) throws Exception {
		return adminMapper.getUserListSearchTotalCount(hMap);
	}

	@Override
	public List<UserDTO> getUserSearchList(HashMap<String, Object> hMap) throws Exception {
		return adminMapper.getUserSearchList(hMap);
	}

	@Override
	public int getChatListTotalCount() throws Exception {
		return adminMapper.getChatListTotalCount();
	}

	@Override
	public List<ChatDTO> getChatList(HashMap<String, Integer> hMap) throws Exception {
		return adminMapper.getChatList(hMap);
	}

	@Override
	public int getChatListSearchTotalCount(HashMap<String, Object> hMap) throws Exception {
		return adminMapper.getChatListSearchTotalCount(hMap);
	}

	@Override
	public List<ChatDTO> getChatSearchList(HashMap<String, Object> hMap) throws Exception {
		return adminMapper.getChatSearchList(hMap);
	}

}
