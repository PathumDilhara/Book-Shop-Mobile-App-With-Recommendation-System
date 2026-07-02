package org.appvibessolution.backend.repo;

import org.appvibessolution.backend.model.Book;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BookRepo extends JpaRepository<Book, Long> {
}
