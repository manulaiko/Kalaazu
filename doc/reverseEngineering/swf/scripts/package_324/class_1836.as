package package_324
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_38.class_519;
   import package_38.class_924;
   import package_396.TeamDeathMatchLobbywindowProxy;
   
   public class class_1836 extends SimpleCommand
   {
       
      
      public function class_1836()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc3_:* = null;
         super.execute(param1);
         var _loc2_:class_519 = param1.getBody() as class_519;
         _loc3_ = new class_924();
         _loc3_.name_119 = _loc2_.name_119;
         _loc3_.minLevel = _loc2_.minLevel;
         _loc3_.var_2830 = _loc2_.var_2830;
         _loc3_.var_1413 = _loc2_.var_1413;
         var _loc4_:TeamDeathMatchLobbywindowProxy;
         (_loc4_ = facade.retrieveProxy(TeamDeathMatchLobbywindowProxy.NAME) as TeamDeathMatchLobbywindowProxy).method_5353(_loc3_,false);
      }
   }
}
