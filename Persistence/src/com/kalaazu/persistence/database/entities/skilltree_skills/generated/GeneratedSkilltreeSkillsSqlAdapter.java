package com.kalaazu.persistence.database.entities.skilltree_skills.generated;

import com.kalaazu.persistence.database.entities.SkilltreeSkills;
import com.kalaazu.persistence.database.entities.skilltree_skills.SkilltreeSkillsImpl;
import com.kalaazu.persistence.database.mappers.SkillType;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.common.injector.annotation.ExecuteBefore;
import com.speedment.common.injector.annotation.WithState;
import com.speedment.runtime.config.Project;
import com.speedment.runtime.config.identifier.TableIdentifier;
import com.speedment.runtime.core.component.ProjectComponent;
import com.speedment.runtime.core.component.sql.SqlPersistenceComponent;
import com.speedment.runtime.core.component.sql.SqlStreamSupplierComponent;
import com.speedment.runtime.core.component.sql.SqlTypeMapperHelper;
import com.speedment.runtime.core.exception.SpeedmentException;

import java.sql.ResultSet;
import java.sql.SQLException;

import static com.speedment.common.injector.State.RESOLVED;

/**
 * The generated Sql Adapter for a {@link
 * SkilltreeSkills}
 * entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 *
 * @author Speedment
 */
@GeneratedCode("Speedment")
public abstract class GeneratedSkilltreeSkillsSqlAdapter {

    private final TableIdentifier<SkilltreeSkills>      tableIdentifier;

    private       SqlTypeMapperHelper<Byte, SkillType>  typeHelper;

    private       SqlTypeMapperHelper<Integer, Boolean> isAdvancedHelper;

    protected GeneratedSkilltreeSkillsSqlAdapter() {
        this.tableIdentifier = TableIdentifier.of("kalaazu", "kalaazu", "skilltree_skills");
    }

    @ExecuteBefore(RESOLVED)
    void installMethodName(
            @WithState(RESOLVED) SqlStreamSupplierComponent streamSupplierComponent,
            @WithState(RESOLVED) SqlPersistenceComponent persistenceComponent
    ) {
        streamSupplierComponent.install(tableIdentifier, this::apply);
        persistenceComponent.install(tableIdentifier);
    }

    protected SkilltreeSkills apply(ResultSet resultSet) throws SpeedmentException {
        final SkilltreeSkills entity = createEntity();
        try {
            entity.setId(resultSet.getByte(1));
            entity.setName(resultSet.getString(2));
            entity.setDescription(resultSet.getString(3));
            entity.setType(typeHelper.apply(resultSet.getByte(4)));
            entity.setIsAdvanced(isAdvancedHelper.apply(resultSet.getInt(5)));
            entity.setBonusType(resultSet.getString(6));
            entity.setBonusAmount(resultSet.getInt(7));
            entity.setBonusFactor(resultSet.getByte(8));
        } catch (final SQLException sqle) {
            throw new SpeedmentException(sqle);
        }
        return entity;
    }

    protected SkilltreeSkillsImpl createEntity() {
        return new SkilltreeSkillsImpl();
    }

    @ExecuteBefore(RESOLVED)
    void createHelpers(ProjectComponent projectComponent) {
        final Project project = projectComponent.getProject();
        typeHelper = SqlTypeMapperHelper.create(project, SkilltreeSkills.TYPE, SkilltreeSkills.class);
        isAdvancedHelper = SqlTypeMapperHelper.create(project, SkilltreeSkills.IS_ADVANCED, SkilltreeSkills.class);
    }
}