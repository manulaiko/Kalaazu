package package_76
{
   import net.bigpoint.darkorbit.class_81;
   import package_28.EventStreamClient;
   
   public class class_300
   {
       
      
      public function class_300()
      {
         super();
      }
      
      public static function track() : void
      {
         var _loc1_:* = null;
         if(false)
         {
            _loc1_ = new Error().getStackTrace();
            EventStreamClient.track("flash_error_stack",{"stack":_loc1_});
         }
      }
   }
}
