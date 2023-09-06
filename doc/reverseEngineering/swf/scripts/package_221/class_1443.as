package package_221
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_25.class_272;
   import package_38.class_641;
   import package_84.class_243;
   
   public class class_1443 extends class_243
   {
       
      
      public function class_1443()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:class_641 = param1.getBody() as class_641;
         name_47.minimap.method_1759(new class_272(null,_loc2_.x,_loc2_.y,10));
      }
   }
}
