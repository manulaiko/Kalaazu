package package_124
{
   import net.bigpoint.darkorbit.map.model.class_90;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_38.class_684;
   import package_69.class_180;
   import package_9.class_50;
   
   public class class_1423 extends SimpleCommand
   {
       
      
      public function class_1423()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc4_:* = null;
         var _loc2_:class_684 = param1.getBody() as class_684;
         var _loc3_:class_90 = class_50.getInstance().map;
         if(_loc3_)
         {
            if(_loc4_ = _loc3_.method_3454(_loc2_.hash) as class_180)
            {
               if(_loc2_.name_43)
               {
                  _loc4_.collect();
               }
               _loc3_.removeEntity(_loc4_);
            }
         }
      }
   }
}
