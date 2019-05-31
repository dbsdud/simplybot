package poly.persistance.mapper;


import java.util.HashMap;
import java.util.List;

import config.Mapper;
import poly.dto.AdminDTO;
import poly.dto.ChatDTO;
import poly.dto.UserDTO;

@Mapper("AdminMapper")
public interface AdminMapper {
	public AdminDTO getAdmin(AdminDTO aDTO) throws Exception;
	public List<ChatDTO> getChatListCount() throws Exception;
	public List<UserDTO> getUserListCount() throws Exception;
	
	public int getUserListTotalCount() throws Exception;
	public List<UserDTO> getUserList(HashMap<String, Integer> hMap) throws Exception;
	public int getUserListSearchTotalCount(HashMap<String, Object> hMap) throws Exception;
	public List<UserDTO> getUserSearchList(HashMap<String, Object> hMap) throws Exception;
	
	public int getChatListTotalCount() throws Exception;
	public List<ChatDTO> getChatList(HashMap<String, Integer> hMap) throws Exception;
	public int getChatListSearchTotalCount(HashMap<String, Object> hMap) throws Exception;
	public List<ChatDTO> getChatSearchList(HashMap<String, Object> hMap) throws Exception;
}
