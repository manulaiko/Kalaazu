package mx.managers
{
   import flash.display.DisplayObject;
   import mx.core.IToolTip;
   import mx.core.IUIComponent;
   import mx.effects.IAbstractEffect;
   
   public interface IToolTipManager2
   {
       
      
      function get currentTarget() : DisplayObject;
      
      function set currentTarget(param1:DisplayObject) : void;
      
      function get currentToolTip() : IToolTip;
      
      function set currentToolTip(param1:IToolTip) : void;
      
      function get enabled() : Boolean;
      
      function set enabled(param1:Boolean) : void;
      
      function get hideDelay() : Number;
      
      function set hideDelay(param1:Number) : void;
      
      function get hideEffect() : IAbstractEffect;
      
      function set hideEffect(param1:IAbstractEffect) : void;
      
      function get scrubDelay() : Number;
      
      function set scrubDelay(param1:Number) : void;
      
      function get showDelay() : Number;
      
      function set showDelay(param1:Number) : void;
      
      function get showEffect() : IAbstractEffect;
      
      function set showEffect(param1:IAbstractEffect) : void;
      
      function get toolTipClass() : Class;
      
      function set toolTipClass(param1:Class) : void;
      
      function registerToolTip(param1:DisplayObject, param2:String, param3:String) : void;
      
      function registerErrorString(param1:DisplayObject, param2:String, param3:String) : void;
      
      function sizeTip(param1:IToolTip) : void;
      
      function createToolTip(param1:String, param2:Number, param3:Number, param4:String = null, param5:IUIComponent = null) : IToolTip;
      
      function destroyToolTip(param1:IToolTip) : void;
   }
}
