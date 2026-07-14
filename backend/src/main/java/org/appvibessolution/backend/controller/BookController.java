package org.appvibessolution.backend.controller;

import org.appvibessolution.backend.dto.BookCardDTO;
import org.appvibessolution.backend.dto.RetrieveBookDTO;
import org.appvibessolution.backend.dto.SingleBookDATO;
import org.appvibessolution.backend.response.ApiResponse;
import org.appvibessolution.backend.service.BookService;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
@CrossOrigin
@RequestMapping(value = "api/v1/book")
public class BookController {

    private final BookService bookService;

    public BookController(BookService bookService) {
        this.bookService = bookService;
    }

    // Get all books by page
    @GetMapping
    public ApiResponse<Page<RetrieveBookDTO>> getAllBooksByPage(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size) {
        Page<RetrieveBookDTO> books = bookService.getBooksByPage(page, size);
        return new ApiResponse<>(true, "paginated books found", books);
    }

    @PostMapping("/db-update")
    public ApiResponse<String> databaseUpdater(@RequestParam("json-file") MultipartFile jsonFile) {
        String message = bookService.databaseUpdater(jsonFile);
        return new ApiResponse<>(true, "Database updated successfully", message);
    }

    @PostMapping("/loader")
    public ApiResponse<String> openLibraryBookLoader() {
        String message = bookService.openLibraryBookLoader();
        return new ApiResponse<>(true, "Database updated successfully", message);
    }

    // Single book info
    @GetMapping("/{id}")
    public ApiResponse<SingleBookDATO> getBookById(@PathVariable("id") Long id) {
        SingleBookDATO book = bookService.getBookById(id);
        return new ApiResponse<>(true, "Book info found : " + id, book);
    }

    // get genres
    @GetMapping("/genres")
    public ApiResponse<List<String>> getGenreList(){
        List<String> genres = bookService.getAllGenres();
        int len = genres.toArray().length;
        return new ApiResponse<>(true, "Fetched all genres : "+len, genres);
    }

    // get top-rated 10 books
    @GetMapping("/top-rated")
    public ApiResponse<List<BookCardDTO>> getTopRatedBooks(){
        List<BookCardDTO> books = bookService.getTopRatedBooks();
        return new ApiResponse<>(true, "Fetched top rated books", books);
    }
}
