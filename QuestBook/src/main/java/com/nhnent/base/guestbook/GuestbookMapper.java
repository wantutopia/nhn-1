package com.nhnent.base.guestbook;

import java.util.List;

import org.springframework.stereotype.Repository;

public interface GuestbookMapper {
    List<GuestbookVO> getAll();
    GuestbookVO get(int id);
    void add(GuestbookVO guestbookVO);
    void update(GuestbookVO guestbookVO);
    void delete(int id);
}
