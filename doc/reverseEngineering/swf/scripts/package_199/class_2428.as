package package_199
{
   import flash.events.Event;
   import package_294.class_2425;
   
   public class class_2428 extends Event
   {
      
      public static const const_1195:String = "SubGeometryAdded";
      
      public static const const_2516:String = "SubGeometryRemoved";
      
      public static const const_125:String = "BoundsInvalid";
       
      
      private var var_2331:class_2425;
      
      public function class_2428(param1:String, param2:class_2425 = null)
      {
         super(param1,false,false);
         this.var_2331 = param2;
      }
      
      public function get subGeometry() : class_2425
      {
         return this.var_2331;
      }
      
      override public function clone() : Event
      {
         return new class_2428(type,this.var_2331);
      }
   }
}
