package package_315
{
   import net.bigpoint.darkorbit.class_126;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_27.class_82;
   import package_38.class_595;
   
   public class class_1788 extends SimpleCommand
   {
       
      
      public function class_1788()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         super.execute(param1);
         var _loc2_:int = 0;
         var _loc3_:class_595 = param1.getBody() as class_595;
         if(_loc3_)
         {
            if(_loc3_.var_3770.name_92)
            {
               _loc2_ = int(_loc3_.var_3770.name_137);
            }
         }
         class_82.playSoundEffect(_loc2_);
      }
   }
}
