package poly.persistance.mapper;

import config.Mapper;
import poly.dto.ChatDTO;

@Mapper("ChatMapper")
public interface ChatMapper {
	// 채팅기록 DB 저장
	public int insertAnxietyChat(ChatDTO cDTO) throws Exception;
}
