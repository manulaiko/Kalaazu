package package_124
{
   import net.bigpoint.darkorbit.class_81;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_38.class_432;
   import package_38.class_493;
   import package_38.class_765;
   import package_44.GroupSystemNotification;
   
   public class class_1332 extends SimpleCommand
   {
       
      
      public function class_1332()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         super.execute(param1);
         var _loc2_:Vector.<class_432> = (param1.getBody() as class_765).updates;
         var _loc3_:int = _loc2_.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            this.method_2835(_loc2_[_loc4_]);
            _loc4_++;
         }
      }
      
      private function method_2835(param1:class_432) : void
      {
         var _loc2_:Boolean = false;
         switch(param1.method_1330())
         {
            case class_493.ID:
               _loc2_ = !_loc2_ && class_81.var_3592 != (param1 as class_493).var_3867 ? true : _loc2_;
               class_81.var_3592 = (param1 as class_493).var_3867;
         }
         if(_loc2_)
         {
            sendNotification(GroupSystemNotification.RELATED_DATA_CHANGED);
         }
      }
   }
}
