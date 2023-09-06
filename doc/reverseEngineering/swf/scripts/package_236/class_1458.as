package package_236
{
   import com.bigpoint.utils.class_73;
   import net.bigpoint.darkorbit.map.model.class_90;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_38.class_843;
   import package_45.class_366;
   import package_9.class_50;
   
   public class class_1458 extends SimpleCommand
   {
       
      
      public function class_1458()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:class_843 = param1.getBody() as class_843;
         var _loc3_:class_90 = class_50.getInstance().map;
         if(!_loc3_.method_327(_loc2_.var_5014))
         {
            _loc3_.method_4903(new class_366(_loc2_.var_5014,new class_73(_loc2_.x,_loc2_.y),_loc2_.name_164,_loc2_.var_4985,_loc2_.var_136));
         }
      }
   }
}
