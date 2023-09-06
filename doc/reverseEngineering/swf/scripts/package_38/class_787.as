package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_787 implements ICommand
   {
      
      public static const const_2158:uint = 0;
      
      public static const const_2746:uint = 1;
      
      public static const ID:int = 23101;
       
      
      public var var_572:uint = 0;
      
      public var var_3699:int = 0;
      
      public var opponent:class_439;
      
      public var name_93:int = 0;
      
      public var var_2596:int = 0;
      
      public var var_1965:int = 0;
      
      public var var_3387:int = 0;
      
      public var var_917:int = 0;
      
      public function class_787(param1:int = 0, param2:class_439 = null, param3:uint = 0, param4:int = 0, param5:int = 0, param6:int = 0, param7:int = 0, param8:int = 0)
      {
         super();
         this.name_93 = param1;
         if(param2 == null)
         {
            this.opponent = new class_439();
         }
         else
         {
            this.opponent = param2;
         }
         this.var_572 = param3;
         this.var_3387 = param4;
         this.var_917 = param5;
         this.var_2596 = param6;
         this.var_1965 = param7;
         this.var_3699 = param8;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 24;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.var_572 = param1.readShort();
         this.var_3699 = param1.readInt();
         this.var_3699 = Number(this.var_3699) >>> 9 | Number(this.var_3699) << 23;
         this.opponent = class_127.getInstance().createInstance(param1.readShort()) as class_439;
         this.opponent.read(param1);
         this.name_93 = param1.readInt();
         this.name_93 = Number(this.name_93) >>> 2 | Number(this.name_93) << 30;
         this.var_2596 = param1.readInt();
         this.var_2596 = Number(this.var_2596) >>> 8 | Number(this.var_2596) << 24;
         this.var_1965 = param1.readInt();
         this.var_1965 = Number(this.var_1965) << 4 | Number(this.var_1965) >>> 28;
         this.var_3387 = param1.readInt();
         this.var_3387 = Number(this.var_3387) >>> 11 | Number(this.var_3387) << 21;
         this.var_917 = param1.readInt();
         this.var_917 = Number(this.var_917) >>> 5 | Number(this.var_917) << 27;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeShort(this.var_572);
         param1.writeInt(Number(this.var_3699) << 9 | Number(this.var_3699) >>> 23);
         this.opponent.write(param1);
         param1.writeInt(Number(this.name_93) << 2 | Number(this.name_93) >>> 30);
         param1.writeInt(Number(this.var_2596) << 8 | Number(this.var_2596) >>> 24);
         param1.writeInt(Number(this.var_1965) >>> 4 | Number(this.var_1965) << 28);
         param1.writeInt(Number(this.var_3387) << 11 | Number(this.var_3387) >>> 21);
         param1.writeInt(Number(this.var_917) << 5 | Number(this.var_917) >>> 27);
      }
   }
}
