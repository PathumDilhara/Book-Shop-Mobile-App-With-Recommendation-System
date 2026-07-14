package org.appvibessolution.backend.repo;

import org.appvibessolution.backend.model.Book;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface BookRepo extends JpaRepository<Book, Long> {

    @Query("SELECT DISTINCT b.genre FROM Book b")
    List<String> findAllGenres();

//    Page<Book> findAll(Pageable pageable);
}
