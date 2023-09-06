package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_486 implements ICommand
   {
      
      public static const DISTANCE:uint = 12;
      
      public static const const_567:uint = 25;
      
      public static const AVOID_KILL_PLAYERS:uint = 35;
      
      public static const MULTIPLIER:uint = 42;
      
      public static const const_203:uint = 61;
      
      public static const DAMAGE_PLAYERS:uint = 30;
      
      public static const QUICK_BUY:uint = 54;
      
      public static const REAL_TIME_HASTE:uint = 60;
      
      public static const ENTER_GROUP:uint = 55;
      
      public static const SELL_ORE:uint = 49;
      
      public static const const_1487:uint = 51;
      
      public static const STAY_AWAY:uint = 43;
      
      public static const AMMUNITION:uint = 20;
      
      public static const EMPTY:uint = 18;
      
      public static const UPDATE_SKYLAB_TO_LEVEL:uint = 72;
      
      public static const HASTE:uint = 2;
      
      public static const SPEND_AMMUNITION:uint = 22;
      
      public static const AVOID_DAMAGE_PLAYERS:uint = 37;
      
      public static const DIE:uint = 32;
      
      public static const TAKE_DAMAGE:uint = 9;
      
      public static const COLLECT_BONUS_BOX:uint = 52;
      
      public static const const_2980:uint = 58;
      
      public static const VISIT_JUMP_GATE_TO_MAP_TYPE:uint = 69;
      
      public static const PREVENT:uint = 38;
      
      public static const RESTRICT_AMMUNITION_KILL_NPC:uint = 56;
      
      public static const PUT_ITEM_IN_SLOT_BAR:uint = 66;
      
      public static const COUNTDOWN:uint = 4;
      
      public static const KILL_NPCS:uint = 27;
      
      public static const FINISH_GALAXY_GATE:uint = 75;
      
      public static const SALVAGE:uint = 23;
      
      public static const USE_ORE_UPDATE:uint = 68;
      
      public static const CARGO:uint = 48;
      
      public static const BEACON_TAKEOVER:uint = 74;
      
      public static const STEADINESS:uint = 41;
      
      public static const IN_GROUP:uint = 44;
      
      public static const SAVE_AMMUNITION:uint = 21;
      
      public static const COLLECT:uint = 5;
      
      public static const COLLECT_LOOT:uint = 63;
      
      public static const CLIENT:uint = 47;
      
      public static const AVOID_JUMP:uint = 40;
      
      public static const IN_CLAN:uint = 62;
      
      public static const WEB:uint = 46;
      
      public static const TRAVEL:uint = 13;
      
      public static const VISIT_MAP:uint = 31;
      
      public static const AVOID_KILL_NPC:uint = 33;
      
      public static const TIMER:uint = 1;
      
      public static const MAP_DIVERSE:uint = 17;
      
      public static const DAMAGE_NPCS:uint = 29;
      
      public static const KILL_ANY:uint = 45;
      
      public static const VISIT_MAP_ASSET:uint = 71;
      
      public static const const_1818:uint = 77;
      
      public static const DAMAGE:uint = 7;
      
      public static const const_3100:uint = 67;
      
      public static const LEVEL:uint = 50;
      
      public static const FUEL_SHORTAGE:uint = 14;
      
      public static const AVOID_DAMAGE:uint = 8;
      
      public static const PROXIMITY:uint = 15;
      
      public static const JUMP:uint = 39;
      
      public static const KILL_PLAYERS:uint = 28;
      
      public static const MISCELLANEOUS:uint = 19;
      
      public static const ENDURANCE:uint = 3;
      
      public static const AVOID_DEATH:uint = 10;
      
      public static const ACTIVATE_MAP_ASSET_TYPE:uint = 70;
      
      public static const VISIT_QUEST_GIVER:uint = 59;
      
      public static const STEAL:uint = 24;
      
      public static const MAP:uint = 16;
      
      public static const GAIN_INFLUENCE:uint = 76;
      
      public static const const_856:uint = 73;
      
      public static const const_1339:uint = 53;
      
      public static const RESTRICT_AMMUNITION_KILL_PLAYER:uint = 57;
      
      public static const REFINE_ORE:uint = 65;
      
      public static const KILL_NPC:uint = 6;
      
      public static const AVOID_DAMAGE_NPCS:uint = 36;
      
      public static const FINISH_STARTER_GATE:uint = 64;
      
      public static const AVOID_KILL_NPCS:uint = 34;
      
      public static const const_1600:uint = 26;
      
      public static const const_1311:uint = 0;
      
      public static const COORDINATES:uint = 11;
      
      public static const ID:int = 26664;
       
      
      public var var_1284:uint = 0;
      
      public var state:class_871;
      
      public var type:uint = 0;
      
      public var var_3103:Vector.<class_486>;
      
      public var id:int = 0;
      
      public var var_4154:Vector.<String>;
      
      public var name_62:Boolean = false;
      
      public var var_2022:Number = 0;
      
      public function class_486(param1:int = 0, param2:Vector.<String> = null, param3:uint = 0, param4:uint = 0, param5:Number = 0, param6:Boolean = false, param7:class_871 = null, param8:Vector.<class_486> = null)
      {
         super();
         this.id = param1;
         if(param2 == null)
         {
            this.var_4154 = new Vector.<String>();
         }
         else
         {
            this.var_4154 = param2;
         }
         this.type = param3;
         this.var_1284 = param4;
         this.var_2022 = param5;
         this.name_62 = param6;
         if(param7 == null)
         {
            this.state = new class_871();
         }
         else
         {
            this.state = param7;
         }
         if(param8 == null)
         {
            this.var_3103 = new Vector.<class_486>();
         }
         else
         {
            this.var_3103 = param8;
         }
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 21;
      }
      
      public function read(param1:IDataInput) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         this.var_1284 = param1.readShort();
         this.state = class_127.getInstance().createInstance(param1.readShort()) as class_871;
         this.state.read(param1);
         this.type = param1.readShort();
         var _loc2_:Number = 0;
         var _loc3_:* = 0;
         while(this.var_3103.length > 0)
         {
            this.var_3103.pop();
         }
         _loc2_ = 0;
         _loc3_ = uint(param1.readInt());
         while(_loc2_ < _loc3_)
         {
            (_loc4_ = class_127.getInstance().createInstance(param1.readShort()) as class_486).read(param1);
            this.var_3103.push(_loc4_);
            _loc2_++;
         }
         this.id = param1.readInt();
         this.id = Number(this.id) >>> 10 | Number(this.id) << 22;
         while(this.var_4154.length > 0)
         {
            this.var_4154.pop();
         }
         _loc2_ = 0;
         _loc3_ = uint(param1.readInt());
         while(_loc2_ < _loc3_)
         {
            _loc5_ = param1.readUTF();
            this.var_4154.push(_loc5_);
            _loc2_++;
         }
         this.name_62 = param1.readBoolean();
         this.var_2022 = param1.readDouble();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         param1.writeShort(this.var_1284);
         this.state.write(param1);
         param1.writeShort(this.type);
         param1.writeInt(this.var_3103.length);
         for each(_loc2_ in this.var_3103)
         {
            _loc2_.write(param1);
         }
         param1.writeInt(Number(this.id) << 10 | Number(this.id) >>> 22);
         param1.writeInt(this.var_4154.length);
         for each(_loc3_ in this.var_4154)
         {
            param1.writeUTF(_loc3_);
         }
         param1.writeBoolean(this.name_62);
         param1.writeDouble(this.var_2022);
      }
   }
}
