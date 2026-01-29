package com.esgi.starwars.util;

import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class JPAUtil {
    private static final String PERSISTENCE_UNIT_NAME = "star-wars-pu";
    private static EntityManagerFactory factory;

    public static EntityManagerFactory getEntityManagerFactory() {
        if (factory == null) {
            try {
                factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
            } catch (Exception e) {
                System.err.println("Initial SessionFactory creation failed." + e);
                throw new ExceptionInInitializerError(e);
            }
        }
        return factory;
    }

    public static void shutdown() {
        if (factory != null) {
            factory.close();
        }
    }
}
