package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_836 implements ICommand
   {
      
      public static const const_87:uint = 0;
      
      public static const PVP:uint = 1;
      
      public static const const_647:uint = 0;
      
      public static const const_23:uint = 1;
      
      public static const ID:int = 802;
       
      
      public var var_4444:uint = 0;
      
      public var var_2168:int = 0;
      
      public var var_4237:Vector.<int>;
      
      public var var_4863:uint = 0;
      
      public function class_836(param1:uint = 0, param2:uint = 0, param3:Vector.<int> = null, param4:int = 0)
      {
         super();
         this.var_4444 = param1;
         this.var_4863 = param2;
         if(param3 == null)
         {
            this.var_4237 = new Vector.<int>();
         }
         else
         {
            this.var_4237 = param3;
         }
         this.var_2168 = param4;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 8;
      }
      
      public function read(param1:IDataInput) : void
      {
         var _loc4_:* = 0;
         this.var_4444 = param1.readShort();
         this.var_2168 = param1.readInt();
         this.var_2168 = Number(this.var_2168) << 1 | Number(this.var_2168) >>> 31;
         var _loc2_:Number = 0;
         var _loc3_:* = 0;
         while(this.var_4237.length > 0)
         {
            this.var_4237.pop();
         }
         _loc2_ = 0;
         _loc3_ = uint(param1.readInt());
         while(_loc2_ < _loc3_)
         {
            _loc4_ = (_loc4_ = int(param1.readInt())) >>> 5 | _loc4_ << 27;
            this.var_4237.push(_loc4_);
            _loc2_++;
         }
         param1.readShort();
         this.var_4863 = param1.readShort();
         param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         var _loc2_:int = 0;
         param1.writeShort(this.var_4444);
         param1.writeInt(Number(this.var_2168) >>> 1 | Number(this.var_2168) << 31);
         param1.writeInt(this.var_4237.length);
         for each(_loc2_ in this.var_4237)
         {
            param1.writeInt(_loc2_ << 5 | _loc2_ >>> 27);
         }
         param1.writeShort(-5914);
         param1.writeShort(this.var_4863);
         param1.writeShort(11639);
      }
   }
}
