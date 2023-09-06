package package_95
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_329.class_1918;
   import package_329.class_1974;
   
   public class class_1678 extends SimpleCommand
   {
       
      
      public function class_1678()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerCommand(class_1918.UPDATE_QUEST_CONDITION_VIEW,class_1974);
      }
   }
}
