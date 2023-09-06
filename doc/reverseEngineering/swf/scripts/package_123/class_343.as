package package_123
{
   import flash.events.Event;
   
   public class class_343 extends Event
   {
      
      public static const SET_SELECTED:String = "SET_SELECTED";
      
      public static const LOGOUT:String = "LOGOUT";
      
      public static const REPAIR:String = "REPAIR";
      
      public static const OPEN_PROFILE_PAGE:String = "OPEN_PROFILE_PAGE";
       
      
      public var var_702:int;
      
      public function class_343(param1:String, param2:int = 0, param3:Boolean = false, param4:Boolean = false)
      {
         this.var_702 = param2;
         super(param1,param3,param4);
      }
   }
}
