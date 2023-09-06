package package_373
{
   import flash.utils.setTimeout;
   import package_424.*;
   
   public class UberAnimation3D extends class_2358
   {
       
      
      private var var_1394:class_2134;
      
      private var var_2588:Vector.<VertexAnimation>;
      
      private var var_278:Vector.<class_2460>;
      
      public function UberAnimation3D(param1:String, param2:XML, param3:class_2134)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         super(param1,param2,param3.method_4434);
         this.var_1394 = param3;
         if(param2.vertex_anim.length() > 0)
         {
            this.var_2588 = new Vector.<VertexAnimation>();
            for each(_loc5_ in param2.vertex_anim)
            {
               this.var_2588.push(new VertexAnimation(String(_loc5_.@name),this.method_2979(String(_loc5_.@mesh))));
            }
         }
         if(param2.glow.length() > 0)
         {
            for each(_loc6_ in param2.glow)
            {
               _loc7_ = this.method_2979(String(_loc6_.@mesh));
               for each(_loc4_ in _loc7_)
               {
                  method_1164(new class_2650(_loc4_,"glow",Number(_loc6_.@minValue) || false,Number(_loc6_.@maxValue) || true,Number(_loc6_.@duration) || true));
               }
            }
         }
         if(param2.particles.length() > 0)
         {
            this.var_278 = new Vector.<class_2460>();
            for each(_loc8_ in param2.particles)
            {
               (_loc9_ = new class_2460()).url = String(_loc8_.@url);
               _loc9_.var_4356 = String(_loc8_.@parent);
               this.var_278.push(_loc9_);
            }
         }
      }
      
      override public function play() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         super.play();
         if(this.var_2588)
         {
            _loc1_ = this.var_2588.length - 1;
            while(_loc1_ >= 0)
            {
               this.var_2588[_loc1_].play(this.method_6309);
               _loc1_--;
            }
         }
         if(this.var_278)
         {
            _loc1_ = this.var_278.length - 1;
            while(_loc1_ >= 0)
            {
               _loc2_ = this.var_278[_loc1_];
               _loc2_.method_3446(_loc2_.url);
               method_1164(_loc2_);
               (this.var_1394.method_4434(_loc2_.var_4356) || this.var_1394).addChild(_loc2_);
               _loc1_--;
            }
         }
      }
      
      private function method_6309() : void
      {
         setTimeout(completed.dispatch,1);
      }
      
      override public function stop() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(this.var_278)
         {
            _loc1_ = this.var_278.length - 1;
            while(_loc1_ >= 0)
            {
               _loc2_ = this.var_278[_loc1_];
               method_3592(_loc2_);
               if(_loc2_.parent)
               {
                  _loc2_.parent.removeChild(_loc2_);
               }
               _loc1_--;
            }
         }
         super.stop();
      }
      
      override public function disposeView(param1:Boolean = false) : void
      {
         var _loc2_:* = null;
         if(this.var_278)
         {
            while(this.var_278.length > 0)
            {
               _loc2_ = this.var_278.pop();
               method_3592(_loc2_);
               if(_loc2_.parent)
               {
                  _loc2_.parent.removeChild(_loc2_);
               }
               _loc2_.disposeView(param1);
            }
         }
         super.disposeView(param1);
      }
      
      private function method_2979(param1:String) : Vector.<class_2456>
      {
         var _loc2_:class_2456 = this.var_1394.method_4434(param1) as class_2456;
         if(_loc2_)
         {
            return Vector.<class_2456>([_loc2_]);
         }
         return this.var_1394.method_3287;
      }
   }
}

import package_373.class_2456;
import package_379.class_2149;

class VertexAnimation
{
    
   
   private var _name:String;
   
   private var _targets:Vector.<class_2456>;
   
   function VertexAnimation(param1:String, param2:Vector.<class_2456>)
   {
      super();
      this._name = param1;
      this._targets = param2;
   }
   
   public function play(param1:Function) : void
   {
      var _loc2_:int = this._targets.length - 1;
      while(_loc2_ >= 0)
      {
         if(this._targets[_loc2_].mesh)
         {
            this._targets[_loc2_].mesh.method_6420(!!this._name ? this._name : class_2149.const_2042,param1);
         }
         _loc2_--;
      }
   }
}
