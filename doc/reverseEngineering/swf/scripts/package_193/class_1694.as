package package_193
{
   import com.bigpoint.utils.class_73;
   import flash.geom.Point;
   import package_120.class_1194;
   import package_120.class_1195;
   import package_120.class_1196;
   import package_29.class_267;
   
   public class class_1694 extends class_267 implements class_1196
   {
       
      
      private const const_2779:Vector.<class_1195> = new Vector.<class_1195>();
      
      public function class_1694()
      {
         super();
      }
      
      public function hitTest(param1:Point, param2:Point) : class_1195
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(this.contains(param1))
         {
            return null;
         }
         var _loc3_:class_1197 = owner as class_1197;
         if(_loc3_.name_149)
         {
            if(_loc4_ = this.method_2896(param1,param2,_loc3_.position,_loc3_.name_149,_loc3_.radius.value))
            {
               _loc4_.var_4622 = new class_1194(_loc3_.position.method_3137(),_loc3_.radius.value,_loc3_.name_149);
            }
            if(_loc5_ = this.method_2896(param1,param2,_loc3_.position,false,_loc3_.radius.value + _loc3_.method_4219.value))
            {
               _loc5_.var_4622 = new class_1194(_loc3_.position.method_3137(),_loc3_.radius.value + _loc3_.method_4219.value,false);
            }
            if(Boolean(_loc4_) && Boolean(_loc5_))
            {
               this.const_2779.length = 0;
               this.const_2779.push(_loc4_,_loc5_);
               this.const_2779.sort(class_1195.compare);
               _loc4_ = this.const_2779[0];
               this.const_2779.length = 0;
            }
            else
            {
               _loc4_ = _loc5_ || _loc4_;
            }
         }
         else if(_loc4_ = this.method_2896(param1,param2,_loc3_.position,_loc3_.name_149,_loc3_.radius.value))
         {
            _loc4_.var_4622 = new class_1194(_loc3_.position.method_3137(),_loc3_.radius.value,_loc3_.name_149);
         }
         return _loc4_;
      }
      
      private function method_2896(param1:Point, param2:Point, param3:class_73, param4:Boolean, param5:Number = 1) : class_1195
      {
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc6_:Number = (param2.x - param1.x) * (param2.x - param1.x) + (param2.y - param1.y) * (param2.y - param1.y);
         var _loc7_:Number = 2 * ((param2.x - param1.x) * (param1.x - Number(param3.x)) + (param2.y - param1.y) * (param1.y - Number(param3.y)));
         var _loc8_:Number = Number(param3.x) * Number(param3.x) + Number(param3.y) * Number(param3.y) + param1.x * param1.x + param1.y * param1.y - 2 * (Number(param3.x) * param1.x + Number(param3.y) * param1.y) - param5 * param5;
         var _loc9_:Number;
         if((_loc9_ = _loc7_ * _loc7_ - 4 * _loc6_ * _loc8_) <= 0)
         {
            return null;
         }
         _loc10_ = Math.sqrt(_loc9_);
         _loc11_ = (-_loc7_ + _loc10_) / (2 * _loc6_);
         _loc12_ = (-_loc7_ - _loc10_) / (2 * _loc6_);
         if(0 <= _loc12_ && _loc12_ <= 1)
         {
            return param4 ? null : class_1195.method_49(Point.interpolate(param1,param2,1 - _loc12_),param1);
         }
         if(0 <= _loc11_ && _loc11_ <= 1)
         {
            return param4 ? class_1195.method_49(Point.interpolate(param1,param2,1 - _loc11_),param1) : null;
         }
         return null;
      }
      
      public function contains(param1:Point) : Boolean
      {
         var _loc3_:* = false;
         var _loc2_:class_1197 = owner as class_1197;
         var _loc4_:Number = Math.pow(param1.x - Number(_loc2_.x),2) + Math.pow(param1.y - Number(_loc2_.y),2);
         if(_loc2_.name_149)
         {
            _loc3_ = _loc4_ > Math.pow(_loc2_.radius.value,2) && _loc4_ < Math.pow(_loc2_.radius.value + _loc2_.method_4219.value,2);
         }
         else
         {
            _loc3_ = _loc4_ < Math.pow(_loc2_.radius.value,2);
         }
         return _loc3_;
      }
   }
}
