package com.esgi.starwars.dao;

import java.util.List;
import com.esgi.starwars.entity.ESGIVaisseaux;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

/**
 * DAO pour la gestion des vaisseaux (JPA/H2)
 */
public class ESGIVaisseauxDAO {

    private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("star-wars-pu");

    private static void initData() {
        EntityManager em = emf.createEntityManager();
        try {
            Long count = em.createQuery("SELECT count(v) FROM ESGIVaisseaux v", Long.class).getSingleResult();
            if (count == 0) {
                em.getTransaction().begin();
                em.persist(new ESGIVaisseaux("X-Wing", "Chasseur stellaire de l'Alliance Rebelle", 150000, 80, 85, 60,
                        "Chasseur", "Rebellion"));
                em.persist(new ESGIVaisseaux("TIE Fighter", "Chasseur standard de l'Empire", 75000, 60, 95, 30,
                        "Chasseur", "Empire"));
                em.persist(new ESGIVaisseaux("Millennium Falcon", "Le tas de ferraille le plus rapide de la galaxie",
                        500000, 70, 100, 85, "Transport", "Rebellion"));
                em.getTransaction().commit();
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log error but don't crash app
        } finally {
            if (em.isOpen())
                em.close();
        }
    }

    public static List<ESGIVaisseaux> getAllVaisseaux() {
        initData(); // Ensure data exists on first access
        EntityManager em = emf.createEntityManager();
        try {
            return em.createQuery("SELECT v FROM ESGIVaisseaux v", ESGIVaisseaux.class).getResultList();
        } finally {
            em.close();
        }
    }

    public static ESGIVaisseaux findVaisseaux(Long id) {
        EntityManager em = emf.createEntityManager();
        try {
            return em.find(ESGIVaisseaux.class, id);
        } finally {
            em.close();
        }
    }

    public static void addVaisseaux(ESGIVaisseaux v) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(v);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public static void updateVaisseaux(ESGIVaisseaux v) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(v);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public static void removeVaisseaux(Long id) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            ESGIVaisseaux v = em.find(ESGIVaisseaux.class, id);
            if (v != null) {
                em.remove(v);
            }
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }
}
