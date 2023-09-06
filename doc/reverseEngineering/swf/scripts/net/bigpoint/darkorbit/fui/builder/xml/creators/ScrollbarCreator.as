package net.bigpoint.darkorbit.fui.builder.xml.creators
{
   import net.bigpoint.darkorbit.fui.components.core.ICoreponent;
   import net.bigpoint.darkorbit.fui.components.scroll.Scrollbar;
   
   public class ScrollbarCreator extends AbstractCreator
   {
       
      
      public function ScrollbarCreator()
      {
         super();
      }
      
      public function create(param1:XML) : ICoreponent
      {
         var _loc2_:Scrollbar = new Scrollbar();
         mapXMLNodeAttributes(_loc2_,param1);
         return _loc2_;
      }
   }
}
