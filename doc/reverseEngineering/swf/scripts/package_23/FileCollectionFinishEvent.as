package package_23
{
   import flash.events.Event;
   import package_11.class_38;
   
   public class FileCollectionFinishEvent extends Event
   {
      
      public static const FILE_FINISH:String = "FileCollectionFinishEvent.FILE_FINISH";
       
      
      public var finisher:class_38;
      
      public function FileCollectionFinishEvent(param1:String, param2:class_38)
      {
         this.finisher = param2;
         super(param1,false,false);
      }
   }
}
