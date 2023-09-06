package package_29
{
   import com.bigpoint.utils.class_73;
   import flash.utils.Dictionary;
   import package_10.class_305;
   import package_19.class_68;
   import package_19.class_70;
   
   public class class_85 extends class_84
   {
       
      
      private var _id:int;
      
      private var _position:class_305;
      
      private var var_684:Dictionary;
      
      public const const_1194:class_68 = new class_70();
      
      public const const_2402:class_68 = new class_70();
      
      private var _container:class_89;
      
      private var var_2929:Object;
      
      public function class_85(param1:int, param2:class_73)
      {
         this.var_684 = new Dictionary(true);
         this.var_2929 = {};
         super();
         this._id = param1;
         this._position = param2 as class_305 || new class_305(param2.x,param2.y,param2.z);
      }
      
      public function method_125(param1:class_89) : void
      {
         var _loc2_:* = null;
         this._container = param1;
         for each(_loc2_ in traits)
         {
            _loc2_.method_6037();
         }
         this.const_1194.dispatch();
      }
      
      public function method_166() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in traits)
         {
            _loc1_.method_2753();
         }
         this.const_2402.dispatch();
         this._container = null;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get position() : class_305
      {
         return this._position;
      }
      
      public function get x() : int
      {
         return this._position.x;
      }
      
      public function get y() : int
      {
         return this._position.y;
      }
      
      public function get z() : int
      {
         return this._position.z;
      }
      
      public function get method_1474() : int
      {
         return this._position.x;
      }
      
      public function get method_1121() : int
      {
         return this._position.z;
      }
      
      public function get method_6123() : int
      {
         return -Number(this._position.y);
      }
      
      public function method_1954(param1:Class) : class_267
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         if(this.var_684[param1] == null)
         {
            _loc3_ = -1;
            while(_loc3_ >= 0)
            {
               _loc2_ = traits[_loc3_];
               if(_loc2_ is param1)
               {
                  this.var_684[param1] = _loc2_;
                  return _loc2_;
               }
               _loc3_--;
            }
         }
         return this.var_684[param1] as class_267;
      }
      
      public function getTraits(param1:Class) : Vector.<class_267>
      {
         var _loc5_:* = null;
         var _loc2_:Vector.<class_267> = new Vector.<class_267>();
         var _loc3_:Vector.<class_267> = traits;
         var _loc4_:int = _loc3_.length;
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            if((_loc5_ = _loc3_[_loc6_]) is param1)
            {
               _loc2_.push(_loc5_);
            }
            _loc6_++;
         }
         return _loc2_;
      }
      
      override public function addTrait(param1:class_267) : class_267
      {
         param1.owner = this;
         if(this._container)
         {
            param1.method_6037();
         }
         super.addTrait(param1);
         return param1;
      }
      
      override public function removeTrait(param1:class_267) : class_267
      {
         var _loc2_:* = null;
         for(_loc2_ in this.var_684)
         {
            if(this.var_684[_loc2_] == param1)
            {
               this.var_684[_loc2_] = null;
               delete this.var_684[_loc2_];
            }
         }
         return super.removeTrait(param1);
      }
      
      public function method_2049(param1:Class) : void
      {
         var _loc2_:* = null;
         while(_loc2_ = this.method_1954(param1))
         {
            this.removeTrait(_loc2_);
         }
      }
      
      override public function removeAllTraits() : void
      {
         this.var_684 = new Dictionary(true);
         super.removeAllTraits();
      }
      
      public function method_5851(param1:String) : class_305
      {
         var _loc2_:class_305 = this.var_2929[param1];
         if(_loc2_ == null)
         {
            _loc2_ = this.var_2929[param1] = new class_305(0,0,0);
         }
         return _loc2_;
      }
      
      public function method_2911() : void
      {
         this.var_2929 = {};
      }
   }
}
