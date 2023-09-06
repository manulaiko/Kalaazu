package package_231
{
   import com.bigpoint.utils.class_73;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_328.JackpotBattleNotification;
   import package_38.class_881;
   
   public class class_1337 extends SimpleCommand
   {
       
      
      public function class_1337()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         super.execute(param1);
         var _loc2_:class_881 = param1.getBody() as class_881;
         var _loc3_:class_73 = new class_73(_loc2_.var_1790,_loc2_.var_3301);
         sendNotification(JackpotBattleNotification.UPDATE_REMAINING_PLAYER,_loc3_);
      }
   }
}
