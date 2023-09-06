package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_454 implements ICommand
   {
      
      public static const ID:int = 16203;
       
      
      public var var_1376:int = 0;
      
      public var var_1514:int = 0;
      
      public var var_3366:Boolean = false;
      
      public var list:Vector.<class_827>;
      
      public function class_454(param1:Vector.<class_827> = null, param2:Boolean = false, param3:int = 0, param4:int = 0)
      {
         super();
         if(param1 == null)
         {
            this.list = new Vector.<class_827>();
         }
         else
         {
            this.list = param1;
         }
         this.var_3366 = param2;
         this.var_1514 = param3;
         this.var_1376 = param4;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 13;
      }
      
      public function read(param1:IDataInput) : void
      {
         var _loc4_:* = null;
         this.var_1376 = param1.readInt();
         this.var_1376 = Number(this.var_1376) << 10 | Number(this.var_1376) >>> 22;
         this.var_1514 = param1.readInt();
         this.var_1514 = Number(this.var_1514) >>> 6 | Number(this.var_1514) << 26;
         this.var_3366 = param1.readBoolean();
         var _loc2_:Number = 0;
         var _loc3_:* = 0;
         while(this.list.length > 0)
         {
            this.list.pop();
         }
         _loc2_ = 0;
         _loc3_ = uint(param1.readInt());
         while(_loc2_ < _loc3_)
         {
            (_loc4_ = class_127.getInstance().createInstance(param1.readShort()) as class_827).read(param1);
            this.list.push(_loc4_);
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
         var _loc2_:* = null;
         param1.writeInt(Number(this.var_1376) >>> 10 | Number(this.var_1376) << 22);
         param1.writeInt(Number(this.var_1514) << 6 | Number(this.var_1514) >>> 26);
         param1.writeBoolean(this.var_3366);
         param1.writeInt(this.list.length);
         for each(_loc2_ in this.list)
         {
            _loc2_.write(param1);
         }
      }
   }
}
