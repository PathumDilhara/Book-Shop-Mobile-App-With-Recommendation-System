package org.appvibessolution.backend.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "books")
public class Book {
    @Id
    private Long id;
    private String title;
    private String author;
    private String firstPublishYear;

    @Column(columnDefinition = "TEXT")
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

    @ElementCollection
    @CollectionTable(name = "book_tags", joinColumns = @JoinColumn(name = "book_id"))
    @Column(name = "tag")
    private List<String> tags;

    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    @PrePersist 
    protected void onCreate(){
        this.createdAt = LocalDateTime.now();
        this.updatedAt = LocalDateTime.now();
    }

    @PreUpdate 
    protected void onUpdate(){
        this.updatedAt = LocalDateTime.now();
    }

}
