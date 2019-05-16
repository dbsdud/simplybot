package poly.service;

import poly.dto.ChatDTO;

public interface IChatService {
	// Anxiety 채팅기록 DB 저장
	public int insertAnxietyChat(ChatDTO cDTO) throws Exception;
}
