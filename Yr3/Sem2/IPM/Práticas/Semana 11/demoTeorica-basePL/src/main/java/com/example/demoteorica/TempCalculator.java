package com.example.demoteorica;

public class TempCalculator {

    private final String title = "Calculadora de temperaturas";

    public double celsius2fahrenheit(double clesius) {
        return clesius * 1.8 + 32;
    }

    public double fahrenheit2celsius(double fahrenheit) {
        return (fahrenheit - 32) / 1.8;
    }

    public double celsius2kelvin(double celsius) {
        return celsius + 273.15;
    }

    public double kelvin2celsius(double kelvin) {
        return kelvin - 273.15;
    }

    public double fahrenheit2kelvin(double fahrenheit) {
        return (fahrenheit + 459.67) * 5/9;
    }

    public double kelvin2fahrenheit(double kelvin) {
        return kelvin * 9/5 - 459.67;
    }

    public String getTitle() {
        return this.title;
    }
}
