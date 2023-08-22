package org.sp.mybatisApp.repository;

import java.util.List;

import org.sp.mybatisApp.domain.Board;

//Board 테이블에 대한 모든 DAO의 최상위 객체
public interface BoardDAO {
	public List selectAll(); //모든 메서드가져오기
	public Board select(int board_idx); //한 건 가져오기
	public int insert(Board board); //한 건 넣기
	public int update(Board board); //한 건 수정
	public int delete(int board_idx); //한 건 삭제
		
}
