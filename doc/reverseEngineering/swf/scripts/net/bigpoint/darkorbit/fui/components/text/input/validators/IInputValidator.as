package net.bigpoint.darkorbit.fui.components.text.input.validators {

public interface IInputValidator {


    function isValid(): Boolean;

    function validate(): Boolean;

    function set source(param1: Object): void;

    function get source(): Object;

    function dispose(): void;
}
}
