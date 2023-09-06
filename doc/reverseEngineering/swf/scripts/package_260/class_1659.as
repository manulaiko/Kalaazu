package package_260
{
   import net.bigpoint.darkorbit.settings.Settings;
   
   public class class_1659
   {
      
      public static const const_539:uint = 0;
      
      public static const const_2358:uint = 1;
      
      public static const const_1624:uint = 2;
      
      public static const const_2453:uint = 3;
      
      public static const const_1891:uint = 4;
      
      public static const const_1517:uint = 5;
      
      public static const const_650:uint = 6;
      
      public static const const_698:uint = 7;
      
      public static const const_2640:uint = 8;
      
      public static const const_861:uint = 1;
      
      public static const const_3196:uint = 2;
      
      public static const const_3261:uint = 3;
      
      public static const const_2331:uint = 4;
      
      public static const const_1772:uint = 5;
       
      
      private var var_941:int;
      
      private var var_2455:int;
      
      private var _level:int;
      
      private var var_2400:uint;
      
      private var var_437:uint;
      
      private var var_2800:String;
      
      private var var_1480:Boolean = false;
      
      private var var_4671:Boolean;
      
      private var var_982:Vector.<uint>;
      
      private var var_1511:String;
      
      public function class_1659(param1:String = null, param2:uint = 0, param3:int = -1, param4:int = -1, param5:Vector.<uint> = null, param6:uint = 1, param7:Boolean = false, param8:String = null)
      {
         this.var_982 = new Vector.<uint>();
         super();
         this.var_1511 = param1;
         this.var_2400 = param2;
         this.var_941 = param3;
         this.var_2455 = param4;
         if(param5)
         {
            this.var_982 = param5;
         }
         this.var_437 = param6;
         this.var_4671 = param7;
         this.var_2800 = param8;
      }
      
      public function set name_148(param1:String) : void
      {
         this.var_1511 = param1;
      }
      
      public function get name_148() : String
      {
         return this.var_1511;
      }
      
      public function set method_398(param1:uint) : void
      {
         this.var_2400 = param1;
      }
      
      public function get method_398() : uint
      {
         return this.var_2400;
      }
      
      public function set userID(param1:int) : void
      {
         this.var_941 = param1;
      }
      
      public function get userID() : int
      {
         return this.var_941;
      }
      
      public function set mapID(param1:int) : void
      {
         this.var_2455 = param1;
      }
      
      public function get mapID() : int
      {
         return this.var_2455;
      }
      
      public function set level(param1:int) : void
      {
         this._level = param1;
      }
      
      public function get level() : int
      {
         return this._level;
      }
      
      public function set name_98(param1:int) : void
      {
         this.var_437 = param1;
      }
      
      public function get name_98() : int
      {
         return this.var_437;
      }
      
      public function set name_145(param1:String) : void
      {
         this.var_2800 = param1;
      }
      
      public function get name_145() : String
      {
         return this.var_2800;
      }
      
      public function method_2938(param1:uint) : void
      {
         this.var_982.push(param1);
      }
      
      public function method_3706(param1:uint) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.var_982.length)
         {
            if(this.var_982[_loc2_] == param1)
            {
               this.var_982.splice(_loc2_,1);
            }
            _loc2_++;
         }
      }
      
      public function hasState(param1:uint) : Boolean
      {
         var _loc2_:int = 0;
         for each(_loc2_ in this.var_982)
         {
            if(_loc2_ == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      public function method_1281() : void
      {
         this.var_982 = new Vector.<uint>();
      }
      
      public function method_6398() : Vector.<uint>
      {
         return this.var_982;
      }
      
      public function set name_81(param1:Boolean) : void
      {
         this.var_4671 = param1;
      }
      
      public function get name_81() : Boolean
      {
         return this.var_4671;
      }
      
      public function method_1438() : void
      {
         if(this.hasState(const_1517))
         {
            this.method_398 = class_1659.const_1517;
         }
         else if(!this.name_81)
         {
            this.method_398 = class_1659.const_1624;
         }
         else if(Settings.mapID == this.mapID)
         {
            this.method_398 = class_1659.const_2453;
         }
         else
         {
            this.method_398 = class_1659.const_2358;
         }
      }
      
      public function method_4171() : Boolean
      {
         return this.var_1480;
      }
      
      public function set method_1934(param1:Boolean) : void
      {
         this.var_1480 = param1;
      }
      
      public function clone() : class_1659
      {
         var _loc1_:* = null;
         _loc1_ = this.method_6398();
         if(_loc1_)
         {
            _loc1_ = _loc1_.slice();
         }
         return new class_1659(this.name_148,this.method_398,this.userID,this.mapID,_loc1_,this.name_98,this.name_81,this.name_145);
      }
   }
}
