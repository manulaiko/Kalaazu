package package_351
{
   import com.bigpoint.utils.class_73;
   import flash.utils.Dictionary;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_18;
   import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
   import org.puremvc.as3.multicore.interfaces.IMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_135.class_391;
   import package_26.class_333;
   import package_26.class_94;
   import package_274.class_1987;
   import package_30.class_91;
   import package_31.class_92;
   import package_350.class_2305;
   import package_38.class_429;
   import package_46.class_131;
   import package_70.SimpleWindowEvent;
   import package_98.MapNotification;
   
   public class SectorControlUiMediator extends class_92 implements IMediator
   {
      
      public static const NAME:String = "SectorControlUiMediator";
       
      
      public function SectorControlUiMediator(param1:class_2305)
      {
         super(NAME,param1);
         this.addEventListeners();
      }
      
      private function addEventListeners() : void
      {
         var _loc1_:class_131 = guiManager.method_468(GuiConstants.SECTOR_CONTROL_WINDOW);
         if(_loc1_)
         {
            _loc1_.addEventListener(SimpleWindowEvent.ON_CLOSE,this.method_4648);
         }
      }
      
      private function removeEventListeners() : void
      {
         var _loc1_:class_131 = guiManager.method_468(GuiConstants.SECTOR_CONTROL_WINDOW);
         if(_loc1_)
         {
            _loc1_.removeEventListener(SimpleWindowEvent.ON_CLOSE,this.method_4648);
         }
      }
      
      private function method_4648(param1:SimpleWindowEvent) : void
      {
         this.remove();
      }
      
      private function remove() : void
      {
         this.removeEventListeners();
         facade.removeMediator(getMediatorName());
         this.onRemove();
      }
      
      override public function onRemove() : void
      {
         this.removeView();
         super.onRemove();
         facade.registerCommand(class_391.INIT,class_1987);
      }
      
      private function removeView() : void
      {
         if(Boolean(this.view) && Boolean(this.view.parent))
         {
            this.view.parent.removeChild(this.view);
         }
      }
      
      override public function setViewComponent(param1:Object) : void
      {
         this.removeView();
         super.setViewComponent(param1);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [MapNotification.CLEANUP,class_391.const_3181,class_391.const_595,class_391.const_228,class_391.const_683];
      }
      
      private function get view() : class_2305
      {
         return viewComponent as class_2305;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case class_391.const_3181:
               this.view.method_5785(param1.getBody() as class_73);
               break;
            case class_391.const_595:
               this.method_88(param1.getBody() as Vector.<class_73>);
               break;
            case class_391.const_228:
               this.method_101(param1.getBody() as Vector.<class_73>);
               break;
            case class_391.const_683:
               this.method_3601(param1.getBody() as Vector.<Dictionary>);
               break;
            case MapNotification.CLEANUP:
               this.remove();
         }
      }
      
      private function method_88(param1:Vector.<class_73>) : void
      {
         var _loc2_:int = param1.length;
         var _loc3_:int = 1;
         while(_loc3_ < _loc2_)
         {
            if(this.view.var_1599.length - 1 >= _loc3_)
            {
               this.view.var_1599[_loc3_].update(param1[_loc3_].x,param1[_loc3_].y);
               this.view.var_4033[_loc3_].textField.text = param1[_loc3_].x.toString();
            }
            _loc3_++;
         }
      }
      
      private function method_101(param1:Vector.<class_73>) : void
      {
         var _loc2_:Vector.<class_73> = param1;
         var _loc3_:int = _loc2_.length;
         var _loc4_:int = 1;
         while(_loc4_ < _loc3_)
         {
            if(this.view.var_3146.length - 1 >= _loc4_)
            {
               this.view.var_3146[_loc4_].textField.text = _loc2_[_loc4_].x.toString();
               if(_loc2_[_loc4_].x < 5)
               {
                  this.view.var_3146[_loc4_].textField.textColor = class_18.const_2139;
               }
               else
               {
                  this.view.var_3146[_loc4_].textField.textColor = class_18.const_2179;
               }
               this.view.var_2237[_loc4_].textField.text = "/" + _loc2_[_loc4_].y.toString();
            }
            _loc4_++;
         }
      }
      
      private function method_3601(param1:Vector.<Dictionary>) : void
      {
         var _loc4_:* = null;
         var _loc5_:Number = NaN;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc2_:Vector.<Dictionary> = param1;
         var _loc3_:int = int(this.view.var_4481.length);
         var _loc8_:class_94 = class_94.getInstance();
         var _loc9_:int = 1;
         while(_loc9_ < _loc3_)
         {
            _loc5_ = !!_loc2_[_loc9_] ? Number(_loc2_[_loc9_][class_429.DAMAGE]) : NaN;
            _loc4_ = this.view.var_4481[_loc9_] as class_91;
            if(_loc5_ && !isNaN(_loc5_) && _loc5_ > 0)
            {
               _loc4_.visible = true;
               _loc6_ = class_88.getItem("ttip_sectorcontrol_ingame_status_cp_bonusses").replace("%PERCENTAGE%",String(_loc5_));
               if(_loc7_ = _loc8_.method_6181(_loc4_))
               {
                  _loc7_.method_1455(_loc6_);
               }
               else
               {
                  _loc8_.method_1211(_loc4_,_loc6_);
               }
            }
            else
            {
               _loc8_.method_4247(_loc4_);
               _loc4_.visible = false;
            }
            _loc9_++;
         }
      }
   }
}
