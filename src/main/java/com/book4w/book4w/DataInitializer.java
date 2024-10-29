package com.book4w.book4w;

import com.book4w.book4w.service.CSVService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

@Component
public class DataInitializer implements CommandLineRunner {

    @Autowired
    private CSVService csvService;


    @Override
    public void run(String... args) {
        csvService.saveCSVData();
    }
}