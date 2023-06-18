package com.kbstar.mapper;

import com.kbstar.dto.MarkerDesc;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface MarkerDescMapper extends KBMapper<Integer, MarkerDesc> {
    public List<MarkerDesc> getMarkerDesc(int id) throws Exception;
}
