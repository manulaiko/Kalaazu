package package_316
{
   import flash.utils.Dictionary;
   import net.bigpoint.darkorbit.mvc.hintSystem.model.class_2260;
   import net.bigpoint.darkorbit.mvc.hintSystem.model.class_2264;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_38.class_672;
   import package_38.class_806;
   import package_392.class_2265;
   
   public class class_1798 extends SimpleCommand
   {
       
      
      public function class_1798()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc7_:* = null;
         var _loc8_:* = 0;
         var _loc9_:* = null;
         super.execute(param1);
         var _loc2_:class_806 = param1.getBody() as class_806;
         var _loc3_:class_2260 = facade.retrieveProxy(class_2260.NAME) as class_2260;
         var _loc4_:uint = uint(_loc2_.windows.length);
         var _loc5_:Dictionary = new Dictionary();
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc8_ = uint((_loc7_ = _loc2_.windows[_loc6_] as class_672).content);
            _loc9_ = class_2264.method_473(_loc8_);
            _loc5_[_loc8_] = _loc9_;
            _loc6_++;
         }
         _loc3_.windows = _loc5_;
      }
   }
}
