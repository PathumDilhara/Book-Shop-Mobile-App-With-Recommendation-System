package org.appvibessolution.backend.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RetrieveBookDTO {
    private String title;
    private String author;
    private String firstPublishYear;
    private String coverImageUrl;
//    private String category;
//    private String description;
//    private String language;
//    private double price;
//    private long isbn;
}
