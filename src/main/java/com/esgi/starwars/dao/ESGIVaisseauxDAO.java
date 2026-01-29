package com.esgi.starwars.dao;

import java.util.List;
import com.esgi.starwars.entity.ESGIVaisseaux;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;

import com.esgi.starwars.util.JPAUtil;

/**
 * DAO pour la gestion des vaisseaux (JPA/H2)
 */
public class ESGIVaisseauxDAO {

    private static EntityManagerFactory emf = JPAUtil.getEntityManagerFactory();

    public static void forceInitData() {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            System.out.println("Forcing database reset...");
            em.createQuery("DELETE FROM ESGIVaisseaux").executeUpdate();
            em.getTransaction().commit();

            // Re-seed
            initData();
        } finally {
            em.close();
        }
    }

    private static void initData() {
        EntityManager em = emf.createEntityManager();
        try {
            List<ESGIVaisseaux> existingShips = em.createQuery("SELECT v FROM ESGIVaisseaux v", ESGIVaisseaux.class)
                    .getResultList();
            boolean needsInit = existingShips.isEmpty();

            // Check for corruption (empty names or 0 prices) which might happen if schema
            // update failed or data is bad
            if (!existingShips.isEmpty()) {
                for (ESGIVaisseaux v : existingShips) {
                    if (v.getName() == null || v.getPrice() == 0) {
                        System.out.println(
                                "Detected corrupted data (null name or critical stats 0). Clearing and Re-initializing...");
                        em.getTransaction().begin();
                        em.createQuery("DELETE FROM ESGIVaisseaux").executeUpdate();
                        em.getTransaction().commit();
                        needsInit = true;
                        break;
                    }
                }
            }

            if (needsInit) {
                em.getTransaction().begin();
                System.out.println("Initializing MySQL Database with default ships...");
                em.persist(new ESGIVaisseaux("X-Wing", "Chasseur polyvalent de l'Alliance Rebelle", 150000, 80, 85, 60,
                        "Chasseur", "Rebellion"));
                em.persist(new ESGIVaisseaux("TIE Fighter", "Chasseur standard de l'Empire, rapide mais fragile", 60000,
                        60, 100, 20, "Chasseur", "Empire"));
                em.persist(new ESGIVaisseaux("Millennium Falcon", "Le cargo corellien légendaire et modifié", 500000,
                        70, 100, 85, "Transport", "Rebellion"));
                em.persist(new ESGIVaisseaux("Y-Wing", "Bombardier lourd, lent mais robuste", 120000, 85, 70, 90,
                        "Bombardier", "Rebellion"));
                em.persist(new ESGIVaisseaux("A-Wing", "Intercepteur ultra-rapide de la Rébellion", 140000, 65, 120, 30,
                        "Chasseur", "Rebellion"));
                em.persist(new ESGIVaisseaux("TIE Interceptor", "Version plus rapide et mortelle du TIE", 110000, 75,
                        115, 25, "Chasseur", "Empire"));
                em.persist(new ESGIVaisseaux("TIE Bomber", "Bombardier impérial pour attaques au sol", 130000, 90, 60,
                        95, "Bombardier", "Empire"));
                em.persist(new ESGIVaisseaux("TIE Advanced x1", "Le prototype personnel de Dark Vador", 350000, 90, 110,
                        80, "Chasseur", "Empire"));
                em.persist(new ESGIVaisseaux("Slave I", "Le vaisseau patrouilleur de Boba Fett", 400000, 95, 90, 85,
                        "Transport", "Neutre"));
                em.persist(new ESGIVaisseaux("Imperial Star Destroyer", "La terreur de la flotte impériale", 15000000,
                        100, 40, 100, "Croiseur", "Empire"));
                em.persist(new ESGIVaisseaux("Super Star Destroyer", "Le vaisseau amiral de l'Executor", 50000000, 100,
                        30, 100, "Croiseur", "Empire"));
                em.persist(new ESGIVaisseaux("Tantive IV", "Corvette corellienne diplomatique", 800000, 50, 60, 50,
                        "Transport", "Rebellion"));
                em.persist(new ESGIVaisseaux("Snowspeeder", "Speeder d'assaut pour environnements froids", 45000, 40,
                        100, 35, "Chasseur", "Rebellion"));
                em.persist(new ESGIVaisseaux("B-Wing", "Chasseur d'assaut lourd avec puissance de feu maximale", 160000,
                        95, 75, 70, "Bombardier", "Rebellion"));
                em.persist(new ESGIVaisseaux("Kylo Ren's Shuttle", "Navette de commandement du Premier Ordre", 1200000,
                        80, 85, 95, "Transport", "Premiere-Ordre"));

                em.getTransaction().commit();
                System.out.println("Database initialized successfully.");
            } else {
                System.out.println("Database check: Data integrity Verified.");
            }
        } catch (Exception e) {
            System.err.println("Error initializing database: " + e.getMessage());
            e.printStackTrace();
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
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
