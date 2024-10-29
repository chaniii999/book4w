import com.opencsv.CSVReader;
import com.opencsv.exceptions.CsvException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

@Service
public class CSVService {

    @Autowired
    private UserRepository userRepository;

    public void saveCSVData(MultipartFile file) {
        try (CSVReader csvReader = new CSVReader(new InputStreamReader(file.getInputStream(), StandardCharsets.UTF_8))) {
            List<User> users = new ArrayList<>();
            String[] values;

            // 첫 번째 줄에 헤더가 포함된 경우 skip
            csvReader.readNext();

            while ((values = csvReader.readNext()) != null) {
                User user = new User();
                user.setName(values[0]);  // 첫 번째 컬럼이 name
                user.setEmail(values[1]); // 두 번째 컬럼이 email
                users.add(user);
            }
            userRepository.saveAll(users);
        } catch (Exception | CsvException e) {
            throw new RuntimeException("CSV 파일을 처리하는 중 오류가 발생했습니다: " + e.getMessage());
        }
    }
}
