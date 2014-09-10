package com.nhnent.base.guestbook;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class GuestbookService {
	
	@Autowired
	private GuestbookMapper guestbookMapper;
	
    List<GuestbookVO> getAll(){
    	return this.guestbookMapper.getAll();
    }
    GuestbookVO get(int id){
    	return this.guestbookMapper.get(id);
    }
    void add(GuestbookVO guestbookVO){
    	this.guestbookMapper.add(guestbookVO);
    }
    void update(GuestbookVO guestbookVO){
    	this.guestbookMapper.update(guestbookVO);
    }
    void delete(int id){
    	this.guestbookMapper.delete(id);
    }
}
