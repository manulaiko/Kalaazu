package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_776 implements ICommand
   {
      
      public static const ID:int = 30475;
       
      
      public var var_365:int = 0;
      
      public var name_93:int = 0;
      
      public var var_1965:int = 0;
      
      public var var_4243:class_439;
      
      public var var_376:int = 0;
      
      public var var_3044:int = 0;
      
      public var var_3014:class_439;
      
      public var var_3387:int = 0;
      
      public var var_2140:int = 0;
      
      public var var_2596:int = 0;
      
      public var var_3789:int = 0;
      
      public function class_776(param1:int = 0, param2:class_439 = null, param3:class_439 = null, param4:int = 0, param5:int = 0, param6:int = 0, param7:int = 0, param8:int = 0, param9:int = 0, param10:int = 0, param11:int = 0)
      {
         super();
         this.name_93 = param1;
         if(param2 == null)
         {
            this.var_4243 = new class_439();
         }
         else
         {
            this.var_4243 = param2;
         }
         if(param3 == null)
         {
            this.var_3014 = new class_439();
         }
         else
         {
            this.var_3014 = param3;
         }
         this.var_3387 = param4;
         this.var_3789 = param5;
         this.var_2596 = param6;
         this.var_1965 = param7;
         this.var_3044 = param8;
         this.var_365 = param9;
         this.var_2140 = param10;
         this.var_376 = param11;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 36;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.var_365 = param1.readInt();
         this.var_365 = Number(this.var_365) << 10 | Number(this.var_365) >>> 22;
         this.name_93 = param1.readInt();
         this.name_93 = Number(this.name_93) >>> 10 | Number(this.name_93) << 22;
         this.var_1965 = param1.readInt();
         this.var_1965 = Number(this.var_1965) >>> 15 | Number(this.var_1965) << 17;
         this.var_4243 = class_127.getInstance().createInstance(param1.readShort()) as class_439;
         this.var_4243.read(param1);
         this.var_376 = param1.readInt();
         this.var_376 = Number(this.var_376) << 2 | Number(this.var_376) >>> 30;
         this.var_3044 = param1.readInt();
         this.var_3044 = Number(this.var_3044) << 1 | Number(this.var_3044) >>> 31;
         this.var_3014 = class_127.getInstance().createInstance(param1.readShort()) as class_439;
         this.var_3014.read(param1);
         this.var_3387 = param1.readInt();
         this.var_3387 = Number(this.var_3387) << 16 | Number(this.var_3387) >>> 16;
         this.var_2140 = param1.readInt();
         this.var_2140 = Number(this.var_2140) >>> 1 | Number(this.var_2140) << 31;
         this.var_2596 = param1.readInt();
         this.var_2596 = Number(this.var_2596) << 16 | Number(this.var_2596) >>> 16;
         this.var_3789 = param1.readInt();
         this.var_3789 = Number(this.var_3789) >>> 9 | Number(this.var_3789) << 23;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.var_365) >>> 10 | Number(this.var_365) << 22);
         param1.writeInt(Number(this.name_93) << 10 | Number(this.name_93) >>> 22);
         param1.writeInt(Number(this.var_1965) << 15 | Number(this.var_1965) >>> 17);
         this.var_4243.write(param1);
         param1.writeInt(Number(this.var_376) >>> 2 | Number(this.var_376) << 30);
         param1.writeInt(Number(this.var_3044) >>> 1 | Number(this.var_3044) << 31);
         this.var_3014.write(param1);
         param1.writeInt(Number(this.var_3387) >>> 16 | Number(this.var_3387) << 16);
         param1.writeInt(Number(this.var_2140) << 1 | Number(this.var_2140) >>> 31);
         param1.writeInt(Number(this.var_2596) >>> 16 | Number(this.var_2596) << 16);
         param1.writeInt(Number(this.var_3789) << 9 | Number(this.var_3789) >>> 23);
      }
   }
}
