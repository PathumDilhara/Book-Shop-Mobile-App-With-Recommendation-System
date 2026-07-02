package org.appvibessolution.backend.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SingleBookDATO {
    private Long id;
    private String title;
    private String author;
    private String firstPublishYear;
    private String description;
    private String genre;
    private String subGenre;
    private String publisher;
    private String language;
    private String pages;
    private double price;
    private String currency;
    private String isbn;
    private double rating;
    private int ratingCount;
    private int stock;
    private String format;
    private String coverUrl;
    private List<String> tags;

    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
