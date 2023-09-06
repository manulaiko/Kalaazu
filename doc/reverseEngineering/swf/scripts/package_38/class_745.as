package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_745 implements ICommand
   {
      
      public static const const_2096:uint = 10;
      
      public static const const_2129:uint = 33;
      
      public static const NONE:uint = 0;
      
      public static const const_1248:uint = 41;
      
      public static const const_898:uint = 2;
      
      public static const const_1987:uint = 6;
      
      public static const const_1092:uint = 22;
      
      public static const BATTLE_REPAIR_BOT:uint = 18;
      
      public static const MINE:uint = 1;
      
      public static const const_1070:uint = 8;
      
      public static const const_1659:uint = 27;
      
      public static const ROCKET_LAUNCHER:uint = 11;
      
      public static const const_3239:uint = 25;
      
      public static const const_3134:uint = 32;
      
      public static const const_1293:uint = 19;
      
      public static const const_1052:uint = 29;
      
      public static const const_1172:uint = 36;
      
      public static const const_1675:uint = 3;
      
      public static const SPEED_LEECH:uint = 17;
      
      public static const const_2556:uint = 38;
      
      public static const const_2034:uint = 23;
      
      public static const const_449:uint = 20;
      
      public static const const_1331:uint = 26;
      
      public static const SPEED_BUFF:uint = 35;
      
      public static const const_1235:uint = 44;
      
      public static const SHIELD_BACKUP:uint = 16;
      
      public static const const_163:uint = 30;
      
      public static const const_1859:uint = 5;
      
      public static const const_952:uint = 12;
      
      public static const ENERGY_CHAIN_IMPULSE:uint = 14;
      
      public static const const_2403:uint = 28;
      
      public static const PLASMA:uint = 7;
      
      public static const ROCKET_PROBABILITY_MAXIMIZER:uint = 15;
      
      public static const ROCKET:uint = 4;
      
      public static const const_2771:uint = 42;
      
      public static const const_1432:uint = 31;
      
      public static const const_207:uint = 9;
      
      public static const const_374:uint = 24;
      
      public static const const_2871:uint = 43;
      
      public static const const_2596:uint = 37;
      
      public static const const_1823:uint = 39;
      
      public static const const_295:uint = 21;
      
      public static const SINGULARITY:uint = 34;
      
      public static const const_2293:uint = 40;
      
      public static const ENERGY_LEECH_ARRAY:uint = 13;
      
      public static const ID:int = 7786;
       
      
      public var var_2008:uint = 0;
      
      public function class_745(param1:uint = 0)
      {
         super();
         this.var_2008 = param1;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 0;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.var_2008 = param1.readShort();
         param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeShort(this.var_2008);
         param1.writeShort(5387);
      }
   }
}
