package package_199
{
   import flash.events.Event;
   
   public class class_2391 extends Event
   {
      
      public static const const_2614:String = "castsShadowChange";
       
      
      public function class_2391(param1:String)
      {
         super(param1);
      }
      
      override public function clone() : Event
      {
         return new class_2391(type);
      }
   }
}
