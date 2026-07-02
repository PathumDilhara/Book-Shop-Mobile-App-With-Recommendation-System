package org.appvibessolution.backend.service;

import jakarta.transaction.Transactional;
import org.appvibessolution.backend.dto.RetrieveBookDTO;
import org.appvibessolution.backend.dto.SingleBookDATO;
import org.appvibessolution.backend.model.Book;
import org.appvibessolution.backend.repo.BookRepo;
import org.json.JSONArray;
import org.json.JSONObject;
import org.modelmapper.ModelMapper;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import tools.jackson.core.type.TypeReference;
import tools.jackson.databind.ObjectMapper;

import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class BookService {

    private final BookRepo bookRepo;
    private final ModelMapper modelMapper;

    public BookService(BookRepo bookRepo, ModelMapper modelMapper) {
        this.bookRepo = bookRepo;
        this.modelMapper = modelMapper;
    }


    public Page<RetrieveBookDTO> getBooksByPage(int page, int size){
        Pageable pageable = PageRequest.of(page, size);
        Page<Book> bookPage = bookRepo.findAll(pageable);
        Page<RetrieveBookDTO> dtoPage = bookPage.map(book -> new RetrieveBookDTO(
                book.getId(),
                book.getTitle(),
                book.getAuthor(),
                book.getPrice(),
                book.getCurrency(),
                book.getCoverUrl(),
                book.getUpdatedAt()
        ));
        return dtoPage;
    }


    public String databaseUpdater(MultipartFile jsonFile){
        try {
            System.out.println("Database updating running");

            // Ensure file is not empty
            if (jsonFile.isEmpty()) {
                throw new RuntimeException("File is empty");
            }

            // Ensure correct file type
            String fileName = jsonFile.getOriginalFilename();
            if (fileName==null || !fileName.endsWith(".json")){
                throw new RuntimeException("File type not supported, Please upload a JSON file");
            }

            // Read json file content
            String jsonData = new String(jsonFile.getBytes(), StandardCharsets.UTF_8);

            // Parsing
            ObjectMapper objectMapper = new ObjectMapper();
            List<RetrieveBookDTO> bookDTOSs = objectMapper.readValue(
                    jsonData,
                    new TypeReference<>(){}
            );

//            System.out.println(bookDTOSs);

            bookRepo.deleteAll();

            List<Book> books = bookDTOSs.stream()
                    .map(dto -> {

                        Book book= modelMapper.map(dto, Book.class);

                        book.setIsbn(generateISBNFromUUID());

                        return book;
                    }).toList();

            List<Book> savedBooks = bookRepo.saveAll(books);

            return "Successfully updated " + savedBooks.size() + " books";

        } catch (Exception ex){
            throw new RuntimeException("Error while database updating", ex);
        }
    }

    private String generateISBNFromUUID() {
        // Generate a unique 13-digit number from UUID
        UUID uuid = UUID.randomUUID();
        long uniqueNumber = Math.abs(uuid.getMostSignificantBits() % 1_000_000_000_000L);
        return String.format("%013d", uniqueNumber);
    }



    public String openLibraryBookLoader(){
        try {
            String[] urls = {
                    "https://openlibrary.org/search.json?subject=fiction&limit=20",
                    "https://openlibrary.org/search.json?subject=romance&limit=20",
                    "https://openlibrary.org/search.json?subject=fantasy&limit=20",
                    "https://openlibrary.org/search.json?subject=science_fiction&limit=20",
                    "https://openlibrary.org/search.json?subject=mystery&limit=20",
                    "https://openlibrary.org/search.json?subject=thriller&limit=20",
                    "https://openlibrary.org/search.json?subject=horror&limit=20",
                    "https://openlibrary.org/search.json?subject=history&limit=20",
                    "https://openlibrary.org/search.json?subject=biography&limit=20",
                    "https://openlibrary.org/search.json?subject=science&limit=20",
                    "https://openlibrary.org/search.json?subject=technology&limit=20",
                    "https://openlibrary.org/search.json?subject=programming&limit=20",
                    "https://openlibrary.org/search.json?subject=computer_science&limit=20",
                    "https://openlibrary.org/search.json?subject=psychology&limit=20",
                    "https://openlibrary.org/search.json?subject=philosophy&limit=20",
                    "https://openlibrary.org/search.json?subject=business&limit=20",
                    "https://openlibrary.org/search.json?subject=economics&limit=20",
                    "https://openlibrary.org/search.json?subject=self_help&limit=20",
                    "https://openlibrary.org/search.json?subject=health&limit=20",
                    "https://openlibrary.org/search.json?subject=travel&limit=20",
                    "https://openlibrary.org/search.json?subject=adventure&limit=20",
                    "https://openlibrary.org/search.json?subject=crime&limit=20",
                    "https://openlibrary.org/search.json?subject=poetry&limit=20",
                    "https://openlibrary.org/search.json?subject=comics&limit=20",
                    "https://openlibrary.org/search.json?subject=children&limit=20",
                    "https://openlibrary.org/search.json?subject=young_adult&limit=20",
                    "https://openlibrary.org/search.json?subject=education&limit=20",
                    "https://openlibrary.org/search.json?subject=art&limit=20",
                    "https://openlibrary.org/search.json?subject=music&limit=20",
                    "https://openlibrary.org/search.json?subject=religion&limit=20"
            };

            RestTemplate restTemplate = new RestTemplate();

            for (String url:urls){
                ResponseEntity<String> response =
                        restTemplate.getForEntity(url, String.class);
                String jsonString = response.getBody();

                JSONObject jsonObject = new JSONObject(jsonString);
                JSONArray docs = jsonObject.getJSONArray("docs");
                System.out.println("==================================");
                System.out.println(docs);
            }

            return "done";
        } catch (Exception e){
            throw new RuntimeException("Error updating database");
        }
    }

    public SingleBookDATO getBookInfo(Long id){

        try {
            if (id == null) {
                throw new RuntimeException("ID cant be null or empty");
            }

            Book book = bookRepo.findById(id).orElseThrow(
                    () -> new RuntimeException("There is no book under id : " + id));

            return modelMapper.map(book, SingleBookDATO.class);
        } catch (Exception e){
            throw new RuntimeException("Cant find book info for id : " + id, e);
        }
    }
}
