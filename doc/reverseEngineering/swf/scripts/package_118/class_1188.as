package package_118
{
   import flash.utils.Dictionary;
   
   public class class_1188 extends class_1186
   {
       
      
      public function class_1188()
      {
         super();
      }
      
      override public function getText(param1:Dictionary) : String
      {
         var _loc2_:* = null;
         if(format == null)
         {
            throw new Error("DatePlaceholder " + name + " has no format defined.");
         }
         var _loc3_:* = param1[name];
         var _loc4_:Dictionary = new Dictionary();
         if(_loc3_ is Date)
         {
            _loc2_ = _loc3_;
         }
         else
         {
            _loc2_ = new Date(_loc3_);
         }
         _loc4_[class_1183.method_4279] = _loc2_.fullYear;
         _loc4_[class_1183.method_5537] = _loc2_.month;
         _loc4_[class_1183.method_5171] = _loc2_.date;
         _loc4_[class_1183.method_2952] = _loc2_.hours;
         _loc4_[class_1183.method_1933] = _loc2_.minutes;
         _loc4_[class_1183.method_2102] = _loc2_.seconds;
         _loc4_[class_1183.method_152] = _loc2_.milliseconds;
         return format.getText(_loc4_);
      }
   }
}
