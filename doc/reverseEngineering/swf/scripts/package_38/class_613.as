package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_613 implements ICommand
   {
      
      public static const ID:int = 2496;
       
      
      public var var_1633:int = 0;
      
      public var name_113:Vector.<class_571>;
      
      public var id:int = 0;
      
      public var var_1389:class_719;
      
      public var var_4575:int = 0;
      
      public function class_613(param1:int = 0, param2:int = 0, param3:int = 0, param4:Vector.<class_571> = null, param5:class_719 = null)
      {
         super();
         this.id = param1;
         this.var_1633 = param2;
         this.var_4575 = param3;
         if(param4 == null)
         {
            this.name_113 = new Vector.<class_571>();
         }
         else
         {
            this.name_113 = param4;
         }
         if(param5 == null)
         {
            this.var_1389 = new class_719();
         }
         else
         {
            this.var_1389 = param5;
         }
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 16;
      }
      
      public function read(param1:IDataInput) : void
      {
         var _loc4_:* = null;
         this.var_1633 = param1.readInt();
         this.var_1633 = Number(this.var_1633) >>> 12 | Number(this.var_1633) << 20;
         var _loc2_:Number = 0;
         var _loc3_:* = 0;
         while(this.name_113.length > 0)
         {
            this.name_113.pop();
         }
         _loc2_ = 0;
         _loc3_ = uint(param1.readInt());
         while(_loc2_ < _loc3_)
         {
            (_loc4_ = class_127.getInstance().createInstance(param1.readShort()) as class_571).read(param1);
            this.name_113.push(_loc4_);
            _loc2_++;
         }
         this.id = param1.readInt();
         this.id = Number(this.id) << 16 | Number(this.id) >>> 16;
         this.var_1389 = class_127.getInstance().createInstance(param1.readShort()) as class_719;
         this.var_1389.read(param1);
         this.var_4575 = param1.readInt();
         this.var_4575 = Number(this.var_4575) << 15 | Number(this.var_4575) >>> 17;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         var _loc2_:* = null;
         param1.writeInt(Number(this.var_1633) << 12 | Number(this.var_1633) >>> 20);
         param1.writeInt(this.name_113.length);
         for each(_loc2_ in this.name_113)
         {
            _loc2_.write(param1);
         }
         param1.writeInt(Number(this.id) >>> 16 | Number(this.id) << 16);
         this.var_1389.write(param1);
         param1.writeInt(Number(this.var_4575) >>> 15 | Number(this.var_4575) << 17);
      }
   }
}
