package com.manulaiko.kalaazu.persistence.database;

import org.hibernate.HibernateException;
import org.hibernate.Metamodel;
import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import javax.persistence.metamodel.EntityType;

/**
 * Database class.
 * ===============
 *
 * Communicates with the database.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class Database {
    public static void main(final String[] args) {
        Database db = new Database();
        db.setDatabase("kalaazu")
          .setUsername("manulaiko")
          .setPassword("")
          .setPort(3306)
          .setHost("localhost")
          .initialize();

        try (Session session = db.getSession()) {
            System.out.println("querying all the managed entities...");
            final Metamodel metamodel = session.getSessionFactory()
                                               .getMetamodel();
            for (EntityType<?> entityType : metamodel.getEntities()) {
                final String entityName = entityType.getName();
                final Query  query      = session.createQuery("from " + entityName);
                System.out.println("executing: " + query.getQueryString());
                for (Object o : query.list()) {
                    System.out.println("  " + o);
                }
            }
        }
    }

    /**
     * Session factory.
     */
    private SessionFactory sessionFactory;

    /**
     * Server host.
     */
    private String host;

    /**
     * Server port.
     */
    private int port;

    /**
     * Database user.
     */
    private String username;

    /**
     * User password.
     */
    private String password;

    /**
     * Database name.
     */
    private String database;

    public void initialize() {
        if (this.sessionFactory != null) {
            return;
        }

        try {
            var configuration = new Configuration();
            var url           = "jdbc:mariadb://" + this.getHost() + ":" + this.getPort() + "/" + this.getDatabase();

            configuration.setProperty("hibernate.connection.url", url);
            configuration.setProperty("hibernate.connection.username", this.getUsername());
            configuration.setProperty("hibernate.connection.password", this.getPassword());

            configuration.configure();

            sessionFactory = configuration.buildSessionFactory();
        } catch (Throwable ex) {
            throw new ExceptionInInitializerError(ex);
        }
    }

    public Session getSession() throws HibernateException {
        return sessionFactory.openSession();
    }

    //<editor-fold desc="Getters and setters">
    public String getHost() {
        return host;
    }

    public Database setHost(String host) {
        this.host = host;

        return this;
    }

    public int getPort() {
        return port;
    }

    public Database setPort(int port) {
        this.port = port;

        return this;
    }

    public String getUsername() {
        return username;
    }

    public Database setUsername(String username) {
        this.username = username;

        return this;
    }

    public String getPassword() {
        return password;
    }

    public Database setPassword(String password) {
        this.password = password;

        return this;
    }

    public String getDatabase() {
        return database;
    }

    public Database setDatabase(String database) {
        this.database = database;

        return this;
    }
    //</editor-fold>
}