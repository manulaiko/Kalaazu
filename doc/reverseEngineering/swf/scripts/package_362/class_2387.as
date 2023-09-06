package package_362
{
   import flash.text.TextFieldAutoSize;
   import net.bigpoint.darkorbit.class_18;
   import net.bigpoint.darkorbit.map.common.IDisposable;
   import net.bigpoint.darkorbit.map.model.traits.class_1181;
   import net.bigpoint.darkorbit.mvc.display.class_1705;
   import net.bigpoint.darkorbit.mvc.display.class_1708;
   import package_184.class_1653;
   
   public class class_2387 implements class_2386, IDisposable
   {
       
      
      private var _view:class_2095;
      
      private var var_176:class_1181;
      
      public function class_2387()
      {
         super();
      }
      
      private function get method_349() : class_1705
      {
         return this._view.descriptor.getViewById("HERO_DIGIT2") as class_1705;
      }
      
      private function get method_2799() : class_1705
      {
         return this._view.descriptor.getViewById("OPPONENT_DIGIT2") as class_1705;
      }
      
      private function get method_5913() : class_1705
      {
         return this._view.descriptor.getViewById("HERO_DIGIT1") as class_1705;
      }
      
      private function get method_5161() : class_1705
      {
         return this._view.descriptor.getViewById("OPPONENT_DIGIT1") as class_1705;
      }
      
      private function get method_4726() : class_1708
      {
         return this._view.descriptor.getViewById("text") as class_1708;
      }
      
      private function get vo() : class_1653
      {
         return this.var_176.owner as class_1653;
      }
      
      public function method_1804(param1:class_2095, param2:class_1181) : void
      {
         this._view = param1;
         this.var_176 = param2;
         this.method_4726.font = class_18.const_2241;
         this.method_4726.fontSize = 16;
         this.method_4726.color = 14050604;
         this.method_4726.autoSize = TextFieldAutoSize.CENTER;
         this.method_5913.stop();
         this.method_349.stop();
         this.method_5161.stop();
         this.method_2799.stop();
         if(this.vo)
         {
            this.vo.const_3243.changed.add(this.method_2864);
            this.method_2864();
         }
      }
      
      public function disposeView(param1:Boolean = false) : void
      {
         if(this.vo)
         {
            this.vo.const_3243.changed.remove(this.method_2864);
         }
      }
      
      private function method_2864() : void
      {
         var _loc1_:int = Number(this.vo.data.name_86) % 3;
         var _loc2_:int = Number(this.vo.data.name_165) % 3;
         if(this.vo.data.name_168)
         {
            this.method_4726.text = this.vo.data.name_168;
         }
         this.method_349.currentFrame = Math.min(_loc1_,this.method_349.numFrames);
         this.method_2799.currentFrame = Math.min(_loc2_,this.method_2799.numFrames);
      }
   }
}
