package com.eom.openapi.util.searchConfig;

public enum Category {
    BOOK("/v1/search/book.json"),
    MOVIE("/v1/search/movie.json");

    private String category;

    private Category(String category) {
        this.category = category;
    }

    public String getCategory() {
        return category;
    }
}
