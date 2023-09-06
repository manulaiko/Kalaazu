package net.bigpoint.darkorbit.fui.system.loader.parser
{
   public class XMLLibraryParser implements IUILoaderLibParser
   {
       
      
      public function XMLLibraryParser()
      {
         super();
      }
      
      public function parseLibs(param1:Object) : Vector.<String>
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc2_:Vector.<String> = new Vector.<String>();
         var _loc3_:XMLList = (param1 as XML).children();
         for each(_loc4_ in _loc3_)
         {
            if(String(_loc4_.name()).toLowerCase() == "libraries")
            {
               for each(_loc5_ in _loc4_.children())
               {
                  for each(_loc6_ in _loc5_.attribute("id"))
                  {
                     _loc2_.push(_loc6_.valueOf());
                  }
               }
            }
         }
         return _loc2_;
      }
   }
}
