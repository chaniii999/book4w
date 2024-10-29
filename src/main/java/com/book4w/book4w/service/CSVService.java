package com.book4w.book4w.service;

import com.book4w.book4w.entity.Book;
import com.book4w.book4w.repository.BookRepository;
import com.opencsv.CSVReader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;

import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

@Service
public class CSVService {

    @Autowired
    private BookRepository bookRepository;

    public void saveCSVData() {
        // 데이터베이스에 이미 데이터가 존재하는지 확인
        if (bookRepository.count() > 0) {
            System.out.println("데이터베이스에 이미 데이터가 존재합니다. CSV 데이터를 불러오지 않습니다.");
            return; // 데이터가 존재하면 메서드를 종료
        }

        try (CSVReader csvReader = new CSVReader(new InputStreamReader(new ClassPathResource("Book_20240903.csv").getInputStream(), StandardCharsets.UTF_8))) {
            List<Book> books = new ArrayList<>();
            String[] values;

            // 첫 번째 줄에 헤더가 포함된 경우 skip
            csvReader.readNext();

            while ((values = csvReader.readNext()) != null) {
                Book book = new Book();
                book.setName(values[0] != null && !values[0].isEmpty() ? values[0] : "Unknown Title");
                book.setWriter(values[1] != null && !values[1].isEmpty() ? values[1] : "Unknown Writer");
                book.setPub(values[2] != null && !values[2].isEmpty() ? values[2] : "Unknown Publisher");

                // year 필드가 비어 있으면 기본값으로 0 설정
                book.setYear(values[3] != null && !values[3].isEmpty() ? Integer.parseInt(values[3].replaceAll("\\.", "")) : 0);
                books.add(book);
            }
            bookRepository.saveAll(books);
        } catch (Exception e) {
            throw new RuntimeException("CSV 파일을 처리하는 중 오류가 발생했습니다: " + e.getMessage());
        }
    }
}