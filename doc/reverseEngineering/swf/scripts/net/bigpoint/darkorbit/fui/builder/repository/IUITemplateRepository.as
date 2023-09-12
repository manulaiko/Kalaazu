package net.bigpoint.darkorbit.fui.builder.repository {

public interface IUITemplateRepository {


    function addTemplate(param1: Object): void;

    function getTemplateByName(param1: String): Object;

    function getTemplateByReferenceNode(param1: Object): Object;

    function replaceWithTemplate(param1: Object): Object;
}
}
