package org.appvibessolution.backend.controller;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin
@RequestMapping(value = "api/v1/book")
public class BookController {

    // Get all books by page
    @GetMapping
    public String getAllBooksByPage() {
        return "Returning book page 1";
    }
}
