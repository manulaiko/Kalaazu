package package_117
{
   import net.bigpoint.as3toolbox.bplocale.class_88;
   
   public class class_321 implements class_320
   {
      
      private static const const_456:String = "item";
      
      private static const const_28:String = "name";
       
      
      public function class_321()
      {
         super();
      }
      
      public function method_2367(param1:XML) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:XMLList = param1.elements(const_456);
         for each(_loc5_ in _loc2_)
         {
            _loc4_ = "";
            _loc3_ = _loc5_.attribute(const_28);
            if(_loc3_.length <= 0)
            {
               throw new Error("An item has no name. Check if the name attributes for all items in the file are set.");
            }
            if(_loc5_.hasSimpleContent())
            {
               _loc4_ = _loc5_.text();
               class_88.method_1639("",_loc3_,_loc4_);
            }
         }
      }
   }
}
