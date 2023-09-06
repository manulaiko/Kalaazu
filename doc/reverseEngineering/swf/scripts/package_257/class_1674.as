package package_257
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_184.TraininggroundsProxy;
   import package_258.class_1655;
   import package_258.class_1657;
   import package_332.EpicFightMessageProxy;
   import package_349.EpicFightMessageMediator;
   import package_349.class_1972;
   
   public class class_1674 extends SimpleCommand
   {
       
      
      public function class_1674()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         super.execute(param1);
         facade.registerProxy(new TraininggroundsProxy());
         facade.registerProxy(new EpicFightMessageProxy());
         facade.registerMediator(new EpicFightMessageMediator(EpicFightMessageMediator.NAME,new class_1972()));
         facade.registerCommand(class_1657.UPDATE_FIGHT_PHASE_INFO,class_1971);
         facade.registerCommand(class_1657.CREATE_WINDOW,class_1973);
         facade.registerCommand(class_1655.CREATE_WINDOW,class_1970);
      }
   }
}
