package com.kalaazu.persistence;

import org.reflections.Reflections;

import javax.persistence.Entity;
import java.io.FileWriter;
import java.nio.file.Path;

/**
 * Generate Spring Data repositories.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class GenerateRepositories {
    public static final String template          = "package ${repositoryPackageName};\n" +
                                                   "\n" +
                                                   "import ${entityClass};\n" +
                                                   "import org.springframework.data.jpa.repository.JpaRepository;\n" +
                                                   "import org.springframework.stereotype.Repository;\n" +
                                                   "\n" +
                                                   "/**\n" +
                                                   " * ${entityName} repository.\n" +
                                                   " * ${separator}\n" +
                                                   " * \n" +
                                                   " * Repository for the ${entityName} entity.\n" +
                                                   " * \n" +
                                                   " * @author Manulaiko <manulaiko@gmail.com>\n" +
                                                   " */\n" +
                                                   "@Repository\n" +
                                                   "public interface ${repositoryName} extends JpaRepository<${entityClassName}, Integer> {\n" +
                                                   "}\n";
    public static final String basePackage       = "com.kalaazu.persistence";
    public static final String entityPackage     = basePackage + ".entity";
    public static final String repositoryPackage = basePackage + ".repository";

    public static void main(String[] args) {
        var reflections = new Reflections(entityPackage);
        reflections.getTypesAnnotatedWith(Entity.class)
                   .forEach(GenerateRepositories::generateContent);
    }

    public static void generateContent(Class<?> c) {
        var entityClassName = c.getSimpleName();
        var entityClass     = c.getName();
        var entityName      = entityClassName.replace("Entity", "");

        var repositoryPackageName = c.getPackage()
                                     .getName()
                                     .replace(entityPackage, repositoryPackage);

        var className = entityClassName.replace("Entity", "Repository");

        var packageLocation = Path.of(
                "Persistence/src/main/java/" + repositoryPackageName.replaceAll("\\.", "/")
        );


        var file = packageLocation.resolve(className + ".java")
                                  .toFile();

        var separator = "=".repeat(entityName.length() + 12);

        var content = template.replaceAll("\\$\\{repositoryPackageName}", repositoryPackageName)
                              .replaceAll("\\$\\{entityClassName}", entityClassName)
                              .replaceAll("\\$\\{separator}", separator)
                              .replaceAll("\\$\\{entityName}", entityName)
                              .replaceAll("\\$\\{entityClass}", entityClass)
                              .replaceAll("\\$\\{repositoryName}", className);

        try {
            if (!file.exists() && !file.createNewFile()) {
                System.out.println("Couldn't generate " + file.getAbsolutePath());
                return;
            }

            var writer = new FileWriter(file.getAbsolutePath());

            writer.write(content);
            writer.flush();
            writer.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
