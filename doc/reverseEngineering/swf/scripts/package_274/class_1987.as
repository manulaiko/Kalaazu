package package_274
{
   import org.puremvc.as3.multicore.interfaces.ICommand;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_135.class_391;
   import package_350.class_2305;
   import package_351.SectorControlUiMediator;
   
   public class class_1987 extends SimpleCommand implements ICommand
   {
       
      
      public function class_1987()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:Boolean = Boolean(this.method_491());
         if(_loc2_)
         {
            this.method_904();
         }
      }
      
      private function method_904() : void
      {
         facade.removeCommand(class_391.INIT);
      }
      
      private function method_491() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(!facade.hasMediator(SectorControlUiMediator.NAME))
         {
            _loc2_ = new class_2305();
            _loc1_ = new SectorControlUiMediator(_loc2_);
            facade.registerMediator(_loc1_);
            facade.registerCommand(class_391.const_1658,class_2308);
            facade.registerCommand(class_391.const_383,class_2309);
            facade.registerCommand(class_391.const_3291,class_2307);
            facade.registerCommand(class_391.RESET,class_2306);
            return false;
         }
         return true;
      }
   }
}
