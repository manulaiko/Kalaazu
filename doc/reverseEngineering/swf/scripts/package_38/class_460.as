package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_460 implements ICommand
   {
      
      public static const WIN:uint = 0;
      
      public static const const_474:uint = 3;
      
      public static const const_465:uint = 2;
      
      public static const const_2658:uint = 1;
      
      public static const ID:int = 13039;
       
      
      public var var_4019:Vector.<class_682>;
      
      public var var_3432:Vector.<class_682>;
      
      public var name_122:class_601;
      
      public var var_2457:uint = 0;
      
      public var var_1071:int = 0;
      
      public var rewards:Vector.<class_563>;
      
      public var var_4243:class_439;
      
      public var var_596:int = 0;
      
      public var var_3014:class_439;
      
      public function class_460(param1:uint = 0, param2:int = 0, param3:int = 0, param4:class_439 = null, param5:class_439 = null, param6:Vector.<class_682> = null, param7:Vector.<class_682> = null, param8:Vector.<class_563> = null, param9:class_601 = null)
      {
         super();
         this.var_2457 = param1;
         this.var_1071 = param2;
         this.var_596 = param3;
         if(param4 == null)
         {
            this.var_4243 = new class_439();
         }
         else
         {
            this.var_4243 = param4;
         }
         if(param5 == null)
         {
            this.var_3014 = new class_439();
         }
         else
         {
            this.var_3014 = param5;
         }
         if(param6 == null)
         {
            this.var_3432 = new Vector.<class_682>();
         }
         else
         {
            this.var_3432 = param6;
         }
         if(param7 == null)
         {
            this.var_4019 = new Vector.<class_682>();
         }
         else
         {
            this.var_4019 = param7;
         }
         if(param8 == null)
         {
            this.rewards = new Vector.<class_563>();
         }
         else
         {
            this.rewards = param8;
         }
         if(param9 == null)
         {
            this.name_122 = new class_601();
         }
         else
         {
            this.name_122 = param9;
         }
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 20;
      }
      
      public function read(param1:IDataInput) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         param1.readShort();
         var _loc2_:Number = 0;
         var _loc3_:* = 0;
         while(this.var_4019.length > 0)
         {
            this.var_4019.pop();
         }
         _loc2_ = 0;
         _loc3_ = uint(param1.readInt());
         while(_loc2_ < _loc3_)
         {
            (_loc4_ = class_127.getInstance().createInstance(param1.readShort()) as class_682).read(param1);
            this.var_4019.push(_loc4_);
            _loc2_++;
         }
         while(this.var_3432.length > 0)
         {
            this.var_3432.pop();
         }
         _loc2_ = 0;
         _loc3_ = uint(param1.readInt());
         while(_loc2_ < _loc3_)
         {
            (_loc5_ = class_127.getInstance().createInstance(param1.readShort()) as class_682).read(param1);
            this.var_3432.push(_loc5_);
            _loc2_++;
         }
         this.name_122 = class_127.getInstance().createInstance(param1.readShort()) as class_601;
         this.name_122.read(param1);
         this.var_2457 = param1.readShort();
         this.var_1071 = param1.readInt();
         this.var_1071 = Number(this.var_1071) << 9 | Number(this.var_1071) >>> 23;
         while(this.rewards.length > 0)
         {
            this.rewards.pop();
         }
         _loc2_ = 0;
         _loc3_ = uint(param1.readInt());
         while(_loc2_ < _loc3_)
         {
            (_loc6_ = class_127.getInstance().createInstance(param1.readShort()) as class_563).read(param1);
            this.rewards.push(_loc6_);
            _loc2_++;
         }
         this.var_4243 = class_127.getInstance().createInstance(param1.readShort()) as class_439;
         this.var_4243.read(param1);
         param1.readShort();
         this.var_596 = param1.readInt();
         this.var_596 = Number(this.var_596) >>> 11 | Number(this.var_596) << 21;
         this.var_3014 = class_127.getInstance().createInstance(param1.readShort()) as class_439;
         this.var_3014.read(param1);
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         param1.writeShort(21391);
         param1.writeInt(this.var_4019.length);
         for each(_loc2_ in this.var_4019)
         {
            _loc2_.write(param1);
         }
         param1.writeInt(this.var_3432.length);
         for each(_loc3_ in this.var_3432)
         {
            _loc3_.write(param1);
         }
         this.name_122.write(param1);
         param1.writeShort(this.var_2457);
         param1.writeInt(Number(this.var_1071) >>> 9 | Number(this.var_1071) << 23);
         param1.writeInt(this.rewards.length);
         for each(_loc4_ in this.rewards)
         {
            _loc4_.write(param1);
         }
         this.var_4243.write(param1);
         param1.writeShort(9868);
         param1.writeInt(Number(this.var_596) << 11 | Number(this.var_596) >>> 21);
         this.var_3014.write(param1);
      }
   }
}
