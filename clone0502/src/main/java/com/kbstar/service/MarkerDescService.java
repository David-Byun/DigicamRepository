package com.kbstar.service;

import com.kbstar.dto.MarkerDesc;
import com.kbstar.mapper.MarkerDescMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MarkerDescService implements KBService<Integer, MarkerDesc>{

    private final MarkerDescMapper mapper;


    /**
     * 등록 및 가입 진행
     * argument : Object
     * return : null
     *
     * @param markerDesc
     */
    @Override
    public void register(MarkerDesc markerDesc) throws Exception {
        mapper.insert(markerDesc);
    }

    @Override
    public void remove(Integer integer) throws Exception {
        mapper.delete(integer);
    }


    @Override
    public MarkerDesc get(Integer s) throws Exception {
        return mapper.select(s);
    }

    @Override
    public List<MarkerDesc> get() throws Exception {
        return mapper.selectall();
    }

    @Override
    public void modify(MarkerDesc markerDesc) throws Exception {
        mapper.update(markerDesc);
    }

    public List<MarkerDesc> getMarkerDesc(int id) throws Exception {
        return mapper.getMarkerDesc(id);
    }
}
