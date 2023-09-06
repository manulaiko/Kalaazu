package package_275
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_330.VideoWindowNotification;
   
   public class class_1681 extends SimpleCommand
   {
       
      
      public function class_1681()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerCommand(VideoWindowNotification.const_177,class_1989);
         facade.registerCommand(VideoWindowNotification.const_12,class_1989);
         facade.registerCommand(VideoWindowNotification.const_480,class_1989);
      }
   }
}
