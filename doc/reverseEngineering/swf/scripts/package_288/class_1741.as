package package_288
{
   import net.bigpoint.darkorbit.mvc.display.class_1200;
   import net.bigpoint.darkorbit.mvc.display.class_1704;
   import net.bigpoint.darkorbit.mvc.display.class_1709;
   
   public class class_1741
   {
       
      
      private var _elementsCount:uint = 100;
      
      private var var_3747:uint = 640;
      
      private var var_3381:uint = 400;
      
      private var var_5000:Number = 2;
      
      private var var_4848:Number = 1;
      
      private var _container:class_1709;
      
      private var _elements:Vector.<class_2076>;
      
      private var _builder:class_1200;
      
      private var var_1030:int;
      
      private var var_3464:int;
      
      public function class_1741(param1:class_1200, param2:uint = 300)
      {
         super();
         this._elementsCount = param2;
         this.var_3381 = 100;
         this.var_3747 = 100;
         class_1200.method_4498.method_3794(class_2076,class_2077);
         class_1200.method_2722.method_3794(class_2076,class_2078);
         this._builder = param1;
         this._container = this._builder.method_2524();
         this._container["name"] = "starfield";
         this.method_3307();
      }
      
      public function method_3361(param1:uint, param2:uint) : void
      {
         this.var_3747 = param1;
         this.var_3381 = param2;
         this.reset();
      }
      
      public function reset() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this._elements)
         {
            this.method_3120(_loc1_);
         }
      }
      
      protected function method_1817() : void
      {
         var _loc1_:* = 0;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         if(this._elements != null)
         {
            _loc1_ = uint(this._elements.length);
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               _loc3_ = this._elements[_loc2_] as class_2076;
               _loc3_.dispose();
               this._container.removeUntypedChild(_loc3_);
               _loc2_++;
            }
            this._elements = null;
         }
      }
      
      public function get container() : class_1704
      {
         return this._container;
      }
      
      public function update(param1:int, param2:int, param3:int, param4:int, param5:Number) : void
      {
         if(Math.abs(Number(this.var_1030) - param1) <= this.var_3747 && Math.abs(Number(this.var_3464) - param2) <= this.var_3381)
         {
            this.setSpeed(30 * (Number(this.var_1030) - param1),30 * (Number(this.var_3464) - param2));
         }
         this.var_1030 = param1;
         this.var_3464 = param2;
         this.move(param5);
      }
      
      private function setSpeed(param1:Number, param2:Number) : void
      {
         if(param1 == 0 && param2 == 0)
         {
            this.var_5000 = 8;
            this.var_4848 = 4;
         }
         else
         {
            this.var_5000 = param1;
            this.var_4848 = param2;
         }
      }
      
      private function method_3120(param1:class_2076) : void
      {
         param1.x = Math.random() * Number(this.var_3747);
         param1.y = Math.random() * Number(this.var_3381);
      }
      
      private function method_6266(param1:Number) : uint
      {
         var _loc2_:Number = param1 * 238 + 17;
         return _loc2_ << 16 | _loc2_ << 8 | _loc2_;
      }
      
      private function method_3307() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:* = null;
         if(this._elements)
         {
            this.method_1817();
         }
         this._elements = new Vector.<class_2076>();
         var _loc1_:int = 0;
         while(_loc1_ < this._elementsCount)
         {
            _loc2_ = _loc1_ / Number(this._elementsCount);
            _loc3_ = _loc2_ * 3 + 0.5;
            _loc4_ = Number(this.method_6266(_loc2_));
            (_loc5_ = this._builder.build(class_2076) as class_2076).speed = _loc3_;
            _loc5_.color = _loc4_;
            this._elements.push(_loc5_);
            this.method_3120(_loc5_);
            this._container.addUntypedChild(_loc5_);
            _loc1_++;
         }
      }
      
      private function move(param1:Number) : void
      {
         var _loc5_:* = null;
         var _loc2_:Number = Number(this.var_5000) * param1;
         var _loc3_:Number = Number(this.var_4848) * param1;
         var _loc4_:Number = Number(this._elements.length);
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc5_ = this._elements[_loc6_];
            _loc5_.x += Number(_loc5_.speed) * _loc2_;
            _loc5_.y += Number(_loc5_.speed) * _loc3_;
            if(_loc5_.x < 0)
            {
               _loc5_.x += this.var_3747;
            }
            else if(_loc5_.x > this.var_3747)
            {
               _loc5_.x -= this.var_3747;
            }
            if(_loc5_.y < 0)
            {
               _loc5_.y += this.var_3381;
            }
            else if(_loc5_.y > this.var_3381)
            {
               _loc5_.y -= this.var_3381;
            }
            _loc6_++;
         }
      }
   }
}
