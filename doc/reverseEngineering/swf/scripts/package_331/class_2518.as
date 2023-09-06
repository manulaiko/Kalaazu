package package_331
{
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.gui.windows.class_57;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.AsyncCommand;
   import package_27.class_82;
   import package_396.TeamDeathMatchLobbywindowProxy;
   import package_47.TeamDeathMatchLobbywindowMediator;
   import package_47.class_135;
   
   public class class_2518 extends AsyncCommand
   {
       
      
      public function class_2518()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         super.execute(param1);
         var _loc2_:TeamDeathMatchLobbywindowProxy = facade.retrieveProxy(TeamDeathMatchLobbywindowProxy.NAME) as TeamDeathMatchLobbywindowProxy;
         if(_loc2_.method_1454())
         {
            _loc3_ = class_57.getInstance().method_4369(class_57.const_378) as class_135;
            if(_loc3_ == null)
            {
               _loc3_ = class_57.getInstance().createWindow(class_57.const_378,class_57.const_729) as class_135;
               if(_loc3_.visible)
               {
                  class_82.playSoundEffect(class_126.const_1856);
               }
            }
            (_loc4_ = facade.retrieveMediator(TeamDeathMatchLobbywindowMediator.NAME) as TeamDeathMatchLobbywindowMediator).method_3297(_loc3_,this.method_3782);
         }
      }
      
      protected function method_3782() : void
      {
         var _loc1_:TeamDeathMatchLobbywindowProxy = facade.retrieveProxy(TeamDeathMatchLobbywindowProxy.NAME) as TeamDeathMatchLobbywindowProxy;
         _loc1_.method_5444();
      }
   }
}
