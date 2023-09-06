package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_315 implements ICommand
   {
      
      public static const const_1659:uint = 2;
      
      public static const const_762:uint = 50;
      
      public static const const_3057:uint = 32;
      
      public static const const_513:uint = 53;
      
      public static const const_2519:uint = 47;
      
      public static const const_1330:uint = 43;
      
      public static const const_253:uint = 38;
      
      public static const ENERGY_LEECH_ARRAY:uint = 52;
      
      public static const const_1237:uint = 39;
      
      public static const const_1051:uint = 3;
      
      public static const const_1307:uint = 7;
      
      public static const const_3311:uint = 49;
      
      public static const const_617:uint = 5;
      
      public static const const_3142:uint = 31;
      
      public static const const_434:uint = 15;
      
      public static const INACTIVE:uint = 8;
      
      public static const const_2214:uint = 20;
      
      public static const const_734:uint = 48;
      
      public static const const_2207:uint = 36;
      
      public static const const_3246:uint = 28;
      
      public static const const_320:uint = 37;
      
      public static const const_3238:uint = 19;
      
      public static const INVINCIBILITY:uint = 26;
      
      public static const const_2546:uint = 45;
      
      public static const const_2040:uint = 51;
      
      public static const const_2862:uint = 25;
      
      public static const const_622:uint = 22;
      
      public static const const_431:uint = 42;
      
      public static const const_917:uint = 33;
      
      public static const const_957:uint = 24;
      
      public static const const_1964:uint = 29;
      
      public static const const_2996:uint = 10;
      
      public static const const_91:uint = 27;
      
      public static const SINGULARITY:uint = 13;
      
      public static const const_61:uint = 35;
      
      public static const const_501:uint = 16;
      
      public static const const_3239:uint = 0;
      
      public static const const_1689:uint = 46;
      
      public static const const_637:uint = 30;
      
      public static const const_1432:uint = 11;
      
      public static const const_2034:uint = 1;
      
      public static const const_2166:uint = 4;
      
      public static const const_2129:uint = 9;
      
      public static const const_1899:uint = 21;
      
      public static const const_2219:uint = 6;
      
      public static const const_197:uint = 17;
      
      public static const const_1393:uint = 44;
      
      public static const const_1265:uint = 40;
      
      public static const const_3214:uint = 18;
      
      public static const const_1205:uint = 34;
      
      public static const const_196:uint = 14;
      
      public static const const_2128:uint = 23;
      
      public static const const_1099:uint = 12;
      
      public static const const_1405:uint = 41;
      
      public static const ID:int = 12647;
       
      
      public var name_128:int = 0;
      
      public var count:int = 0;
      
      public var var_2522:String = "";
      
      public var activated:Boolean = false;
      
      public var attribute:int = 0;
      
      public var var_2708:uint = 0;
      
      public function class_315(param1:int = 0, param2:uint = 0, param3:int = 0, param4:String = "", param5:int = 0, param6:Boolean = false)
      {
         super();
         this.name_128 = param1;
         this.var_2708 = param2;
         this.attribute = param3;
         this.var_2522 = param4;
         this.count = param5;
         this.activated = param6;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 15;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.name_128 = param1.readInt();
         this.name_128 = Number(this.name_128) >>> 11 | Number(this.name_128) << 21;
         this.count = param1.readInt();
         this.count = Number(this.count) << 15 | Number(this.count) >>> 17;
         this.var_2522 = param1.readUTF();
         this.activated = param1.readBoolean();
         this.attribute = param1.readInt();
         this.attribute = Number(this.attribute) << 3 | Number(this.attribute) >>> 29;
         this.var_2708 = param1.readShort();
         param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.name_128) << 11 | Number(this.name_128) >>> 21);
         param1.writeInt(Number(this.count) >>> 15 | Number(this.count) << 17);
         param1.writeUTF(this.var_2522);
         param1.writeBoolean(this.activated);
         param1.writeInt(Number(this.attribute) >>> 3 | Number(this.attribute) << 29);
         param1.writeShort(this.var_2708);
         param1.writeShort(-18263);
      }
   }
}
