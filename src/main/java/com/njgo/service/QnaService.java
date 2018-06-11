package com.njgo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njgo.dao.QnaDAO;
import com.njgo.dto.QnaDTO;
import com.njgo.util.ListInfo;


@Service
public class QnaService{

	@Autowired
	private QnaDAO qnaDAO;
	
	
	public List<QnaDTO> qnaList(ListInfo listInfo) {
		int count = qnaDAO.qnaCount(listInfo);
		listInfo.makePage(count, 10);
		return qnaDAO.qnaList(listInfo);
	}

	public QnaDTO qnaView(int num) {
		return qnaDAO.qnaView(num);
	}
	public QnaDTO qnaBefore(int num) {
		return qnaDAO.qnaBefore(num);
	}
	public QnaDTO qnaAfter(int num) {
		return qnaDAO.qnaAfter(num);
	}

	public int qnaWrite(QnaDTO qnaDTO) {
		return qnaDAO.qnaWrite(qnaDTO);
	}

	public int qnaUpdate(QnaDTO qnaDTO) {
		return qnaDAO.qnaUpdate(qnaDTO);
	}
	public int qnaReply(QnaDTO qnaDTO) {
		qnaDAO.qnaUpdatestep(qnaDTO);
		return qnaDAO.qnaReply(qnaDTO);
	}

	public int qnaDelete(int num) {
		return qnaDAO.qnaDelete(num);
	}
	
	/*소연 수정*/
	public int qnaHitUpdate(int num) {
		return qnaDAO.qnaHitUpdate(num);
	}

}
