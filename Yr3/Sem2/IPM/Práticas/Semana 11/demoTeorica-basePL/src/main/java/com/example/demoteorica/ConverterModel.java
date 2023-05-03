package com.example.demoteorica;

import javafx.beans.property.SimpleDoubleProperty;
import javafx.beans.property.SimpleStringProperty;

public class ConverterModel {

    // Business Logic layer
    private TempCalculator businessLogic = new TempCalculator();

    public TempCalculator getBusinessLogic() {
        return businessLogic;
    }

    // Propriedades do modelo - para fazer binding com a view
    private final SimpleStringProperty titleProp = new SimpleStringProperty();
    public SimpleStringProperty getTitleProp() { return titleProp; }

    // Singleton
    private ConverterModel() {
        titleProp.set(businessLogic.getTitle());
    }
    private static ConverterModel instance = null;
    public static ConverterModel getInstance() {
        if (instance == null) {
            instance = new ConverterModel();
        }
        return instance;
    }

    // Métodos do modelo

}