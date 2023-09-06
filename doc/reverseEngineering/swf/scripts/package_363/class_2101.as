package package_363
{
   import flash.events.Event;
   import package_199.class_2391;
   import package_364.DirectionalLight;
   import package_364.PointLight;
   import package_364.class_2102;
   import package_364.class_2390;
   
   public class class_2101 extends class_2100
   {
       
      
      private var var_1423:Array;
      
      public function class_2101(param1:Array)
      {
         super();
         this.name_10 = param1;
      }
      
      public function get name_10() : Array
      {
         return this.var_1423;
      }
      
      public function set name_10(param1:Array) : void
      {
         var _loc7_:* = null;
         var _loc2_:Number = 0;
         var _loc3_:Number = 0;
         var _loc4_:Number = 0;
         var _loc5_:Number = 0;
         var _loc6_:Number = 0;
         if(this.var_1423)
         {
            this.method_2069();
         }
         this.var_1423 = param1;
         var_3683 = Vector.<class_2102>(param1);
         var_156 = new Vector.<PointLight>();
         var_4387 = new Vector.<PointLight>();
         var_1547 = new Vector.<DirectionalLight>();
         var_807 = new Vector.<DirectionalLight>();
         var_3768 = new Vector.<class_2390>();
         var _loc8_:uint = param1.length;
         var _loc9_:Number = 0;
         while(_loc9_ < _loc8_)
         {
            (_loc7_ = param1[_loc9_]).addEventListener(class_2391.const_2614,this.method_5492);
            if(_loc7_ is PointLight)
            {
               if(_loc7_.method_825)
               {
                  var _loc10_:*;
                  var_4387[_loc10_ = _loc4_++] = PointLight(_loc7_);
               }
               else
               {
                  var_156[_loc10_ = _loc2_++] = PointLight(_loc7_);
               }
            }
            else if(_loc7_ is DirectionalLight)
            {
               if(_loc7_.method_825)
               {
                  var_807[_loc10_ = _loc5_++] = DirectionalLight(_loc7_);
               }
               else
               {
                  var_1547[_loc10_ = _loc3_++] = DirectionalLight(_loc7_);
               }
            }
            else if(_loc7_ is class_2390)
            {
               var_3768[_loc10_ = _loc6_++] = class_2390(_loc7_);
            }
            _loc9_++;
         }
         if(var_231 == _loc3_ && var_1458 == _loc2_ && var_1052 == _loc6_ && var_2133 == _loc4_ && var_4980 == _loc5_)
         {
            return;
         }
         var_231 = _loc3_;
         var_4980 = _loc5_;
         var_1458 = _loc2_;
         var_2133 = _loc4_;
         var_1052 = _loc6_;
         var_829 = new Vector.<Number>(Math.ceil(_loc6_ / 4) * 4,true);
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      private function method_2069() : void
      {
         var _loc1_:uint = uint(this.var_1423.length);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            this.var_1423[_loc2_].removeEventListener(class_2391.const_2614,this.method_5492);
            _loc2_++;
         }
      }
      
      private function method_5492(param1:class_2391) : void
      {
         var _loc2_:class_2102 = class_2102(param1.target);
         if(_loc2_ is PointLight)
         {
            this.method_5550(_loc2_ as PointLight);
         }
         else if(_loc2_ is DirectionalLight)
         {
            this.method_1055(_loc2_ as DirectionalLight);
         }
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      private function method_1055(param1:DirectionalLight) : void
      {
         if(param1.method_825)
         {
            --var_231;
            ++var_4980;
            var_1547.splice(var_1547.indexOf(param1 as DirectionalLight),1);
            var_807.push(param1);
         }
         else
         {
            ++var_231;
            --var_4980;
            var_807.splice(var_807.indexOf(param1 as DirectionalLight),1);
            var_1547.push(param1);
         }
      }
      
      private function method_5550(param1:PointLight) : void
      {
         if(param1.method_825)
         {
            --var_1458;
            ++var_2133;
            var_156.splice(var_156.indexOf(param1 as PointLight),1);
            var_4387.push(param1);
         }
         else
         {
            ++var_1458;
            --var_2133;
            var_4387.splice(var_4387.indexOf(param1 as PointLight),1);
            var_156.push(param1);
         }
      }
   }
}
