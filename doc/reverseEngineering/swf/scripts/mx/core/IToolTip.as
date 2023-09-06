package mx.core
{
   import flash.geom.Rectangle;
   
   public interface IToolTip extends IUIComponent
   {
       
      
      function get screen() : Rectangle;
      
      function get text() : String;
      
      function set text(param1:String) : void;
   }
}
