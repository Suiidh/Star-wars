package com.esgi.starwars.dao;

import com.esgi.starwars.entity.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.NoResultException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import com.esgi.starwars.util.JPAUtil;

public class UserDAO {

    private static EntityManagerFactory emf = JPAUtil.getEntityManagerFactory();

    public static void createUser(User user) {
        EntityManager em = emf.createEntityManager();
        try {
            user.setPassword(hashPassword(user.getPassword())); // Hash password before saving
            em.getTransaction().begin();
            em.persist(user);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public static User findByUsername(String username) {
        EntityManager em = emf.createEntityManager();
        try {
            return em.createQuery("SELECT u FROM User u WHERE u.username = :username", User.class)
                    .setParameter("username", username)
                    .getSingleResult();
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }
    }

    public static boolean validateCredentials(String username, String password) {
        User user = findByUsername(username);
        if (user == null) {
            return false;
        }
        return user.getPassword().equals(hashPassword(password));
    }

    private static String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(password.getBytes());
            return Base64.getEncoder().encodeToString(hash);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Error hashing password", e);
        }
    }

    // Check if admin exists, if not create default admin
    public static void initAdmin() {
        if (findByUsername("admin") == null) {
            createUser(new User("admin", "admin123", "ADMIN"));
            System.out.println("Default admin user created.");
        }
    }
}
