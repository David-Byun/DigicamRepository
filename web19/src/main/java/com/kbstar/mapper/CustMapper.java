package com.kbstar.mapper;

import com.github.pagehelper.Page;
import com.kbstar.dto.Cust;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import com.kbstar.frame.KBMapper;
@Mapper
@Repository
public interface CustMapper extends KBMapper<String, Cust> {

    Page<Cust> getpage() throws Exception;
}
