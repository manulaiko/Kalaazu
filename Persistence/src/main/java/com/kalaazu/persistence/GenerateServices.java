package com.kalaazu.persistence;

import org.reflections.Reflections;

import javax.persistence.Entity;
import java.io.FileWriter;
import java.nio.file.Path;

/**
 * Generate repositories services.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class GenerateServices {
    public static final String basePackage       = "com.kalaazu.persistence";
    public static final String entityPackage     = basePackage + ".entity";
    public static final String repositoryPackage = basePackage + ".repository";
    public static final String servicePackage    = basePackage + ".service";

    public static final String interfaceTemplate = "package ${servicePackageName};\n" +
                                                   "\n" +
                                                   "import ${entityClass};\n" +
                                                   "\n" +
                                                   "/**\n" +
                                                   " * ${entityName} service.\n" +
                                                   " * ${separator}\n" +
                                                   " *\n" +
                                                   " * Service for the ${entityName} entity.\n" +
                                                   " *\n" +
                                                   " * @author Manulaiko <manulaiko@gmail.com>\n" +
                                                   " */\n" +
                                                   "public interface ${serviceClassName} extends IService<${entityClassName}, Integer> {\n" +
                                                   "}\n";

    public static final String serviceTemplate = "package ${servicePackageName};\n" +
                                                 "\n" +
                                                 "import ${entityClass};\n" +
                                                 "import ${repositoryClass};\n" +
                                                 "import org.springframework.beans.factory.annotation.Autowired;\n" +
                                                 "import org.springframework.stereotype.Service;\n" +
                                                 "\n" +
                                                 "import java.util.List;\n" +
                                                 "\n" +
                                                 "/**\n" +
                                                 " * ${entityName} service.\n" +
                                                 " * ${separator}\n" +
                                                 " *\n" +
                                                 " * Service for the ${entityName} entity.\n" +
                                                 " *\n" +
                                                 " * @author Manulaiko <manulaiko@gmail.com>\n" +
                                                 " */\n" +
                                                 "@Service\n" +
                                                 "public class ${serviceClassName}Impl implements ${serviceClassName} {\n" +
                                                 "    @Autowired\n" +
                                                 "    private ${repositoryClassName} repository;\n" +
                                                 "\n" +
                                                 "    /**\n" +
                                                 "     * @inheritDoc\n" +
                                                 "     */\n" +
                                                 "    @Override\n" +
                                                 "    public ${entityClassName} create(${entityClassName} entity) {\n" +
                                                 "        return this.repository.save(entity);\n" +
                                                 "    }\n" +
                                                 "\n" +
                                                 "    /**\n" +
                                                 "     * @inheritDoc\n" +
                                                 "     */\n" +
                                                 "    @Override\n" +
                                                 "    public ${entityClassName} find(Integer id) {\n" +
                                                 "        return this.repository.findById(id).orElse(null);\n" +
                                                 "    }\n" +
                                                 "\n" +
                                                 "    /**\n" +
                                                 "     * @inheritDoc\n" +
                                                 "     */\n" +
                                                 "    @Override\n" +
                                                 "    public List<${entityClassName}> findAll() {\n" +
                                                 "        return this.repository.findAll();\n" +
                                                 "    }\n" +
                                                 "\n" +
                                                 "    /**\n" +
                                                 "     * @inheritDoc\n" +
                                                 "     */\n" +
                                                 "    @Override\n" +
                                                 "    public ${entityClassName} update(${entityClassName} entity) {\n" +
                                                 "        return this.repository.save(entity);\n" +
                                                 "    }\n" +
                                                 "\n" +
                                                 "    /**\n" +
                                                 "     * @inheritDoc\n" +
                                                 "     */\n" +
                                                 "    @Override\n" +
                                                 "    public boolean delete(Integer id) {\n" +
                                                 "        this.repository.deleteById(id);\n" +
                                                 "\n" +
                                                 "        return !this.repository.existsById(id);\n" +
                                                 "    }\n" +
                                                 "}";

    public static void main(String[] args) {
        var reflections = new Reflections(entityPackage);
        reflections.getTypesAnnotatedWith(Entity.class)
                   .forEach(GenerateServices::generateContent);
    }

    public static void generateContent(Class<?> c) {
        var entityClassName = c.getSimpleName();
        var entityClass     = c.getName();
        var entityName      = entityClassName.replace("Entity", "");

        var repositoryClassName = entityClassName.replace("Entity", "Repository");
        var serviceClassName    = entityClassName.replace("Entity", "Service");
        var repositoryClass     = entityClass.replace("Entity", "Repository")
                                             .replace(entityPackage, repositoryPackage);

        var packageLocation = Path.of(
                "Persistence/src/main/java/" + servicePackage.replaceAll("\\.", "/")
        );


        var interfaceFile = packageLocation.resolve(serviceClassName + ".java")
                                           .toFile();

        var implFile = packageLocation.resolve(serviceClassName + "Impl.java")
                                      .toFile();

        var separator = "=".repeat(entityName.length() + 12);

        var interfaceContent = interfaceTemplate.replaceAll("\\$\\{servicePackageName}", servicePackage)
                                                .replaceAll("\\$\\{serviceClassName}", serviceClassName)
                                                .replaceAll("\\$\\{entityClassName}", entityClassName)
                                                .replaceAll("\\$\\{separator}", separator)
                                                .replaceAll("\\$\\{entityName}", entityName)
                                                .replaceAll("\\$\\{entityClass}", entityClass);

        var implContent = serviceTemplate.replaceAll("\\$\\{servicePackageName}", servicePackage)
                                         .replaceAll("\\$\\{serviceClassName}", serviceClassName)
                                         .replaceAll("\\$\\{entityClassName}", entityClassName)
                                         .replaceAll("\\$\\{separator}", separator)
                                         .replaceAll("\\$\\{entityName}", entityName)
                                         .replaceAll("\\$\\{repositoryClass}", repositoryClass)
                                         .replaceAll("\\$\\{repositoryClassName}", repositoryClassName)
                                         .replaceAll("\\$\\{entityClass}", entityClass);

        try {
            if (!interfaceFile.exists() && !interfaceFile.createNewFile()) {
                System.out.println("Couldn't generate " + interfaceFile.getAbsolutePath());
                return;
            }

            var interfaceWriter = new FileWriter(interfaceFile.getAbsolutePath());

            interfaceWriter.write(interfaceContent);
            interfaceWriter.flush();
            interfaceWriter.close();

            if (!implFile.exists() && !implFile.createNewFile()) {
                System.out.println("Couldn't generate " + implFile.getAbsolutePath());
                return;
            }

            var implWriter = new FileWriter(implFile.getAbsolutePath());

            implWriter.write(implContent);
            implWriter.flush();
            implWriter.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
