package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_452 implements ICommand
   {
      
      public static const const_86:uint = 1;
      
      public static const const_1769:uint = 0;
      
      public static const ID:int = 1470;
       
      
      public var var_4266:int = 0;
      
      public var var_4050:uint = 0;
      
      public var var_21:Vector.<int>;
      
      public function class_452(param1:uint = 0, param2:int = 0, param3:Vector.<int> = null)
      {
         super();
         this.var_4050 = param1;
         this.var_4266 = param2;
         if(param3 == null)
         {
            this.var_21 = new Vector.<int>();
         }
         else
         {
            this.var_21 = param3;
         }
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
         this.var_4266 = param1.readInt();
         this.var_4266 = Number(this.var_4266) >>> 7 | Number(this.var_4266) << 25;
         this.var_4050 = param1.readShort();
         param1.readShort();
         var _loc2_:Number = 0;
         var _loc3_:* = 0;
         while(this.var_21.length > 0)
         {
            this.var_21.pop();
         }
         _loc2_ = 0;
         _loc3_ = uint(param1.readInt());
         while(_loc2_ < _loc3_)
         {
            _loc4_ = (_loc4_ = int(param1.readInt())) << 12 | _loc4_ >>> 20;
            this.var_21.push(_loc4_);
            _loc2_++;
         }
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         var _loc2_:int = 0;
         param1.writeInt(Number(this.var_4266) << 7 | Number(this.var_4266) >>> 25);
         param1.writeShort(this.var_4050);
         param1.writeShort(-5041);
         param1.writeInt(this.var_21.length);
         for each(_loc2_ in this.var_21)
         {
            param1.writeInt(_loc2_ >>> 12 | _loc2_ << 20);
         }
      }
   }
}
