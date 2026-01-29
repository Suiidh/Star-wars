package com.esgi.starwars.entity;

import jakarta.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

@Entity
@Table(name = "scores")
public class Score implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @Column(nullable = false)
    private String quizType; // 'JEDI', 'VAISSEAUX', 'SITH'

    private int score; // e.g., number of correct answers

    private int totalQuestions;

    private LocalDateTime playedAt;

    public Score() {
    }

    public Score(User user, String quizType, int score, int totalQuestions) {
        this.user = user;
        this.quizType = quizType;
        this.score = score;
        this.totalQuestions = totalQuestions;
        this.playedAt = LocalDateTime.now();
    }

    @PrePersist
    protected void onCreate() {
        playedAt = LocalDateTime.now();
    }

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getQuizType() {
        return quizType;
    }

    public void setQuizType(String quizType) {
        this.quizType = quizType;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public int getTotalQuestions() {
        return totalQuestions;
    }

    public void setTotalQuestions(int totalQuestions) {
        this.totalQuestions = totalQuestions;
    }

    public LocalDateTime getPlayedAt() {
        return playedAt;
    }

    public void setPlayedAt(LocalDateTime playedAt) {
        this.playedAt = playedAt;
    }
}
