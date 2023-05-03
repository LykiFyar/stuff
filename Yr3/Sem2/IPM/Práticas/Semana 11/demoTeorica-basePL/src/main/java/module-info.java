module com.example.demoteorica {
    requires javafx.controls;
    requires javafx.fxml;


    opens com.example.demoteorica to javafx.fxml;
    exports com.example.demoteorica;
}