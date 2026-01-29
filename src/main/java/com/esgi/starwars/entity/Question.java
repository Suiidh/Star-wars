package com.esgi.starwars.entity;

import jakarta.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "questions")
public class Question implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String type; // 'JEDI', 'VAISSEAUX', 'SITH'

    @Column(nullable = false, length = 500)
    private String text;

    private String choiceA;
    private String choiceB;
    private String choiceC;
    private String choiceD;

    @Column(nullable = false)
    private String correctChoice; // 'A', 'B', 'C', or 'D'

    @Column(length = 500)
    private String explanation;

    private int difficulty; // 1: Easy, 2: Medium, 3: Hard

    public Question() {
    }

    public Question(String type, String text, String choiceA, String choiceB, String choiceC, String choiceD,
            String correctChoice, String explanation, int difficulty) {
        this.type = type;
        this.text = text;
        this.choiceA = choiceA;
        this.choiceB = choiceB;
        this.choiceC = choiceC;
        this.choiceD = choiceD;
        this.correctChoice = correctChoice;
        this.explanation = explanation;
        this.difficulty = difficulty;
    }

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getChoiceA() {
        return choiceA;
    }

    public void setChoiceA(String choiceA) {
        this.choiceA = choiceA;
    }

    public String getChoiceB() {
        return choiceB;
    }

    public void setChoiceB(String choiceB) {
        this.choiceB = choiceB;
    }

    public String getChoiceC() {
        return choiceC;
    }

    public void setChoiceC(String choiceC) {
        this.choiceC = choiceC;
    }

    public String getChoiceD() {
        return choiceD;
    }

    public void setChoiceD(String choiceD) {
        this.choiceD = choiceD;
    }

    public String getCorrectChoice() {
        return correctChoice;
    }

    public void setCorrectChoice(String correctChoice) {
        this.correctChoice = correctChoice;
    }

    public String getExplanation() {
        return explanation;
    }

    public void setExplanation(String explanation) {
        this.explanation = explanation;
    }

    public int getDifficulty() {
        return difficulty;
    }

    public void setDifficulty(int difficulty) {
        this.difficulty = difficulty;
    }
}
