package com.esgi.starwars.listener;

import com.esgi.starwars.dao.ESGIVaisseauxDAO;
import com.esgi.starwars.dao.QuizDAO;
import com.esgi.starwars.dao.UserDAO;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

@WebListener
public class AppInitializer implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("--- Star Wars App Starting ---");

        // Initialize Databases
        try {
            ESGIVaisseauxDAO.getAllVaisseaux(); // Triggers initData for ships
            UserDAO.initAdmin(); // Triggers admin creation
            QuizDAO.initQuestions(); // Triggers question seeding
        } catch (Exception e) {
            System.err.println("Error during app initialization: " + e.getMessage());
            e.printStackTrace();
        }

        System.out.println("--- Star Wars App Initialized ---");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // Cleanup if needed
    }
}
