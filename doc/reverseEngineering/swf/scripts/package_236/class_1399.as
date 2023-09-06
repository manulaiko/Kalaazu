package package_236
{
   import net.bigpoint.darkorbit.class_9;
   import net.bigpoint.darkorbit.settings.Settings;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_29.class_85;
   import package_38.class_616;
   import package_45.class_366;
   import package_9.class_50;
   
   public class class_1399 extends SimpleCommand
   {
       
      
      public function class_1399()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:class_616 = param1.getBody() as class_616;
         var _loc3_:class_85 = class_50.getInstance().map.method_327(_loc2_.var_5014);
         if(_loc3_)
         {
            (_loc3_ as class_366).jump(10);
         }
         class_9.var_1028 = true;
         Settings.nextMapID = _loc2_.mapId;
      }
   }
}
