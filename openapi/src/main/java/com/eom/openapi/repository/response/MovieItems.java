package com.eom.openapi.repository.response;

import lombok.Getter;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Getter
public class MovieItems {
    private Date lastBuildDate;     // 검색 결과 생성 시간
    private List<MovieItem> items;   // 개별 검색 결과

    public MovieItems() {
        items = new ArrayList<>(10);
    }

    @Override
    public String toString() {
        return "MovieItems{" +
                "lastBuildDate=" + lastBuildDate +
                ", items=" + items +
                '}';
    }
}
