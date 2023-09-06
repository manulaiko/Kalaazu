package package_221
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_139.class_1154;
   import package_139.class_1156;
   import package_220.class_1270;
   import package_38.class_592;
   
   public class class_1275 extends class_1270
   {
       
      
      public function class_1275()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:class_592 = param1.getBody() as class_592;
         var _loc3_:class_1154 = new class_1154();
         var _loc4_:class_1156;
         (_loc4_ = new class_1156()).init(_loc2_.var_5058,_loc2_.name_82);
         _loc4_.var_4179.var_4184 = _loc2_.var_3369.var_2971;
         _loc3_.method_4129(_loc4_);
         var _loc5_:class_1156;
         (_loc5_ = new class_1156()).init(_loc2_.var_3814,_loc2_.var_2438);
         _loc5_.var_4179.var_4184 = _loc2_.var_1155.var_2971;
         _loc3_.method_4443(_loc5_);
         method_2479.method_3001(_loc3_);
      }
   }
}
