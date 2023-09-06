package package_124
{
   import net.bigpoint.darkorbit.map.model.class_90;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_38.class_896;
   import package_9.class_50;
   
   public class class_1289 extends SimpleCommand
   {
       
      
      public function class_1289()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:class_896 = param1.getBody() as class_896;
         var _loc3_:class_90 = class_50.getInstance().map;
         if(_loc3_)
         {
            _loc3_.method_3420(_loc2_.hash);
         }
      }
   }
}
