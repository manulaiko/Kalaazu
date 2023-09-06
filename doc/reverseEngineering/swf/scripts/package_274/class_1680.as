package package_274
{
   import org.puremvc.as3.multicore.interfaces.ICommand;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_135.class_391;
   import package_350.class_1984;
   import package_351.SectorControlProgressBarMediator;
   
   public class class_1680 extends SimpleCommand implements ICommand
   {
       
      
      public function class_1680()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         super.execute(param1);
         facade.registerCommand(class_391.const_2383,class_1986);
         facade.registerCommand(class_391.INIT,class_1987);
         if(!facade.hasMediator(SectorControlProgressBarMediator.NAME))
         {
            _loc3_ = new class_1984();
            _loc2_ = new SectorControlProgressBarMediator(_loc3_);
            facade.registerMediator(_loc2_);
            facade.registerCommand(class_391.const_613,class_1988);
            facade.registerCommand(class_391.const_1421,class_1985);
         }
      }
   }
}
