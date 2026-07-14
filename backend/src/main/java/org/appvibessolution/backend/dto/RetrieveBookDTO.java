package org.appvibessolution.backend.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RetrieveBookDTO {
    private Long id;
    private String title;
    private String author;
    private String genre;
    private double price;
    private String currency;
    private String coverUrl;
    private LocalDateTime updatedAt;
}
