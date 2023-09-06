package package_431
{
   import flash.geom.*;
   import package_294.*;
   import package_430.*;
   
   public class class_2436 extends class_2435
   {
      
      public static const const_1091:uint = 0;
      
      public static const const_21:uint = 1;
      
      public static const const_1949:uint = 2;
      
      public static const const_2452:uint = 3;
      
      public static const const_3188:Array = [const_1091,const_21,const_1949,const_2452];
       
      
      private var var_147:Vector.<class_2437>;
      
      public function class_2436()
      {
         this.var_147 = new Vector.<class_2437>();
         super();
         var_4797 = class_2442;
      }
      
      public function get frames() : Vector.<class_2437>
      {
         return this.var_147;
      }
      
      public function addFrame(param1:class_2437) : void
      {
         this.var_147.push(param1);
         var_625.push(param1.duration);
         var_2973 = this.var_147.length;
         var_3419 = true;
      }
      
      override protected function method_109() : void
      {
         super.method_109();
         var _loc1_:uint = uint(var_2973);
         if(!method_3310)
         {
            _loc1_--;
         }
         while(_loc1_)
         {
            _totalDuration += var_625[--_loc1_];
         }
      }
      
      public function method_3962() : void
      {
         this.var_147.length = 0;
         var_625.length = 0;
         var_2973 = 0;
         _totalDuration = 0;
         var_4034 = 0;
         var_3419 = true;
      }
   }
}
