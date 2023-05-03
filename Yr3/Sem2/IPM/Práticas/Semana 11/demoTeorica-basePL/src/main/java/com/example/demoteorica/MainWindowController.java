package com.example.demoteorica;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Label;
import javafx.scene.control.Slider;
import javafx.scene.control.TextField;
import javafx.scene.input.KeyEvent;
import javafx.scene.input.MouseEvent;

import java.io.IOException;

public class MainWindowController {
    @FXML
    private Label welcomeText;

    // Model
    private final ConverterModel converterModel = ConverterModel.getInstance();

    @FXML
    protected void initialize() {
        // bindings
        // a Label welcomText terá o texto que estiver na propriedade TitleProp do modelo
        welcomeText.textProperty().bind((converterModel.getTitleProp()));
        // setting up initial state
    }

    // Event handlers

}