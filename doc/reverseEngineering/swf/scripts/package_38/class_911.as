package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_911 implements ICommand
   {
      
      public static const ID:int = 15267;
       
      
      public var name_167:int = 0;
      
      public var name_4:Number = 0;
      
      public var name_153:Vector.<class_439>;
      
      public var name_75:class_439;
      
      public var var_3355:String = "";
      
      public function class_911(param1:String = "", param2:class_439 = null, param3:Vector.<class_439> = null, param4:int = 0, param5:Number = 0)
      {
         super();
         this.var_3355 = param1;
         if(param2 == null)
         {
            this.name_75 = new class_439();
         }
         else
         {
            this.name_75 = param2;
         }
         if(param3 == null)
         {
            this.name_153 = new Vector.<class_439>();
         }
         else
         {
            this.name_153 = param3;
         }
         this.name_167 = param4;
         this.name_4 = param5;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 18;
      }
      
      public function read(param1:IDataInput) : void
      {
         var _loc4_:* = null;
         this.name_167 = param1.readInt();
         this.name_167 = Number(this.name_167) << 6 | Number(this.name_167) >>> 26;
         param1.readShort();
         this.name_4 = param1.readDouble();
         param1.readShort();
         var _loc2_:Number = 0;
         var _loc3_:* = 0;
         while(this.name_153.length > 0)
         {
            this.name_153.pop();
         }
         _loc2_ = 0;
         _loc3_ = uint(param1.readInt());
         while(_loc2_ < _loc3_)
         {
            (_loc4_ = class_127.getInstance().createInstance(param1.readShort()) as class_439).read(param1);
            this.name_153.push(_loc4_);
            _loc2_++;
         }
         this.name_75 = class_127.getInstance().createInstance(param1.readShort()) as class_439;
         this.name_75.read(param1);
         this.var_3355 = param1.readUTF();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         var _loc2_:* = null;
         param1.writeInt(Number(this.name_167) >>> 6 | Number(this.name_167) << 26);
         param1.writeShort(-12248);
         param1.writeDouble(this.name_4);
         param1.writeShort(12530);
         param1.writeInt(this.name_153.length);
         for each(_loc2_ in this.name_153)
         {
            _loc2_.write(param1);
         }
         this.name_75.write(param1);
         param1.writeUTF(this.var_3355);
      }
   }
}
