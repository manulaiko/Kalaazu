package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_672 implements ICommand
   {
      
      public static const JUMP_GATES:uint = 6;
      
      public static const JUMP_DEVICE:uint = 20;
      
      public static const ITEM_UPGRADE:uint = 23;
      
      public static const SHIP_REPAIR:uint = 0;
      
      public static const WELCOME:uint = 12;
      
      public static const SKYLAB:uint = 1;
      
      public static const TECH_FACTORY:uint = 26;
      
      public static const ROCKET_LAUNCHER:uint = 30;
      
      public static const POLICY_CHANGES:uint = 16;
      
      public static const ORE_TRANSFER:uint = 35;
      
      public static const FULL_CARGO:uint = 21;
      
      public static const INSTALLING_NEW_EQUIPMENT:uint = 5;
      
      public static const SKILL_TREE:uint = 25;
      
      public static const const_1110:uint = 15;
      
      public static const SHIP_DESIGN:uint = 32;
      
      public static const AUCTION_HOUSE:uint = 29;
      
      public static const BOOST_YOUR_EQUIP:uint = 9;
      
      public static const THE_SHOP:uint = 3;
      
      public static const WEALTHY_FAMOUS:uint = 11;
      
      public static const TRAINING_GROUNDS:uint = 36;
      
      public static const PALLADIUM:uint = 28;
      
      public static const CLAN_BATTLE_STATION:uint = 27;
      
      public static const SELL_RESOURCE:uint = 10;
      
      public static const PREPARE_BATTLE:uint = 7;
      
      public static const ATTACK:uint = 19;
      
      public static const EQUIP_YOUR_ROCKETS:uint = 17;
      
      public static const CHANGING_SHIPS:uint = 4;
      
      public static const GALAXY_GATE:uint = 24;
      
      public static const UNKOWN_DANGERS:uint = 18;
      
      public static const const_2835:uint = 37;
      
      public static const CONTACT_LIST:uint = 34;
      
      public static const HOW_TO_FLY:uint = 13;
      
      public static const PVP_WARNING:uint = 2;
      
      public static const GET_MORE_AMMO:uint = 8;
      
      public static const SECOND_CONFIGURATION:uint = 22;
      
      public static const LOOKING_FOR_GROUPS:uint = 33;
      
      public static const REQUEST_MISSION:uint = 14;
      
      public static const EXTRA_CPU:uint = 31;
      
      public static const ID:int = 29864;
       
      
      public var content:uint = 0;
      
      public function class_672(param1:uint = 0)
      {
         super();
         this.content = param1;
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
         param1.readShort();
         this.content = param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeShort(31864);
         param1.writeShort(this.content);
      }
   }
}
