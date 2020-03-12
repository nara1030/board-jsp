package com.eom.openapi.repository.response;

import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Getter
public class BookItems {
    private Date lastBuildDate;
    private List<BookItem> items;

    public BookItems() {
        items = new ArrayList<BookItem>(10);
    }

    @Override
    public String toString() {
        return "BookItems{" +
                "lastBuildDate=" + lastBuildDate +
                ", items=" + items +
                '}';
    }

    @Getter
    public static class BookItem {
        private String title;   // 문서 제목(검색 결과 일치 태그 표시)
        private String author;  // 저자
        private String image;   // 이미지 URL
        private Integer price;  // 정가 정보

        @Override
        public String toString() {
            return "BookItem{" +
                    "title='" + title + '\'' +
                    ", author='" + author + '\'' +
                    ", image='" + image + '\'' +
                    ", price=" + price +
                    '}';
        }
    }
}
