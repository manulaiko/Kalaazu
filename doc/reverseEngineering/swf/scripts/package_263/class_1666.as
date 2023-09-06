package package_263
{
   import package_344.class_1927;
   import package_38.class_529;
   
   public class class_1666
   {
      
      private static const const_1679:int = 3;
      
      private static const const_2052:int = 2;
       
      
      private var var_2840:int = -2147483648;
      
      private var var_3817:int = -2147483648;
      
      private var var_4884:Vector.<class_529>;
      
      private var var_1676:int = -2147483648;
      
      private var var_3147:int = -2147483648;
      
      private var var_1748:Vector.<class_1927>;
      
      public function class_1666()
      {
         this.var_4884 = new Vector.<class_529>();
         this.var_1748 = new Vector.<class_1927>();
         super();
      }
      
      public function get name_48() : int
      {
         return this.var_2840;
      }
      
      public function get name_71() : int
      {
         return this.var_3817;
      }
      
      public function get name_109() : Vector.<class_529>
      {
         return this.var_4884;
      }
      
      public function get name_101() : int
      {
         return this.var_1676;
      }
      
      public function get name_151() : Vector.<class_1927>
      {
         return this.var_1748;
      }
      
      public function set name_48(param1:int) : void
      {
         this.var_2840 = param1;
      }
      
      public function set name_71(param1:int) : void
      {
         this.var_3817 = param1;
      }
      
      public function set name_109(param1:Vector.<class_529>) : void
      {
         this.var_4884 = param1;
      }
      
      public function set name_101(param1:int) : void
      {
         this.var_1676 = param1;
      }
      
      public function set name_89(param1:int) : void
      {
         this.var_3147 = param1;
      }
      
      public function get name_89() : int
      {
         return this.var_3147;
      }
      
      public function method_6169(param1:Vector.<class_529>, param2:int) : void
      {
         var _loc4_:* = null;
         var _loc3_:Vector.<class_1927> = new Vector.<class_1927>();
         var _loc5_:int = 0;
         while(_loc5_ < param1.length)
         {
            _loc4_ = param1[_loc5_];
            _loc3_.push(new class_1927(_loc4_.faction.faction,_loc4_.score,param2));
            _loc5_++;
         }
         this.var_1748 = _loc3_;
      }
      
      public function method_1889(param1:Vector.<class_529>) : Boolean
      {
         var _loc2_:Boolean = false;
         var _loc3_:* = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(param1.length != this.var_4884.length)
         {
            _loc2_ = true;
         }
         else
         {
            _loc3_ = param1.length;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc5_ = this.var_4884[_loc4_];
               _loc6_ = param1[_loc4_];
               if(_loc5_.score != _loc6_.score || _loc5_.faction.faction != _loc6_.faction.faction)
               {
                  _loc2_ = true;
                  break;
               }
               _loc4_++;
            }
         }
         return _loc2_;
      }
      
      public function method_2329(param1:Vector.<class_529>) : Boolean
      {
         var _loc2_:Boolean = false;
         var _loc3_:* = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(param1.length != this.var_1748.length)
         {
            _loc2_ = true;
         }
         else
         {
            _loc3_ = param1.length;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc5_ = this.var_1748[_loc4_];
               _loc6_ = param1[_loc4_];
               if(_loc5_.score != _loc6_.score || _loc5_.faction != _loc6_.faction.faction)
               {
                  _loc2_ = true;
                  break;
               }
               _loc4_++;
            }
         }
         return _loc2_;
      }
   }
}
