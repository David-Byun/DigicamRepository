package com.kbstar.mapper;

import com.kbstar.dto.Cart;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface CartMapper extends KBMapper<String, Cart> {
    //서비스 이름과 매퍼의 이름을 같이 가져가도 상관 없음
    List<Cart> getmycart(String id);
}
