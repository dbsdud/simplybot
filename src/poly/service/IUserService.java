package poly.service;

import poly.dto.UserDTO;

public interface IUserService {
	// 카카오 유저
	public UserDTO getKakaoUser(UserDTO uDTO) throws Exception;
	// 카카오 정보 DB 저장
	public int insertKakaoUser(UserDTO uDTO) throws Exception;
	// 카카오 유저 	regNo 저장
	public int updateKakaoUserRegNo(UserDTO uDTO2) throws Exception;
	// 카카오 유저 이미지 업데이트
	public int updateKakaoUserImage(UserDTO uDTO2) throws Exception;
	// 구글 유저
	public UserDTO getGoogleUser(UserDTO uDTO) throws Exception;
	// 구글 정보 DB 저장
	public int insertGoogleUser(UserDTO uDTO) throws Exception;
	// 구글 유저 regNo 저장
	public int updateGoogleUserRegNo(UserDTO uDTO2) throws Exception;
}
