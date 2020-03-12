package com.eom.openapi.controller;

import com.eom.openapi.repository.response.BookItems;
import com.eom.openapi.service.SearchService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

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
    public String searchData(@RequestParam String query, Model model) {
        logger.debug("입력 쿼리: {}" + query);

        // TODO: 추후 RESTful 개발
        model.addAttribute("items", searchService.searchMovieAndBook(query));
        return "search";
    }

    @GetMapping("test")
    public ResponseEntity<BookItems> test(@RequestParam String query) {
        logger.info("로그1");
        logger.debug("로그2");
        logger.trace("로그3");
        logger.error("로그4");

        logger.debug("전달받은 쿼리 : {}", query);
        return new ResponseEntity<BookItems>(searchService.test(query), HttpStatus.OK);
//        return searchService.searchBook(query);
    }
}
