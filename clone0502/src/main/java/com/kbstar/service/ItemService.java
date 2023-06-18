package com.kbstar.service;

import com.kbstar.dto.Item;
import com.kbstar.mapper.ItemMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j  //log
@Service
public class ItemService implements KBService<String, Item> {

    @Autowired
    ItemMapper mapper;


    @Override
    public void register(Item item) throws Exception {
        mapper.insert(item);
        log.info("Send Mail..."+item.getId());
    }

    @Override
    public void remove(String s) throws Exception {
        mapper.delete(s);
    }

    @Override
    public void modify(Item item) throws Exception {
        mapper.update(item);
    }

    @Override
    public Item get(String s) throws Exception {
        return mapper.select(s);
    }

    @Override
    public List<Item> get() throws Exception {
        return mapper.selectall();
    }
}