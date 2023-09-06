package starling.events
{
   public class EnterFrameEvent extends Event
   {
      
      public static const ENTER_FRAME:String = "enterFrame";
       
      
      public function EnterFrameEvent(param1:String, param2:Number, param3:Boolean = false)
      {
         super(param1,param3,param2);
      }
      
      public function get passedTime() : Number
      {
         return data as Number;
      }
   }
}
