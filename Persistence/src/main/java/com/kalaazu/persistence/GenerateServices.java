package com.kalaazu.persistence;

import jakarta.persistence.Entity;
import org.reflections.Reflections;

import java.io.FileWriter;
import java.nio.file.Path;

/**
 * Generate repositories services.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class GenerateServices {
    public static final String basePackage = "com.kalaazu.persistence";
    public static final String entityPackage = basePackage + ".entity";
    public static final String repositoryPackage = basePackage + ".repository";
    public static final String servicePackage = basePackage + ".service";

    public static final String interfaceTemplate = """
            package ${servicePackageName};

            import ${entityClass};

            /**
             * ${entityName} service.
             * ${separator}
             *
             * Service for the ${entityName} entity.
             *
             * @author Manulaiko <manulaiko@gmail.com>
             */
            public interface ${serviceClassName} extends IService<${entityClassName}, Integer> {
            }
            """;

    public static final String serviceTemplate = """
            package ${servicePackageName};

            import ${entityClass};
            import ${repositoryClass};
            import org.springframework.beans.factory.annotation.Autowired;
            import org.springframework.stereotype.Service;

            import java.util.List;

            /**
             * ${entityName} service.
             * ${separator}
             *
             * Service for the ${entityName} entity.
             *
             * @author Manulaiko <manulaiko@gmail.com>
             */
            @Service
            public class ${serviceClassName}Impl implements ${serviceClassName} {
                @Autowired
                private ${repositoryClassName} repository;

                /**
                 * @inheritDoc
                 */
                @Override
                public ${entityClassName} create(${entityClassName} entity) {
                    return this.repository.save(entity);
                }

                /**
                 * @inheritDoc
                 */
                @Override
                public ${entityClassName} find(Integer id) {
                    return this.repository.findById(id).orElse(null);
                }

                /**
                 * @inheritDoc
                 */
                @Override
                public List<${entityClassName}> findAll() {
                    return this.repository.findAll();
                }

                /**
                 * @inheritDoc
                 */
                @Override
                public ${entityClassName} update(${entityClassName} entity) {
                    return this.repository.save(entity);
                }

                /**
                 * @inheritDoc
                 */
                @Override
                public boolean delete(Integer id) {
                    this.repository.deleteById(id);

                    return !this.repository.existsById(id);
                }
            }""";

    public static void main(String[] args) {
        var reflections = new Reflections(entityPackage);
        reflections.getTypesAnnotatedWith(Entity.class)
                .forEach(GenerateServices::generateContent);
    }

    public static void generateContent(Class<?> c) {
        var entityClassName = c.getSimpleName();
        var entityClass = c.getName();
        var entityName = entityClassName.replace("Entity", "");

        var repositoryClassName = entityClassName.replace("Entity", "Repository");
        var serviceClassName = entityClassName.replace("Entity", "Service");
        var repositoryClass = entityClass.replace("Entity", "Repository")
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
