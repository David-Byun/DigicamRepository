package com.kbstar.controller;

import com.kbstar.service.MarkerService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;

@Controller
@RequiredArgsConstructor
public class MarkerDescController {

    private final MarkerService service;



}
