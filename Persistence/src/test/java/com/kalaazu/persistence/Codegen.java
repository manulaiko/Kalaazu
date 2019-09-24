package com.kalaazu.persistence;

public class Codegen {
    public static void main(String[] args) throws Exception {
        System.out.println(org.mariadb.jdbc.Driver.class.getName());
        org.jooq.codegen.GenerationTool.main(
            new String[] {
                    "Persistence/src/main/resources/codegen.xml"
            }
        );
    }
}
