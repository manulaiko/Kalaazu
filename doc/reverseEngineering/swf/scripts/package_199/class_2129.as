package package_199
{
   import flash.events.Event;
   import package_295.class_1752;
   
   public class class_2129 extends Event
   {
      
      public static const const_2610:String = "addedToScene";
      
      public static const const_1997:String = "removedFromScene";
      
      public static const const_244:String = "partitionChanged";
       
      
      public var var_4772:class_1752;
      
      public function class_2129(param1:String, param2:class_1752)
      {
         this.var_4772 = param2;
         super(param1);
      }
      
      override public function get target() : Object
      {
         return this.var_4772;
      }
      
      override public function clone() : Event
      {
         return new class_2129(type,this.var_4772);
      }
   }
}
