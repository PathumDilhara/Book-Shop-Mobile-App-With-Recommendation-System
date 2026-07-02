package org.appvibessolution.backend.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RetrieveBookDTO {
    private Long id;
    private String title;
    private String author;
    private double price;
    private String currency;
    private String coverUrl;
    private LocalDateTime updatedAt;
}
