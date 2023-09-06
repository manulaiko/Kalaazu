package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_564 implements ICommand
   {
      
      public static const ID:int = 25425;
       
      
      public var name_57:int = 0;
      
      public var name_66:int = 0;
      
      public var name_68:int = 0;
      
      public var name_125:int = 0;
      
      public var name_6:int = 0;
      
      public var name_138:int = 0;
      
      public var name_86:int = 0;
      
      public var name_165:int = 0;
      
      public var name_80:int = 0;
      
      public var name_46:int = 0;
      
      public function class_564(param1:int = 0, param2:int = 0, param3:int = 0, param4:int = 0, param5:int = 0, param6:int = 0, param7:int = 0, param8:int = 0, param9:int = 0, param10:int = 0)
      {
         super();
         this.name_6 = param1;
         this.name_46 = param2;
         this.name_80 = param3;
         this.name_66 = param4;
         this.name_165 = param5;
         this.name_68 = param6;
         this.name_57 = param7;
         this.name_125 = param8;
         this.name_138 = param9;
         this.name_86 = param10;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 40;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.name_57 = param1.readInt();
         this.name_57 = Number(this.name_57) << 2 | Number(this.name_57) >>> 30;
         this.name_66 = param1.readInt();
         this.name_66 = Number(this.name_66) >>> 12 | Number(this.name_66) << 20;
         param1.readShort();
         param1.readShort();
         this.name_68 = param1.readInt();
         this.name_68 = Number(this.name_68) << 1 | Number(this.name_68) >>> 31;
         this.name_125 = param1.readInt();
         this.name_125 = Number(this.name_125) >>> 6 | Number(this.name_125) << 26;
         this.name_6 = param1.readInt();
         this.name_6 = Number(this.name_6) << 7 | Number(this.name_6) >>> 25;
         this.name_138 = param1.readInt();
         this.name_138 = Number(this.name_138) << 14 | Number(this.name_138) >>> 18;
         this.name_86 = param1.readInt();
         this.name_86 = Number(this.name_86) << 6 | Number(this.name_86) >>> 26;
         this.name_165 = param1.readInt();
         this.name_165 = Number(this.name_165) << 11 | Number(this.name_165) >>> 21;
         this.name_80 = param1.readInt();
         this.name_80 = Number(this.name_80) << 9 | Number(this.name_80) >>> 23;
         this.name_46 = param1.readInt();
         this.name_46 = Number(this.name_46) >>> 15 | Number(this.name_46) << 17;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.name_57) >>> 2 | Number(this.name_57) << 30);
         param1.writeInt(Number(this.name_66) << 12 | Number(this.name_66) >>> 20);
         param1.writeShort(-23056);
         param1.writeShort(22778);
         param1.writeInt(Number(this.name_68) >>> 1 | Number(this.name_68) << 31);
         param1.writeInt(Number(this.name_125) << 6 | Number(this.name_125) >>> 26);
         param1.writeInt(Number(this.name_6) >>> 7 | Number(this.name_6) << 25);
         param1.writeInt(Number(this.name_138) >>> 14 | Number(this.name_138) << 18);
         param1.writeInt(Number(this.name_86) >>> 6 | Number(this.name_86) << 26);
         param1.writeInt(Number(this.name_165) >>> 11 | Number(this.name_165) << 21);
         param1.writeInt(Number(this.name_80) >>> 9 | Number(this.name_80) << 23);
         param1.writeInt(Number(this.name_46) << 15 | Number(this.name_46) >>> 17);
      }
   }
}
