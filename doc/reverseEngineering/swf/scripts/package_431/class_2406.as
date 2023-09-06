package package_431
{
   import away3d.animators.class_2579;
   import away3d.arcane;
   import flash.utils.getQualifiedClassName;
   import package_309.class_1774;
   import package_386.class_2238;
   import package_386.class_2580;
   
   public class class_2406 extends class_2405
   {
      
      private static var name_100:String = "Global";
      
      private static var name_24:String = "LocalStatic";
      
      private static var name_117:String = "LocalDynamic";
      
      private static var var_2789:Object = {
         "0":name_100,
         "1":name_24,
         "2":name_117
      };
       
      
      protected var _mode:uint;
      
      private var var_1035:int;
      
      protected var _dataLength:uint = 3;
      
      protected var var_2599:Vector.<Number>;
      
      arcane var var_4676:uint;
      
      public function class_2406(param1:String, param2:uint, param3:uint, param4:int = 1)
      {
         super();
         param1 += var_2789[param2];
         this.name = param1;
         this._mode = param2;
         this.var_1035 = param4;
         this._dataLength = param3;
         this.var_2599 = new Vector.<Number>(this._dataLength,true);
      }
      
      public static function method_4116(param1:Object, param2:uint) : String
      {
         var _loc3_:String = param1["ANIMATION_NODE_NAME"];
         if(!_loc3_)
         {
            _loc3_ = method_471(param1);
         }
         return _loc3_ + var_2789[param2];
      }
      
      private static function method_471(param1:Object) : String
      {
         return getQualifiedClassName(param1).replace("Node","").split("::")[1];
      }
      
      public function get mode() : uint
      {
         return this._mode;
      }
      
      public function get priority() : int
      {
         return this.var_1035;
      }
      
      public function get method_3305() : int
      {
         return this._dataLength;
      }
      
      public function get method_561() : Vector.<Number>
      {
         return this.var_2599;
      }
      
      public function method_2174(param1:class_1774, param2:class_2238) : String
      {
         param1 = param1;
         param2 = param2;
         return "";
      }
      
      public function method_2535(param1:class_1774, param2:class_2238) : String
      {
         param1 = param1;
         param2 = param2;
         return "";
      }
      
      public function method_45(param1:class_1774, param2:class_2238) : String
      {
         param1 = param1;
         param2 = param2;
         return "";
      }
      
      arcane function method_5880(param1:class_2580) : void
      {
      }
      
      arcane function method_2127(param1:class_2579) : void
      {
      }
   }
}
