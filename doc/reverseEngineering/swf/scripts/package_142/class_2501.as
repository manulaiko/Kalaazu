package package_142
{
   import flash.display.DisplayObjectContainer;
   import flash.events.MouseEvent;
   
   public class class_2501 extends class_970
   {
       
      
      protected var var_582:Boolean = false;
      
      public function class_2501(param1:DisplayObjectContainer)
      {
         super(param1);
      }
      
      public function toggle() : void
      {
         this.var_582 = !this.var_582;
         selected = this.var_582;
      }
      
      override protected function clickHandler(param1:MouseEvent) : void
      {
         this.toggle();
      }
      
      public function get checked() : Boolean
      {
         return this.var_582;
      }
   }
}
