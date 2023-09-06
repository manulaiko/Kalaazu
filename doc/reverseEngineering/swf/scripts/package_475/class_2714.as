package package_475
{
   import com.bigpoint.utils.class_122;
   import net.bigpoint.darkorbit.fui.builder.repository.SkinRepository;
   import net.bigpoint.darkorbit.fui.components.bars.ProgressBar;
   import net.bigpoint.darkorbit.fui.components.core.Container;
   import net.bigpoint.darkorbit.fui.components.core.Coreponent;
   import net.bigpoint.darkorbit.fui.components.core.InvalidationType;
   import net.bigpoint.darkorbit.fui.components.list.itemlist.DefaultItemDataAssigner;
   import net.bigpoint.darkorbit.fui.components.text.label.Label;
   import package_320.class_2517;
   import package_321.class_2270;
   
   public class class_2714 extends DefaultItemDataAssigner
   {
      
      private static const const_2708:Object = method_4263();
       
      
      private var var_2058:Coreponent;
      
      private var var_135:Label;
      
      private var var_1625:ProgressBar;
      
      public function class_2714()
      {
         super();
      }
      
      private static function method_4263() : Object
      {
         var _loc1_:* = {};
         _loc1_[class_2517.MMO + String(true)] = class_2517.const_1913;
         _loc1_[class_2517.VRU + String(true)] = class_2517.const_1282;
         _loc1_[class_2517.EIC + String(true)] = class_2517.const_1545;
         _loc1_[class_2517.MMO + String(false)] = class_2517.const_355;
         _loc1_[class_2517.VRU + String(false)] = class_2517.const_2569;
         _loc1_[class_2517.EIC + String(false)] = class_2517.const_1596;
         return _loc1_;
      }
      
      override public function set data(param1:Object) : void
      {
         this.update(param1);
      }
      
      private function update(param1:Object) : void
      {
         var _loc2_:class_2270 = param1 as class_2270;
         this.var_135.text = class_122.round(_loc2_.score);
         this.var_2058.setSkinState(_loc2_.faction);
         var _loc3_:String = this.method_1108(_loc2_);
         if(this.var_1625.skin.registerdName != _loc3_)
         {
            this.var_1625.skin = SkinRepository.getInstance().getSkin(_loc3_);
         }
         this.var_1625.forceRedraw(InvalidationType.SKIN);
         this.var_1625.maxValue = _loc2_.name_48;
         this.var_1625.currentValue = _loc2_.score;
      }
      
      private function method_1108(param1:class_2270) : String
      {
         return const_2708[param1.faction + param1.method_261.toString()];
      }
      
      override public function assignChildren() : void
      {
         var _loc1_:Container = getChildByName(class_2517.const_2802) as Container;
         this.var_2058 = _loc1_.getChildByName(class_2517.const_1639) as Coreponent;
         this.var_135 = _loc1_.getChildByName(class_2517.const_1829) as Label;
         this.var_1625 = _loc1_.getChildByName(class_2517.const_2931) as ProgressBar;
      }
   }
}
