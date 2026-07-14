package org.appvibessolution.backend.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BookCardDTO {
    public Long id;
    public String title;
    public String coverUrl;
}
