package package_318
{
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.class_81;
   import net.bigpoint.darkorbit.mvc.gui.abstract.model.DOAbstractProxy;
   import package_317.DominationNotificationNames;
   import package_393.class_2267;
   import package_393.class_2268;
   
   public class class_1796 extends DOAbstractProxy
   {
      
      public static const NAME:String = "";
       
      
      public function class_1796()
      {
         super(NAME,new class_2268());
      }
      
      private function get model() : class_2268
      {
         return this.data as class_2268;
      }
      
      public function method_6297(param1:Number, param2:Number, param3:Number, param4:int, param5:int, param6:int) : void
      {
         this.model.name_107 = param1;
         this.model.name_139 = param2;
         this.model.name_27 = param3;
         this.model.method_644.mmo = param4;
         this.model.method_644.eic = param5;
         this.model.method_644.vru = param6;
         this.method_3971();
         this.updateView();
      }
      
      private function method_3971() : void
      {
         this.model.list.sort(this.method_1356);
      }
      
      private function method_1356(param1:class_2267, param2:class_2267) : int
      {
         var _loc3_:String = class_126.instance.method_1709[class_81.factionID];
         if(param1.faction == _loc3_)
         {
            return -1;
         }
         if(param2.faction == _loc3_)
         {
            return 1;
         }
         return Number(param2.score) - Number(param1.score);
      }
      
      public function updateView() : void
      {
         sendNotification(DominationNotificationNames.UPDATE_VIEW,this.model);
      }
   }
}
