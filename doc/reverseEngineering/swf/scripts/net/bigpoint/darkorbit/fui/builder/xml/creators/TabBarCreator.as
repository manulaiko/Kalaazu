package net.bigpoint.darkorbit.fui.builder.xml.creators
{
   import net.bigpoint.darkorbit.fui.components.bars.TabBar;
   import net.bigpoint.darkorbit.fui.components.core.ICoreponent;
   
   public class TabBarCreator extends AbstractCreator
   {
       
      
      public function TabBarCreator()
      {
         super();
      }
      
      public function create(param1:XML) : ICoreponent
      {
         var _loc2_:TabBar = new TabBar();
         mapXMLNodeAttributes(_loc2_,param1);
         _loc2_.parseTextKeys(param1.attribute("localizedTexts"));
         return _loc2_;
      }
   }
}
