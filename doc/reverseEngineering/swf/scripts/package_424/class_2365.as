package package_424
{
   import net.bigpoint.darkorbit.map.common.IDisposable;
   import net.bigpoint.darkorbit.map.common.class_2362;
   import net.bigpoint.darkorbit.map.common.class_80;
   import package_10.class_1173;
   
   public class class_2365 implements class_80, IDisposable
   {
       
      
      private var _updatables:Vector.<class_80>;
      
      private var var_3465:Vector.<IDisposable>;
      
      private var var_2589:Vector.<class_2362>;
      
      private var var_2155:Object;
      
      private var var_1165:class_2358 = null;
      
      private var _state:class_1173;
      
      private var var_4607:String = null;
      
      private var var_3707:String = null;
      
      private var var_4051:Function;
      
      private var var_4092:Object;
      
      private var var_3091:int = 0;
      
      private var var_4680:String = null;
      
      private var var_2841:Boolean = false;
      
      public function class_2365(param1:class_1173 = null)
      {
         this._updatables = new Vector.<class_80>();
         this.var_3465 = new Vector.<IDisposable>();
         this.var_2589 = new Vector.<class_2362>();
         this.var_2155 = {};
         this.var_4092 = {};
         super();
         this._state = param1;
         if(this._state)
         {
            this._state.changed.add(this.method_4021);
         }
      }
      
      public function updateObj(param1:Number) : void
      {
         var _loc2_:int = this._updatables.length - 1;
         while(_loc2_ >= 0)
         {
            this._updatables[_loc2_].updateObj(param1);
            _loc2_--;
         }
      }
      
      public function disposeView(param1:Boolean = false) : void
      {
         if(this._state)
         {
            this._state.changed.remove(this.method_4021);
         }
         while(this.var_3465.length > 0)
         {
            this.var_3465.pop().disposeView(param1);
         }
         this._updatables.length = 0;
         this.method_6420(null);
      }
      
      public function method_1164(param1:class_80) : void
      {
         this._updatables.push(param1);
      }
      
      public function method_3592(param1:class_80) : void
      {
         var _loc2_:int = int(this._updatables.indexOf(param1));
         if(_loc2_ != -1)
         {
            this._updatables.splice(_loc2_,1);
         }
      }
      
      public function method_1490(param1:IDisposable) : void
      {
         this.var_3465.push(param1);
      }
      
      public function method_6419(param1:IDisposable) : void
      {
         var _loc2_:int = int(this.var_3465.indexOf(param1));
         if(_loc2_ != -1)
         {
            this.var_3465.splice(_loc2_,1);
         }
      }
      
      public function method_1697(param1:Object) : void
      {
         if(param1 is class_80)
         {
            this._updatables.push(param1 as class_80);
            class_80(param1).updateObj(0);
         }
         if(param1 is IDisposable)
         {
            this.var_3465.push(param1 as IDisposable);
         }
         if(param1 is class_2362)
         {
            this.var_2589.push(param1 as class_2362);
            if(this._state)
            {
               class_2362(param1).handleStateChange(this._state.value);
            }
         }
      }
      
      public function parseAnimations(param1:XML, param2:Class, param3:Object) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(param1)
         {
            this.var_4680 = param3.toString();
            for each(_loc4_ in param1.animation)
            {
               _loc5_ = new param2(String(_loc4_.@id) || this.method_836(),_loc4_,param3);
               this.var_2155[_loc5_.id] = _loc5_;
               if(_loc5_.autoPlay)
               {
                  if(this.var_3707 != null)
                  {
                     this.log("WARNING multiple animations defined as autoPlay:  " + [this.var_3707,_loc5_.id]);
                  }
                  this.var_3707 = _loc5_.id;
               }
               this.method_1490(_loc5_);
            }
            for each(_loc4_ in param1.background_animation)
            {
               _loc5_ = new param2("background_animation",_loc4_,param3);
               this.method_1164(_loc5_);
               this.method_1490(_loc5_);
               _loc5_.play();
            }
            if(this.var_3707)
            {
               this.method_6420(this.var_3707);
            }
         }
      }
      
      public function method_6420(param1:String, param2:Function = null, param3:Boolean = false) : void
      {
         var _loc4_:* = null;
         if(this.var_1165)
         {
            this.var_1165.completed.remove(this.method_4350);
            this.method_3592(this.var_1165);
            this.var_1165.stop();
            this.var_1165 = null;
            if(Boolean(this.var_2841) && this.var_4051 != null)
            {
               _loc4_ = this.var_4051;
               this.var_4051 = null;
               this.var_2841 = false;
               _loc4_();
            }
         }
         this.var_4607 = param1;
         if(this.var_4607 == null)
         {
            this.log("WARNING: animation null not found in " + this.var_4680);
            if(param3 && param2 != null)
            {
               param2();
            }
            return;
         }
         if(this.var_2155[param1] == null)
         {
            this.var_4607 = null;
            if(param3 && param2 != null)
            {
               param2();
            }
            this.log("WARNING: animation \'" + param1 + "\' not found in " + this.var_4680);
            return;
         }
         this.var_1165 = this.var_2155[param1] as class_2358;
         this.var_4051 = param2;
         this.var_2841 = param3;
         this.log("playAnimation(" + param1 + ")");
         this.var_1165.completed.add(this.method_4350);
         this.method_1164(this.var_1165);
         this.var_1165.play();
      }
      
      public function method_5838() : void
      {
         this.method_6420(this.var_3707);
      }
      
      public function method_3668(param1:String) : String
      {
         this.var_4092[param1] = int(this.var_4092[param1]) + 1;
         return param1 + "_" + this.var_4092[param1];
      }
      
      protected function log(param1:String) : void
      {
      }
      
      private function method_836() : String
      {
         ++this.var_3091;
         return "animation_" + this.var_3091;
      }
      
      private function method_4350() : void
      {
         var _loc1_:* = null;
         this.log(this.var_1165.id + " completed");
         if(this.var_4051 != null)
         {
            _loc1_ = this.var_4051;
            this.var_4051 = null;
            this.var_2841 = false;
            _loc1_();
         }
         this.method_6420(this.var_3707);
      }
      
      private function method_4021() : void
      {
         var _loc1_:int = this.var_2589.length - 1;
         while(_loc1_ >= 0)
         {
            this.var_2589[_loc1_].handleStateChange(this._state.value);
            _loc1_--;
         }
      }
      
      public function get state() : class_1173
      {
         return this._state;
      }
   }
}
