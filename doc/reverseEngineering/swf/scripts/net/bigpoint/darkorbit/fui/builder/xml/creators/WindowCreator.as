package net.bigpoint.darkorbit.fui.builder.xml.creators
{
   import net.bigpoint.darkorbit.fui.components.core.ICoreponent;
   import net.bigpoint.darkorbit.fui.components.window.Window;
   
   public class WindowCreator extends AbstractCreator
   {
       
      
      public function WindowCreator()
      {
         super();
      }
      
      public function create(param1:XML) : ICoreponent
      {
         var _loc2_:Window = new Window();
         mapXMLNodeAttributes(_loc2_,param1);
         return _loc2_;
      }
   }
}
