package net.bigpoint.darkorbit.fui.builder.xml.creators
{
   import net.bigpoint.darkorbit.fui.UISystem;
   import net.bigpoint.darkorbit.fui.system.manager.IMouseManager;
   
   public class MouseCursorCreator
   {
      
      private static const ATTRIBUTENAME_CURSOR_ID:String = "cursorID";
      
      private static const ATTRIBUTENAME_CURSOR_OFFSET_X:String = "offsetX";
      
      private static const ATTRIBUTENAME_CURSOR_OFFSET_Y:String = "offsetY";
       
      
      public function MouseCursorCreator()
      {
         super();
      }
      
      public function create(param1:XML) : void
      {
         var _loc7_:* = null;
         var _loc2_:String = param1.attribute(ATTRIBUTENAME_CURSOR_ID);
         var _loc3_:String = param1.attribute(AbstractCreator.ATTRIBUTENAME_LIBRARY);
         var _loc4_:String = param1.attribute(AbstractCreator.ATTRIBUTENAME_LIBRARYID);
         var _loc5_:Number = Number(param1.attribute(ATTRIBUTENAME_CURSOR_OFFSET_X));
         var _loc6_:Number = Number(param1.attribute(ATTRIBUTENAME_CURSOR_OFFSET_Y));
         if(Boolean(_loc2_) && Boolean(_loc3_) && Boolean(_loc4_))
         {
            (_loc7_ = UISystem.getInstance().mouseManager).registerMouseCursorViaReskey(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_);
         }
         else
         {
            UISystem.log("To register a mouse cursor you have to specify at least the following parameters= {cursorID, library, libraryID} ",UISystem.LOG_LEVEL_WARN);
         }
      }
   }
}
