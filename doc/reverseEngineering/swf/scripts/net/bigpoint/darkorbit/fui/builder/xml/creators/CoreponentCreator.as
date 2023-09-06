package net.bigpoint.darkorbit.fui.builder.xml.creators
{
   import net.bigpoint.darkorbit.fui.components.core.Coreponent;
   import net.bigpoint.darkorbit.fui.components.core.ICoreponent;
   
   public class CoreponentCreator extends AbstractCreator
   {
       
      
      public function CoreponentCreator()
      {
         super();
      }
      
      public function create(param1:XML) : ICoreponent
      {
         var _loc2_:ICoreponent = new Coreponent();
         mapXMLNodeAttributes(_loc2_,param1);
         return _loc2_;
      }
   }
}
