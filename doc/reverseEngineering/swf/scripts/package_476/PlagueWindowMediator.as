package package_476
{
   import com.bigpoint.utils.class_129;
   import flash.filters.GlowFilter;
   import flash.text.GridFitType;
   import flash.utils.setTimeout;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.fui.components.bars.ProgressBar;
   import net.bigpoint.darkorbit.fui.components.core.Container;
   import net.bigpoint.darkorbit.fui.components.core.InvalidationType;
   import net.bigpoint.darkorbit.fui.components.text.label.Label;
   import net.bigpoint.darkorbit.fui.components.text.label.LabelSkin;
   import net.bigpoint.darkorbit.fui.system.utils.FuiComponentSelectorUtil;
   import net.bigpoint.darkorbit.mvc.common.utils.ClassUtils;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_26.class_94;
   import package_31.class_92;
   import package_320.InfluenceWindowNotifications;
   import package_326.PlagueWindowNotifications;
   import package_327.class_2275;
   import package_327.class_2520;
   import package_327.class_2521;
   import package_327.class_2523;
   import package_327.class_2525;
   import package_46.class_131;
   import package_70.SimpleWindowEvent;
   import package_76.class_215;
   
   public class PlagueWindowMediator extends class_92
   {
      
      public static const NAME:String = "PlagueWindowMediator";
       
      
      private const const_201:Array = [new GlowFilter(43263,1,4,4)];
      
      private const const_482:String = "+10%";
      
      private const const_2440:String = "-10%";
      
      private const const_3090:String = "-15%";
      
      private const const_997:String = "0%";
      
      private var var_3483:Container;
      
      private var var_4470:Container;
      
      private var var_1001:Container;
      
      private var var_841:class_131;
      
      private var var_3357:Object;
      
      private var var_2663:String;
      
      private var var_4602:String;
      
      public function PlagueWindowMediator(param1:Object, param2:class_131, param3:Container, param4:Container, param5:Container)
      {
         this.var_3357 = {};
         super(NAME,param1);
         this.var_3357[class_2521] = this.method_4435;
         this.var_3357[class_2525] = this.method_690;
         this.var_3357[class_2523] = this.method_5914;
         class_94.getInstance().method_1211(this.header,class_88.getItem("ttip_plague_header"));
         class_94.getInstance().method_1211(this.footer,class_88.getItem("ttip_plague_footer"));
         class_94.getInstance().method_1211(this.center,class_88.getItem("ttip_plague_center"));
         this.var_1001 = param3;
         this.var_4470 = param4;
         this.var_3483 = param5;
         this.var_1001.forceRedraw(InvalidationType.SIZE);
         this.var_4470.forceRedraw(InvalidationType.SIZE);
         this.var_3483.forceRedraw(InvalidationType.SIZE);
         method_2176(PlagueWindowNotifications.UPDATE_VIEW,this.method_6374);
         method_2176(PlagueWindowNotifications.UPDATE_TIMER,this.method_6374);
         this.name_112.filters = this.method_2335.filters = this.const_201;
         this.var_2663 = class_88.getItem("plague_window_infected");
         this.var_4602 = class_88.getItem("plague_window_healthy");
         this.method_6252.text = "+10%";
         this.method_4230.text = "-15%";
         this.method_3189.text = "-10%";
         this.var_841 = param2;
      }
      
      private function get progressbar() : ProgressBar
      {
         return FuiComponentSelectorUtil.selectComponent("progressbar",this.var_1001) as ProgressBar;
      }
      
      private function get method_5557() : Label
      {
         return FuiComponentSelectorUtil.selectComponent("score",this.var_1001) as Label;
      }
      
      private function get method_6404() : Label
      {
         return FuiComponentSelectorUtil.selectComponent("label",this.var_3483) as Label;
      }
      
      private function get timer() : Label
      {
         return FuiComponentSelectorUtil.selectComponent("header.timer",this.method_2638) as Label;
      }
      
      private function get method_2089() : Label
      {
         return FuiComponentSelectorUtil.selectComponent("header.infected",this.method_2638) as Label;
      }
      
      private function get footer() : Container
      {
         return FuiComponentSelectorUtil.selectComponent("footer",this.method_2638) as Container;
      }
      
      private function get header() : Container
      {
         return FuiComponentSelectorUtil.selectComponent("header",this.method_2638) as Container;
      }
      
      private function get name_112() : Label
      {
         return FuiComponentSelectorUtil.selectComponent("footer.infectedContainer.points",this.method_2638) as Label;
      }
      
      private function get method_2335() : Label
      {
         return FuiComponentSelectorUtil.selectComponent("footer.notInfectedContainer.points",this.method_2638) as Label;
      }
      
      private function get center() : Container
      {
         return FuiComponentSelectorUtil.selectComponent("center",this.method_2638) as Container;
      }
      
      private function get method_3189() : Label
      {
         return FuiComponentSelectorUtil.selectComponent("header.buffs.speed_container.label",this.method_2638) as Label;
      }
      
      private function get method_5715() : Container
      {
         return FuiComponentSelectorUtil.selectComponent("header.buffs",this.method_2638) as Container;
      }
      
      private function get method_6252() : Label
      {
         return FuiComponentSelectorUtil.selectComponent("header.buffs.dmg_container.label",this.method_2638) as Label;
      }
      
      private function get method_4230() : Label
      {
         return FuiComponentSelectorUtil.selectComponent("header.buffs.hp_container.label",this.method_2638) as Label;
      }
      
      private function get method_2638() : Container
      {
         return viewComponent as Container;
      }
      
      override public function onRegister() : void
      {
         this.addListeners();
         super.onRegister();
      }
      
      override public function onRemove() : void
      {
         this.method_25();
         sendNotification(InfluenceWindowNotifications.CLEANUP);
         super.onRemove();
      }
      
      private function method_4399(param1:Boolean) : void
      {
         this.method_5715.visible = param1;
      }
      
      private function method_5914(param1:class_2523) : void
      {
         class_215.removeDisplayObject(this.var_1001);
         class_215.removeDisplayObject(this.var_4470);
         class_215.removeDisplayObject(this.var_3483);
         this.center.addChild(this.var_4470);
      }
      
      private function method_690(param1:class_2525) : void
      {
         class_215.removeDisplayObject(this.var_1001);
         class_215.removeDisplayObject(this.var_4470);
         class_215.removeDisplayObject(this.var_3483);
         var _loc2_:Vector.<int> = param1.maps;
         var _loc3_:int = _loc2_.length;
         var _loc4_:Vector.<String> = new Vector.<String>(0);
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc4_.push(class_126.instance.var_1524[_loc2_[_loc5_]]);
            _loc5_++;
         }
         this.method_6404.useHTML = true;
         this.method_6404.text = _loc4_.join(", ").replace(/-/g,String.fromCharCode(8209));
         (this.method_6404.skin as LabelSkin).textField.gridFitType = GridFitType.NONE;
         this.center.addChild(this.var_3483);
      }
      
      private function method_4435(param1:class_2521) : void
      {
         class_215.removeDisplayObject(this.var_1001);
         class_215.removeDisplayObject(this.var_4470);
         class_215.removeDisplayObject(this.var_3483);
         var _loc2_:* = !param1.method_3546.method_217;
         this.progressbar.visible = !param1.method_3546.method_217;
         this.method_5557.visible = _loc2_;
         this.progressbar.maxValue = param1.method_3546.method_1078;
         this.progressbar.currentValue = param1.method_3546.counter;
         this.method_5557.text = param1.method_3546.counter + "/" + param1.method_3546.method_1078;
         this.center.addChild(this.var_1001);
      }
      
      private function method_6374(param1:INotification) : void
      {
         var _loc2_:class_2275 = param1.getBody() as class_2275;
         this.method_4399(_loc2_.infected);
         this.method_2089.text = !!_loc2_.infected ? this.var_2663 : this.var_4602;
         this.updateTimer(param1);
         this.method_1744(_loc2_.currentState.value as class_2520);
         this.name_112.text = _loc2_.name_112.toString();
         this.method_2335.text = _loc2_.method_2335.toString();
         this.method_2638.invalidate(InvalidationType.SIZE);
         this.method_2638.invalidate(InvalidationType.LAYOUT);
         setTimeout(this.var_841.autoSize,20);
      }
      
      private function updateTimer(param1:INotification) : void
      {
         var _loc2_:class_2275 = param1.getBody() as class_2275;
         this.timer.text = class_129.method_1101(_loc2_.name_11.value);
         this.timer.visible = _loc2_.name_11.value > 0;
      }
      
      private function method_1744(param1:class_2520) : void
      {
         this.var_3357[ClassUtils.getClass(param1)](param1);
         if(this.center.numChildren > 0)
         {
            this.center.height = this.center.getChildAt(0).height;
         }
         this.center.forceRedraws([InvalidationType.SIZE,InvalidationType.LAYOUT]);
      }
      
      private function addListeners() : void
      {
         this.var_841.addEventListener(SimpleWindowEvent.ON_CLOSE,this.method_2519);
      }
      
      private function method_25() : void
      {
         this.var_841.removeEventListener(SimpleWindowEvent.ON_CLOSE,this.method_2519);
      }
      
      private function method_2519(param1:SimpleWindowEvent) : void
      {
         facade.removeMediator(this.getMediatorName());
      }
   }
}
