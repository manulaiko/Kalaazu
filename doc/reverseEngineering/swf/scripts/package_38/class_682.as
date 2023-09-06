package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_682 implements ICommand
   {
      
      public static const ID:int = 4439;
       
      
      public var var_739:int = 0;
      
      public var var_2733:Number = 0;
      
      public var name:String = "";
      
      public var var_4057:int = 0;
      
      public var var_3680:Number = 0;
      
      public var var_315:int = 0;
      
      public var var_4590:int = 0;
      
      public var var_4529:int = 0;
      
      public function class_682(param1:int = 0, param2:int = 0, param3:int = 0, param4:Number = 0, param5:Number = 0, param6:int = 0, param7:int = 0, param8:String = "")
      {
         super();
         this.var_739 = param1;
         this.var_4529 = param2;
         this.var_4057 = param3;
         this.var_2733 = param4;
         this.var_3680 = param5;
         this.var_315 = param6;
         this.var_4590 = param7;
         this.name = param8;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 38;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.var_739 = param1.readInt();
         this.var_739 = Number(this.var_739) << 9 | Number(this.var_739) >>> 23;
         param1.readShort();
         this.var_2733 = param1.readDouble();
         this.name = param1.readUTF();
         this.var_4057 = param1.readInt();
         this.var_4057 = Number(this.var_4057) >>> 12 | Number(this.var_4057) << 20;
         this.var_3680 = param1.readDouble();
         this.var_315 = param1.readInt();
         this.var_315 = Number(this.var_315) << 6 | Number(this.var_315) >>> 26;
         this.var_4590 = param1.readInt();
         this.var_4590 = Number(this.var_4590) << 3 | Number(this.var_4590) >>> 29;
         this.var_4529 = param1.readInt();
         this.var_4529 = Number(this.var_4529) << 12 | Number(this.var_4529) >>> 20;
         param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.var_739) >>> 9 | Number(this.var_739) << 23);
         param1.writeShort(-2235);
         param1.writeDouble(this.var_2733);
         param1.writeUTF(this.name);
         param1.writeInt(Number(this.var_4057) << 12 | Number(this.var_4057) >>> 20);
         param1.writeDouble(this.var_3680);
         param1.writeInt(Number(this.var_315) >>> 6 | Number(this.var_315) << 26);
         param1.writeInt(Number(this.var_4590) >>> 3 | Number(this.var_4590) << 29);
         param1.writeInt(Number(this.var_4529) >>> 12 | Number(this.var_4529) << 20);
         param1.writeShort(13216);
      }
   }
}
