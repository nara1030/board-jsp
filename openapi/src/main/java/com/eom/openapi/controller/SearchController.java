package com.eom.openapi.controller;

import com.eom.openapi.service.SearchService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/ko-KR")
public class SearchController {
    private static final Logger logger = LoggerFactory.getLogger(SearchController.class);
    private final SearchService searchService;

    private SearchController(SearchService searchService) {
        this.searchService = searchService;
    }

    // 왓챠 참고
    /*
     * case1: ko-KR/search
     * case2: ko-KR/search?query=joker
     */
    @GetMapping("search")
    public String searchData(@RequestParam(required = false) String query, Model model) {
        logger.debug("입력 쿼리: {}" + query);
        // TODO: Optional 적용
        /*
         * 1. requried = false: o, @Nullable: x
         * 2. .equals()가 우선이면 검색창으로 ""이 넘어올 때는 맞으나 Null일 땐 NPE 발생
         */
        if (query == null || query.equals("")) {
            query = "happy";
        }

        // TODO: 추후 RESTful 개발
        model.addAttribute("items", searchService.searchMovieAndBook(query));
        return "search";
    }
}
