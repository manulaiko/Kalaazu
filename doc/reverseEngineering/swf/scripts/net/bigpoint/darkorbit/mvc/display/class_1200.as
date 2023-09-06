package net.bigpoint.darkorbit.mvc.display
{
   import avmplus.getQualifiedClassName;
   import flash.utils.Dictionary;
   import net.bigpoint.darkorbit.settings.Settings;
   import package_102.class_1719;
   import package_102.class_1721;
   import package_102.class_1727;
   import package_102.class_1732;
   import package_266.class_1713;
   import package_282.class_1706;
   import package_282.class_1722;
   import package_282.class_1729;
   import package_282.class_1731;
   import package_283.class_1707;
   import package_284.class_1712;
   import package_284.class_1717;
   import package_284.class_1728;
   import package_284.class_1730;
   import package_285.class_1716;
   import package_285.class_1723;
   import package_285.class_1724;
   import package_285.class_1726;
   
   public class class_1200
   {
      
      private static var var_2609:class_1200;
      
      private static var var_528:class_1200;
       
      
      private var var_558:Boolean;
      
      private var _impl:Dictionary;
      
      private var var_2063:class_1707;
      
      public function class_1200(param1:Boolean, param2:Class, param3:Class, param4:Class, param5:Class, param6:class_1707)
      {
         super();
         this.var_558 = param1;
         this._impl = new Dictionary(true);
         this.method_3794(class_1709,param2);
         this.method_3794(class_1718,param3);
         this.method_3794(class_1705,param4);
         this.method_3794(class_1708,param5);
      }
      
      public static function get viewBuilder() : class_1200
      {
         return Settings.gpuSupport ? method_4498 : method_2722;
      }
      
      public static function get method_2722() : class_1200
      {
         var _loc1_:* = null;
         if(var_2609 == null)
         {
            _loc1_ = new class_1707(class_1724,class_1723,class_1726,class_1716);
            var_2609 = new class_1200(false,class_1721,class_1719,class_1727,class_1732,_loc1_);
            var_2609.method_3794(IDisplayObject,class_1720);
         }
         return var_2609;
      }
      
      public static function get method_4498() : class_1200
      {
         var _loc1_:* = null;
         if(var_528 == null)
         {
            _loc1_ = new class_1707(class_1730,class_1712,class_1728,class_1717);
            var_528 = new class_1200(true,class_1731,class_1722,class_1706,class_1729,_loc1_);
            var_528.method_3794(IDisplayObject,class_1207);
         }
         return var_528;
      }
      
      public function method_3794(param1:Class, param2:Class) : void
      {
         this._impl[param1] = param2;
      }
      
      public function build(param1:Class) : Object
      {
         var _loc2_:Class = this._impl[param1] as Class;
         if(_loc2_)
         {
            return new _loc2_();
         }
         throw new Error("No implementation for " + getQualifiedClassName(param1) + " interface");
      }
      
      public function method_2524() : class_1709
      {
         return this.build(class_1709) as class_1709;
      }
      
      public function method_2118(param1:class_1713, param2:String = null, param3:Number = 30) : class_1705
      {
         var _loc4_:Class;
         if(_loc4_ = this._impl[class_1705] as Class)
         {
            return new _loc4_(param1,param2,param3) as class_1705;
         }
         throw new Error("No implementation for " + getQualifiedClassName(class_1705) + " interface");
      }
      
      public function method_3051(param1:Object = null) : class_1718
      {
         var _loc2_:class_1718 = this.build(class_1718) as class_1718;
         if(param1)
         {
            _loc2_.texture = param1;
         }
         return _loc2_;
      }
      
      public function method_1130() : class_1708
      {
         return this.build(class_1708) as class_1708;
      }
      
      public function method_1332(param1:class_1713, param2:String, param3:int = 30) : class_1704
      {
         var _loc5_:* = null;
         return this.method_2524();
      }
      
      public function get method_5326() : class_1707
      {
         return this.var_2063;
      }
      
      public function get useATF() : Boolean
      {
         return this.var_558;
      }
   }
}
