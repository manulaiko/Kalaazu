package package_199
{
   import flash.events.Event;
   import package_305.class_1767;
   
   public class class_2153 extends Event
   {
      
      public static const const_1507:String = "lensChanged";
       
      
      private var var_116:class_1767;
      
      public function class_2153(param1:String, param2:class_1767, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.var_116 = param2;
      }
      
      public function get camera() : class_1767
      {
         return this.var_116;
      }
      
      override public function clone() : Event
      {
         return new class_2153(type,this.var_116,bubbles,cancelable);
      }
   }
}
