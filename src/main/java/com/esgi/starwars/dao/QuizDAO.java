package com.esgi.starwars.dao;

import com.esgi.starwars.entity.Question;
import com.esgi.starwars.entity.Score;
import com.esgi.starwars.entity.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import java.util.List;

import com.esgi.starwars.util.JPAUtil;

public class QuizDAO {

        private static EntityManagerFactory emf = JPAUtil.getEntityManagerFactory();

        public static void initQuestions() {
                EntityManager em = emf.createEntityManager();
                try {
                        Long count = em.createQuery("SELECT count(q) FROM Question q", Long.class).getSingleResult();
                        if (count == 0) {
                                em.getTransaction().begin();
                                System.out.println("Initializing Quiz Questions...");

                                // JEDI Questions
                                em.persist(new Question("JEDI", "Qui était le maître d'Anakin Skywalker ?",
                                                "Yoda", "Obi-Wan Kenobi", "Qui-Gon Jinn", "Mace Windu", "B",
                                                "Le maître d'Anakin Skywalker était Obi-Wan Kenobi.", 1));

                                em.persist(new Question("JEDI",
                                                "Quelle est la couleur du sabre laser de Luke dans Le Retour du Jedi ?",
                                                "Bleu", "Rouge", "Violet", "Vert", "D",
                                                "La couleur du sabre de Luke dans le Retour du Jedi est verte.", 1));

                                em.persist(new Question("JEDI",
                                                "Quelle planète est la capitale de la République Galactique ?",
                                                "Coruscant", "Naboo", "Tatooine", "Alderaan", "A",
                                                "La capitale de la République est Coruscant.", 2));

                                em.persist(new Question("JEDI", "Qui a construit C-3PO ?",
                                                "Luke Skywalker", "Anakin Skywalker", "Padmé Amidala", "R2-D2", "B",
                                                "C'est Anakin Skywalker qui a construit C-3PO.", 2));

                                // VAISSEAUX Questions
                                em.persist(new Question("VAISSEAUX", "Quel est le nom du vaisseau de Han Solo ?",
                                                "Ebon Hawk", "X-Wing", "Faucon Millenium", "Slave I", "C",
                                                "Le vaisseau de Han Solo est le Faucon Millenium.", 1));

                                em.persist(new Question("VAISSEAUX", "Quel est le vaisseau personnel de Boba Fett ?",
                                                "Slave I", "TIE Fighter", "Executor", "Razor Crest", "A",
                                                "Le vaisseau de Boba Fett est le Slave I.", 2));

                                em.persist(new Question("VAISSEAUX", "Quel chasseur est le standard de l'Empire ?",
                                                "TIE Interceptor", "TIE Fighter", "TIE Bomber", "Star Destroyer", "B",
                                                "Le chasseur standard de l'Empire est le TIE Fighter.", 1));

                                em.persist(new Question("VAISSEAUX",
                                                "Aux commandes de quel vaisseau Luke détruit-il l'Étoile de la Mort ?",
                                                "X-Wing", "Y-Wing", "A-Wing", "Snowspeeder", "A",
                                                "Luke a détruit l'Étoile de la Mort aux commandes d'un X-Wing.", 1));

                                // SITH Questions
                                em.persist(new Question("SITH", "Qui est le maître de Dark Vador ?",
                                                "Dark Maul", "Dark Sidious", "Dark Plagueis", "Count Dooku", "B",
                                                "Le maître de Dark Vador est Dark Sidious (Palpatine).", 1));

                                em.persist(new Question("SITH", "Qui a tué Qui-Gon Jinn ?",
                                                "Dark Maul", "Dark Vador", "Boba Fett", "Jango Fett", "A",
                                                "Qui-Gon Jinn a été tué par Dark Maul sur Naboo.", 2));

                                em.persist(new Question("SITH", "Quelle est la règle fondamentale des Sith ?",
                                                "La Règle de Trois", "La Règle du Plus Fort", "La Règle des Deux",
                                                "La Règle de l'Ombre", "C",
                                                "La Règle des Deux: un maître et un apprenti.", 2));

                                em.persist(new Question("SITH", "Qui a enseigné à Palpatine tout ce qu'il savait ?",
                                                "Dark Bane", "Dark Revan", "Dark Malak", "Dark Plagueis", "D",
                                                "Darth Plagueis le Sage a tout enseigné à Palpatine.", 3));

                                em.getTransaction().commit();
                                System.out.println("Quiz questions initialized.");
                        }
                } catch (Exception e) {
                        e.printStackTrace();
                        if (em.getTransaction().isActive())
                                em.getTransaction().rollback();
                } finally {
                        em.close();
                }
        }

        public static List<Question> getQuestionsByType(String type) {
                initQuestions(); // Ensure questions exist
                EntityManager em = emf.createEntityManager();
                try {
                        return em.createQuery("SELECT q FROM Question q WHERE q.type = :type", Question.class)
                                        .setParameter("type", type.toUpperCase())
                                        .getResultList();
                } finally {
                        em.close();
                }
        }

        public static void saveScore(Score score) {
                EntityManager em = emf.createEntityManager();
                try {
                        em.getTransaction().begin();
                        em.persist(score);
                        em.getTransaction().commit();
                } finally {
                        em.close();
                }
        }

        public static List<Score> getUserScores(User user) {
                EntityManager em = emf.createEntityManager();
                try {
                        return em
                                        .createQuery("SELECT s FROM Score s WHERE s.user.id = :userId ORDER BY s.playedAt DESC",
                                                        Score.class)
                                        .setParameter("userId", user.getId())
                                        .getResultList();
                } finally {
                        em.close();
                }
        }
}
