package com.Intern.MicrosoftProject.configurations;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import javax.sql.DataSource;

@Configuration
public class Database {

    public DataSource PostgreSQL(){

        DriverManagerDataSource source = new DriverManagerDataSource();

        source.setDriverClassName("org.postgresql.Driver");
        source.setUrl("jdbc:postgresql://fy22interns.northeurope.cloudapp.azure.com:5432/learn");
        source.setUsername("fy22intern");
        source.setPassword("Abcd1234");

        return source;
    }
}
