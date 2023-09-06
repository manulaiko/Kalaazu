package package_407
{
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_81;
   import org.puremvc.as3.multicore.interfaces.IMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_184.class_1654;
   import package_257.class_1970;
   import package_258.class_1655;
   import package_31.class_92;
   import package_76.class_215;
   
   public class TraininggroundsResultsWindowMediator extends class_92 implements IMediator
   {
      
      public static const NAME:String = "TraininggroundsResultsWindowMediator";
       
      
      public function TraininggroundsResultsWindowMediator(param1:String, param2:Object)
      {
         super(param1,param2);
         method_2176(class_1655.const_51,this.method_808);
         this.addEventListeners();
      }
      
      private function addEventListeners() : void
      {
         if(!this.view)
         {
            return;
         }
         this.view.addEventListener(class_2540.RESULTS_CLOSED,this.method_5651);
      }
      
      private function removeEventListeners() : void
      {
         if(!this.view)
         {
            return;
         }
         this.view.removeEventListener(class_2540.RESULTS_CLOSED,this.method_5651);
      }
      
      private function get view() : class_2303
      {
         return viewComponent as class_2303;
      }
      
      private function method_808(param1:INotification) : void
      {
         var _loc2_:class_1654 = param1.getBody() as class_1654;
         var _loc3_:Vector.<String> = new Vector.<String>();
         var _loc4_:Vector.<Vector.<String>> = new Vector.<Vector.<String>>();
         var _loc5_:Vector.<String> = new Vector.<String>();
         var _loc6_:Vector.<String> = new Vector.<String>();
         _loc5_.push(class_88.getItem("label_traininggrounds_results_stats_rounds_won"));
         _loc6_.push(class_88.getItem("label_traininggrounds_results_stats_ta_score"));
         if(_loc2_.method_2733 == class_1654.const_2032)
         {
            _loc3_.push(class_81.name_148,_loc2_.name_158);
            _loc5_.push(_loc2_.method_3326.toString());
            _loc5_.push(_loc2_.method_4396.toString());
            _loc6_.push(_loc2_.method_6194.toString());
            _loc6_.push(_loc2_.method_277.toString());
         }
         else
         {
            _loc3_.push(_loc2_.name_158,class_81.name_148);
            _loc5_.push(_loc2_.method_4396.toString());
            _loc5_.push(_loc2_.method_3326.toString());
            _loc6_.push(_loc2_.method_277.toString());
            _loc6_.push(_loc2_.method_6194.toString());
         }
         _loc4_.push(_loc5_);
         _loc4_.push(_loc6_);
         this.view.method_5936(_loc2_.method_2733,_loc3_,_loc4_,_loc2_.rewards);
      }
      
      private function method_5651(param1:class_2540) : void
      {
         facade.registerCommand(class_1655.CREATE_WINDOW,class_1970);
         facade.removeMediator(getMediatorName());
         class_215.method_5129(this.view);
      }
      
      override public function onRemove() : void
      {
         this.removeEventListeners();
         super.onRemove();
      }
   }
}
