package com.kbstar.service;

import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface KBService<K, V> {
    /**
     * 등록 및 가입 진행
     * argument : Object
     * return : null
     */

    //데이터 조작할때 @Transactional 사용하면 일부 실패시 롤백
    @Transactional
    public void register(V v) throws Exception;

    @Transactional
    public void remove(K k) throws Exception;

    @Transactional(readOnly = true) //데이터 조작하진 않지만 불러올 때 에러 방지
    public V get(K k) throws Exception;

    @Transactional(readOnly = true) //데이터 조작하진 않지만 불러올 때 에러 방지
    public List<V> get() throws Exception;

    @Transactional
    public void modify(V v) throws Exception;
}
