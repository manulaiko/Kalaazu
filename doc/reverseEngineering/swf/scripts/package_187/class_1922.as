package package_187
{
   import net.bigpoint.darkorbit.class_81;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_108.GroupProxy;
   import package_139.class_1934;
   
   public class class_1922 extends SimpleCommand
   {
       
      
      public function class_1922()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         super.execute(param1);
         var _loc2_:GroupProxy = facade.retrieveProxy(GroupProxy.NAME) as GroupProxy;
         var _loc3_:class_1934 = param1.getBody() as class_1934;
         if(_loc3_.type == class_1934.const_1933)
         {
            _loc2_.method_6350(_loc3_.name_128,class_81.userID);
         }
         else
         {
            _loc2_.method_6350(class_81.userID,_loc3_.name_128);
         }
      }
   }
}
