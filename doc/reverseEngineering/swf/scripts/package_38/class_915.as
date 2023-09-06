package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_915 implements ICommand
   {
      
      public static const ID:int = 16484;
       
      
      public var displaySetting3DqualityAntialias:int = 0;
      
      public var proActionBarEnabled:Boolean = false;
      
      public var proActionBarAutohideEnabled:Boolean = false;
      
      public var displaySetting3DqualityTextures:int = 0;
      
      public var var_69:Boolean = false;
      
      public var name_16:int = 0;
      
      public var showNotOwnedItems:Boolean = false;
      
      public var displayDrones:Boolean = false;
      
      public var displayNotifications:Boolean = false;
      
      public var displaySetting3DqualityLights:int = 0;
      
      public var displayResources:Boolean = false;
      
      public var var_2376:Boolean = false;
      
      public var displayChat:Boolean = false;
      
      public var preloadUserShips:Boolean = false;
      
      public var displaySetting3DsizeTextures:int = 0;
      
      public var var_2907:Boolean = false;
      
      public var displaySetting3DtextureFiltering:int = 0;
      
      public var var_3068:Boolean = false;
      
      public var name_44:int = 0;
      
      public var displaySetting3DqualityEffects:int = 0;
      
      public var var_4829:Boolean = false;
      
      public var var_4972:Boolean = false;
      
      public var name_154:Boolean = false;
      
      public var proActionBarKeyboardInputEnabled:Boolean = false;
      
      public var var_1922:Boolean = false;
      
      public var displayHitpointBubbles:Boolean = false;
      
      public var var_1348:Boolean = false;
      
      public var var_1368:Boolean = false;
      
      public var var_1882:Boolean = false;
      
      public var var_482:Boolean = false;
      
      public function class_915(param1:Boolean = false, param2:Boolean = false, param3:Boolean = false, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false, param12:Boolean = false, param13:Boolean = false, param14:Boolean = false, param15:Boolean = false, param16:Boolean = false, param17:Boolean = false, param18:Boolean = false, param19:Boolean = false, param20:int = 0, param21:int = 0, param22:int = 0, param23:int = 0, param24:int = 0, param25:int = 0, param26:int = 0, param27:int = 0, param28:Boolean = false, param29:Boolean = false, param30:Boolean = false)
      {
         super();
         this.var_1922 = param1;
         this.var_2376 = param2;
         this.displayResources = param3;
         this.var_4829 = param4;
         this.displayHitpointBubbles = param5;
         this.displayChat = param6;
         this.displayDrones = param7;
         this.var_4972 = param8;
         this.var_482 = param9;
         this.showNotOwnedItems = param10;
         this.var_2907 = param11;
         this.var_3068 = param12;
         this.displayNotifications = param13;
         this.preloadUserShips = param14;
         this.name_154 = param15;
         this.var_1368 = param16;
         this.var_1882 = param17;
         this.var_1348 = param18;
         this.var_69 = param19;
         this.displaySetting3DqualityAntialias = param20;
         this.name_44 = param21;
         this.displaySetting3DqualityEffects = param22;
         this.displaySetting3DqualityLights = param23;
         this.displaySetting3DqualityTextures = param24;
         this.name_16 = param25;
         this.displaySetting3DsizeTextures = param26;
         this.displaySetting3DtextureFiltering = param27;
         this.proActionBarEnabled = param28;
         this.proActionBarKeyboardInputEnabled = param29;
         this.proActionBarAutohideEnabled = param30;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 54;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.displaySetting3DqualityAntialias = param1.readInt();
         this.displaySetting3DqualityAntialias = Number(this.displaySetting3DqualityAntialias) >>> 11 | Number(this.displaySetting3DqualityAntialias) << 21;
         param1.readShort();
         this.proActionBarEnabled = param1.readBoolean();
         this.proActionBarAutohideEnabled = param1.readBoolean();
         param1.readShort();
         this.displaySetting3DqualityTextures = param1.readInt();
         this.displaySetting3DqualityTextures = Number(this.displaySetting3DqualityTextures) >>> 11 | Number(this.displaySetting3DqualityTextures) << 21;
         this.var_69 = param1.readBoolean();
         this.name_16 = param1.readInt();
         this.name_16 = Number(this.name_16) >>> 14 | Number(this.name_16) << 18;
         this.showNotOwnedItems = param1.readBoolean();
         this.displayDrones = param1.readBoolean();
         this.displayNotifications = param1.readBoolean();
         this.displaySetting3DqualityLights = param1.readInt();
         this.displaySetting3DqualityLights = Number(this.displaySetting3DqualityLights) >>> 1 | Number(this.displaySetting3DqualityLights) << 31;
         this.displayResources = param1.readBoolean();
         this.var_2376 = param1.readBoolean();
         this.displayChat = param1.readBoolean();
         this.preloadUserShips = param1.readBoolean();
         this.displaySetting3DsizeTextures = param1.readInt();
         this.displaySetting3DsizeTextures = Number(this.displaySetting3DsizeTextures) << 12 | Number(this.displaySetting3DsizeTextures) >>> 20;
         this.var_2907 = param1.readBoolean();
         this.displaySetting3DtextureFiltering = param1.readInt();
         this.displaySetting3DtextureFiltering = Number(this.displaySetting3DtextureFiltering) << 16 | Number(this.displaySetting3DtextureFiltering) >>> 16;
         this.var_3068 = param1.readBoolean();
         this.name_44 = param1.readInt();
         this.name_44 = Number(this.name_44) >>> 9 | Number(this.name_44) << 23;
         this.displaySetting3DqualityEffects = param1.readInt();
         this.displaySetting3DqualityEffects = Number(this.displaySetting3DqualityEffects) << 4 | Number(this.displaySetting3DqualityEffects) >>> 28;
         this.var_4829 = param1.readBoolean();
         this.var_4972 = param1.readBoolean();
         this.name_154 = param1.readBoolean();
         this.proActionBarKeyboardInputEnabled = param1.readBoolean();
         this.var_1922 = param1.readBoolean();
         this.displayHitpointBubbles = param1.readBoolean();
         this.var_1348 = param1.readBoolean();
         this.var_1368 = param1.readBoolean();
         this.var_1882 = param1.readBoolean();
         this.var_482 = param1.readBoolean();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.displaySetting3DqualityAntialias) << 11 | Number(this.displaySetting3DqualityAntialias) >>> 21);
         param1.writeShort(30800);
         param1.writeBoolean(this.proActionBarEnabled);
         param1.writeBoolean(this.proActionBarAutohideEnabled);
         param1.writeShort(-21589);
         param1.writeInt(Number(this.displaySetting3DqualityTextures) << 11 | Number(this.displaySetting3DqualityTextures) >>> 21);
         param1.writeBoolean(this.var_69);
         param1.writeInt(Number(this.name_16) << 14 | Number(this.name_16) >>> 18);
         param1.writeBoolean(this.showNotOwnedItems);
         param1.writeBoolean(this.displayDrones);
         param1.writeBoolean(this.displayNotifications);
         param1.writeInt(Number(this.displaySetting3DqualityLights) << 1 | Number(this.displaySetting3DqualityLights) >>> 31);
         param1.writeBoolean(this.displayResources);
         param1.writeBoolean(this.var_2376);
         param1.writeBoolean(this.displayChat);
         param1.writeBoolean(this.preloadUserShips);
         param1.writeInt(Number(this.displaySetting3DsizeTextures) >>> 12 | Number(this.displaySetting3DsizeTextures) << 20);
         param1.writeBoolean(this.var_2907);
         param1.writeInt(Number(this.displaySetting3DtextureFiltering) >>> 16 | Number(this.displaySetting3DtextureFiltering) << 16);
         param1.writeBoolean(this.var_3068);
         param1.writeInt(Number(this.name_44) << 9 | Number(this.name_44) >>> 23);
         param1.writeInt(Number(this.displaySetting3DqualityEffects) >>> 4 | Number(this.displaySetting3DqualityEffects) << 28);
         param1.writeBoolean(this.var_4829);
         param1.writeBoolean(this.var_4972);
         param1.writeBoolean(this.name_154);
         param1.writeBoolean(this.proActionBarKeyboardInputEnabled);
         param1.writeBoolean(this.var_1922);
         param1.writeBoolean(this.displayHitpointBubbles);
         param1.writeBoolean(this.var_1348);
         param1.writeBoolean(this.var_1368);
         param1.writeBoolean(this.var_1882);
         param1.writeBoolean(this.var_482);
      }
   }
}
