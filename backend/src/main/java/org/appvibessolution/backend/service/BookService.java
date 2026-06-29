package org.appvibessolution.backend.service;

import jakarta.transaction.Transactional;
import org.appvibessolution.backend.dto.RetrieveBookDTO;
import org.appvibessolution.backend.model.Book;
import org.appvibessolution.backend.repo.BookRepo;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
@Transactional
public class BookService {

    private final BookRepo bookRepo;

    public BookService(BookRepo bookRepo) {
        this.bookRepo = bookRepo;
    }


    public Page<RetrieveBookDTO> getBooksByPage(int page, int size){
        Pageable pageable = PageRequest.of(page, size);
        Page<Book> bookPage = bookRepo.findAll(pageable);
        Page<RetrieveBookDTO> dtoPage = bookPage.map(book -> new RetrieveBookDTO(
                book.getTitle(),
                book.getAuthor(),
                book.getFirstPublishYear(),
                book.getCoverImageUrl()
        ));
        return dtoPage;
    }


    public String databaseUpdater(){
        try {
            String url = "https://openlibrary.org/search.json?q=programming&limit=10";
            String coverImageBaseUrl = "https://covers.openlibrary.org/b/id/%s-L.jpg";

            RestTemplate restTemplate = new RestTemplate();

            ResponseEntity<String> response =
                    restTemplate.getForEntity(url, String.class);

            String jsonString = response.getBody();

            JSONObject jsonObject = new JSONObject(jsonString);
            JSONArray docs = jsonObject.getJSONArray("docs");

            // after books fetching done let delete existing all books
            bookRepo.deleteAll();

            for (int i = 0; i < docs.length(); i++) {
                JSONObject book = docs.getJSONObject(i);
                //System.out.println(book);

                // title
                String title = book.optString("title");

                // author
                JSONArray authorsArray = book.optJSONArray("author_name");
                String author = "";
                if (authorsArray != null && authorsArray.length() > 0) {
                    author = authorsArray.getString(0); // first author only
                }

                // cover image
                String coverImage = book.optString("cover_i");
                String coverImageUrl = String.format(coverImageBaseUrl, coverImage);

                // first_publish_year
                String firstPublishYear = book.optString("first_publish_year");

                System.out.println("Title: " + title + " | Author: " + author + " cover_i : " + coverImageUrl);

                Book bookObj = new Book();
                bookObj.setTitle(title);
                bookObj.setAuthor(author);
                bookObj.setFirstPublishYear(firstPublishYear);
                bookObj.setCoverImageUrl(coverImageUrl);

                bookRepo.save(bookObj);
//                break;
            }

            return "Success";
        } catch (Exception e){
            throw new RuntimeException("Error updating database");
        }
    }
}
