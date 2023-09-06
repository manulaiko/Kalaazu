package package_53
{
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_18;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   import package_189.class_1116;
   import package_85.class_244;
   import spark.components.Label;
   
   public class class_1115 extends Mediator implements class_997
   {
      
      public static const NAME:String = "WordPuzzleMediator";
       
      
      public function class_1115(param1:Object = null)
      {
         super(NAME,param1);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [class_244.const_897,class_244.const_990];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:* = null;
         super.handleNotification(param1);
         var _loc3_:String = param1.getName();
         switch(_loc3_)
         {
            case class_244.const_897:
               _loc2_ = param1.getBody() as class_1116;
               this.method_5102(_loc2_);
               this.method_3206(_loc2_);
               break;
            case class_244.const_990:
               _loc2_ = param1.getBody() as class_1116;
               this.method_2386(_loc2_);
         }
      }
      
      protected function method_2386(param1:class_1116) : void
      {
         this.method_3206(param1);
         var _loc2_:String = param1.method_5485();
         this.window.labelSolutionWord.text = _loc2_;
         this.window.labelSolutionWord.setStyle("color",class_18.const_2995);
      }
      
      protected function method_5102(param1:class_1116) : void
      {
         var _loc2_:String = param1.method_5485();
         this.window.labelSolutionWord.text = _loc2_;
      }
      
      protected function method_3206(param1:class_1116) : void
      {
         var _loc2_:Boolean = Boolean(param1.complete);
         var _loc3_:Label = this.window.labelPuzzleStatus;
         var _loc4_:Label = this.window.labelPuzzleDescription;
         if(_loc2_)
         {
            _loc3_.text = class_88.getItem("label_wordpuzzle_status_complete");
            _loc4_.text = class_88.getItem("label_wordpuzzle_description_complete");
         }
         else
         {
            _loc3_.text = class_88.getItem("label_wordpuzzle_status_incomplete");
            _loc4_.text = class_88.getItem("label_wordpuzzle_description_incomplete");
         }
      }
      
      override public function setViewComponent(param1:Object) : void
      {
         super.setViewComponent(param1);
      }
      
      public function get window() : class_146
      {
         return super.getViewComponent() as class_146;
      }
   }
}
