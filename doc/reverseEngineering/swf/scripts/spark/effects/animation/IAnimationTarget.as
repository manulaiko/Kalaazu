package spark.effects.animation {

public interface IAnimationTarget {


    function animationStart(param1: Animation): void;

    function animationStop(param1: Animation): void;

    function animationEnd(param1: Animation): void;

    function animationRepeat(param1: Animation): void;

    function animationUpdate(param1: Animation): void;
}
}
