package org.appvibessolution.backend.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.UuidGenerator;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "books")
public class Book {
    @Id
    @GeneratedValue()
    @UuidGenerator
    @Column(updatable = false, nullable = false, length = 36, unique = true)
    private String id;
    private String title;
    private String author;
    private String firstPublishYear;
    private String coverImageUrl;
    // private String category;
    // private String description;
//    private String language;
//    private double price;
//    private long isbn;
}
