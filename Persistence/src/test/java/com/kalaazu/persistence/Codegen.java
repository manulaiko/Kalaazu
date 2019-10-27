package com.kalaazu.persistence;

public class Codegen {
    public static void main(String[] args) throws Exception {
        System.out.println(org.mariadb.jdbc.Driver.class.getName());
        org.jooq.codegen.GenerationTool.main(
            new String[] {
                    "/home/manulaiko/Programming/Java/Kalaazu/Persistence/src/main/resources/codegen.xml"
            }
        );
    }
}
