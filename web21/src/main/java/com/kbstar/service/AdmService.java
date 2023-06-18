package com.kbstar.service;

import com.kbstar.dto.Adm;
import com.kbstar.mapper.AdmMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

//interface에 적어 넣으면, impl 할때 자동으로 불러옴
@Service
public class AdmService implements KBService<String, Adm>{

    @Autowired
    AdmMapper mapper;

    /**
     * 등록 및 가입 진행
     * argument : Object
     * return : null
     *
     * @param adm
     */
    @Override
    public void register(Adm adm) throws Exception {
        mapper.insert(adm);
    }

    @Override
    public void remove(String s) throws Exception {
        mapper.delete(s);
    }

    @Override
    public Adm get(String s) throws Exception {
        return mapper.select(s);
    }

    @Override
    public List<Adm> get() throws Exception {
        return mapper.selectall();
    }

    @Override
    public void modify(Adm adm) throws Exception {
        mapper.update(adm);
    }
}
