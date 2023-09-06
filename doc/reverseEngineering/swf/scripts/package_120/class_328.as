package package_120
{
   import com.bigpoint.utils.class_73;
   import flash.geom.Point;
   import net.bigpoint.darkorbit.map.model.class_90;
   import package_19.class_68;
   import package_19.class_70;
   import package_193.class_1197;
   import package_194.class_1198;
   import package_29.class_267;
   import package_9.class_50;
   
   public class class_328
   {
      
      private static const const_911:int = 40;
      
      private static const const_831:Vector.<Point> = new <Point>[new Point(const_911,const_911),new Point(-Number(const_911),-Number(const_911)),new Point(const_911,-Number(const_911)),new Point(-Number(const_911),const_911)];
       
      
      public const ready:class_68 = new class_70();
      
      private var var_55:Object;
      
      public function class_328()
      {
         this.var_55 = {};
         super();
      }
      
      public function method_5711(param1:String, param2:String, param3:String, param4:int, param5:String, param6:Boolean, param7:Boolean, param8:Vector.<class_73>, param9:Number = NaN) : class_431
      {
         var _loc10_:* = null;
         this.method_2368(param1);
         switch(param5)
         {
            case class_431.const_1783:
               _loc10_ = new class_1197(class_90.method_5486,param2,param8[0],param9,param7,param4);
               break;
            case class_431.const_900:
            case class_431.const_2027:
               _loc10_ = new class_1198(class_90.method_5486,param2,param8,param7,param4);
         }
         this.var_55[param1] = _loc10_.id;
         this.map.method_4903(_loc10_);
         _loc10_.zoneTypeSpecification.value = param3;
         return _loc10_;
      }
      
      public function method_4008(param1:String, param2:class_431, param3:String) : void
      {
         this.var_55[param1] = param2.id;
         this.map.method_4903(param2);
         param2.zoneTypeSpecification.value = param3;
      }
      
      public function method_2368(param1:String) : void
      {
         this.map.method_918(this.var_55[param1]);
         this.var_55[param1] = null;
         delete this.var_55[param1];
      }
      
      public function method_1978(param1:String) : class_431
      {
         return this.map.method_327(this.var_55[param1]) as class_431;
      }
      
      public function method_6017(param1:Point, param2:Point) : Point
      {
         var _loc4_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc3_:Vector.<class_1195> = new Vector.<class_1195>();
         var _loc5_:Vector.<class_267> = this.map.method_328(class_1196).traits;
         for each(_loc6_ in _loc5_)
         {
            if(_loc4_ = _loc6_.hitTest(param1,param2))
            {
               _loc3_.push(_loc4_);
            }
         }
         if(_loc3_.length == 0)
         {
            return null;
         }
         _loc3_.sort(class_1195.compare);
         if((_loc4_ = _loc3_[0]).var_4622 is Line)
         {
            _loc9_ = _loc4_.var_4622 as Line;
            _loc7_ = _loc4_.subtract(param1);
            (_loc10_ = _loc9_.method_1769()).normalize(const_911);
            if((_loc11_ = _loc9_.method_1678(param1)) == Line.FRONT)
            {
               _loc7_ = _loc7_.add(_loc10_);
            }
            else if(_loc11_ == Line.const_2302)
            {
               _loc7_ = _loc7_.subtract(_loc10_);
            }
            else if(_loc11_ == Line.const_2031)
            {
               for each(_loc12_ in const_831)
               {
                  if(!this.method_2309(param1.add(_loc12_)))
                  {
                     _loc7_ = _loc12_;
                     break;
                  }
               }
            }
         }
         else if(_loc4_.var_4622 is class_1194)
         {
            _loc13_ = _loc4_.var_4622 as class_1194;
            _loc7_ = _loc4_.subtract(param1);
            (_loc14_ = _loc13_.method_4376(_loc4_,!_loc13_.name_149)).normalize(const_911);
            _loc7_ = _loc7_.subtract(_loc14_);
         }
         _loc8_ = param1.add(_loc7_);
         if(this.method_2309(_loc8_))
         {
            return param1.add(_loc7_);
         }
         return _loc8_;
      }
      
      private function method_2309(param1:Point) : Boolean
      {
         var _loc4_:* = null;
         var _loc2_:Vector.<class_267> = this.map.method_328(class_1196).traits;
         var _loc3_:int = _loc2_.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            if((_loc4_ = _loc2_[_loc5_] as class_1196).contains(param1))
            {
               return true;
            }
            _loc5_++;
         }
         return false;
      }
      
      public function method_1515(param1:String) : void
      {
         var _loc3_:* = null;
         var _loc2_:class_431 = this.method_1978(param1);
         if(Boolean(_loc2_) && _loc2_ is class_1198)
         {
            _loc3_ = _loc2_ as class_1198;
         }
      }
      
      private function get map() : class_90
      {
         return class_50.getInstance().map;
      }
      
      public function cleanup() : void
      {
         this.var_55 = {};
      }
      
      public function get zones() : Object
      {
         return this.var_55;
      }
   }
}
