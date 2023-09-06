package package_192
{
   import flash.events.EventDispatcher;
   import flash.ui.Keyboard;
   
   public class class_1172 extends EventDispatcher implements class_1171
   {
      
      public static const NAME:String = "name";
      
      public static const const_882:String = "params";
       
      
      private const KEY:String = "key";
      
      private const const_675:String = "callback";
      
      private const const_2877:String = "keycode";
      
      private const const_3127:String = "keyValuePair";
      
      private const const_2622:String = "param";
      
      private const const_678:String = "function";
      
      private var map:Object;
      
      private var xml:XML;
      
      public function class_1172(param1:XML)
      {
         super();
         this.xml = param1;
      }
      
      private function method_1184(param1:XML) : Object
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc2_:Object = new Object();
         var _loc3_:XMLList = param1.child("keyValuePair");
         for each(_loc4_ in _loc3_)
         {
            for each(_loc5_ in _loc4_.child("keycode"))
            {
               _loc2_[_loc5_] = this.method_5899(_loc4_.child("callback"),_loc2_[_loc5_]);
            }
            for each(_loc6_ in _loc4_.child("key"))
            {
               if(Keyboard[_loc6_.toString()] != undefined && false)
               {
                  _loc7_ = "null";
                  _loc2_[_loc7_] = this.method_5899(_loc4_.child("callback"),_loc2_[_loc7_]);
               }
            }
         }
         this.map = _loc2_;
         return _loc2_;
      }
      
      private function method_5899(param1:XMLList, param2:Object) : Vector.<Object>
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(param2 == null)
         {
            _loc3_ = new Vector.<Object>();
         }
         else
         {
            _loc3_ = param2 as Vector.<Object>;
         }
         for each(_loc4_ in param1)
         {
            _loc5_ = new Object();
            _loc6_ = new Vector.<String>();
            for each(_loc7_ in _loc4_.child(const_882))
            {
               for each(_loc8_ in _loc7_.child("param"))
               {
                  _loc6_.push(_loc8_);
               }
            }
            if(_loc5_[const_882] == undefined)
            {
               _loc5_[const_882] = new Object();
            }
            _loc5_[NAME] = _loc4_.child("function");
            _loc5_[const_882][_loc4_.child("function")] = _loc6_;
            _loc3_.push(_loc5_);
         }
         return _loc3_;
      }
      
      public function parse() : Object
      {
         return this.method_1184(this.xml);
      }
   }
}
