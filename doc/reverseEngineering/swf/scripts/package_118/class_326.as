package package_118
{
   import flash.utils.Dictionary;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   
   public class class_326 extends class_325
   {
       
      
      private var _precision = -1;
      
      public function class_326()
      {
         super();
      }
      
      public function get precision() : *
      {
         return this._precision;
      }
      
      public function set precision(param1:*) : void
      {
         this._precision = class_325.method_4014(param1);
      }
      
      override public function link() : void
      {
         super.link();
         if(this._precision is class_325)
         {
            (this._precision as class_325).link();
         }
      }
      
      override public function getText(param1:Dictionary) : String
      {
         var _loc7_:* = 0;
         var _loc2_:Number = Number(param1[name]);
         var _loc3_:int = int(class_325.method_1118(this._precision,param1));
         var _loc4_:String;
         var _loc5_:int = (_loc4_ = this.roundTo(_loc2_,_loc3_).toString()).indexOf(".");
         var _loc6_:uint = uint(class_88.var_2537.length);
         if(_loc5_ >= 0)
         {
            _loc4_ = _loc4_.replace(".",class_88.var_4795);
         }
         if(_loc6_ <= 0)
         {
            return _loc4_;
         }
         _loc5_ = (_loc5_ = _loc5_ < 0 ? _loc4_.length : _loc5_) - Number(class_88.var_2537[0]);
         _loc7_ = _loc7_ < _loc6_ - 1 ? 1 : 0;
         while(_loc5_ > 0)
         {
            _loc4_ = _loc4_.slice(0,_loc5_) + class_88.var_3200 + _loc4_.slice(_loc5_);
            _loc5_ -= class_88.var_2537[_loc7_];
            if(_loc7_ < _loc6_ - 1)
            {
               _loc7_++;
            }
         }
         return _loc4_;
      }
      
      private function roundTo(param1:Number, param2:int = 0) : Number
      {
         var _loc3_:Number = Math.pow(10,param2);
         return Math.round(param1 * _loc3_) / _loc3_;
      }
   }
}
