package poly.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.ChatDTO;
import poly.persistance.mapper.ChatMapper;
import poly.service.IChatService;

@Service("ChatService")
public class ChatService implements IChatService {
	@Resource(name="ChatMapper")
	private ChatMapper chatMapper;
	// Anxiety 채팅기록 DB 저장
	@Override
	public int insertAnxietyChat(ChatDTO cDTO) throws Exception {
		return chatMapper.insertAnxietyChat(cDTO);
	}
}
