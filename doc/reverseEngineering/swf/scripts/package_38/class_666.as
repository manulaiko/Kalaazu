package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_666 implements ICommand
   {
      
      public static const ID:int = 17873;
       
      
      public var var_1664:Boolean = false;
      
      public var var_3112:Boolean = false;
      
      public var var_4850:class_427;
      
      public var var_4461:Boolean = false;
      
      public var var_3046:Boolean = false;
      
      public var displayChat:Boolean = false;
      
      public var sound:Boolean = false;
      
      public var var_454:Boolean = false;
      
      public var var_2376:Boolean = false;
      
      public var autochangeAmmo:Boolean = false;
      
      public var autoBoost:Boolean = false;
      
      public var var_2803:Boolean = false;
      
      public var var_2373:Boolean = false;
      
      public var var_4719:Boolean = false;
      
      public var var_3096:Boolean = false;
      
      public var var_1464:class_427;
      
      public var var_3885:Boolean = false;
      
      public var var_3435:Boolean = false;
      
      public var var_2194:Boolean = false;
      
      public var var_133:Boolean = false;
      
      public var var_230:Boolean = false;
      
      public var var_4279:Boolean = false;
      
      public var var_1836:Boolean = false;
      
      public var music:Boolean = false;
      
      public var var_4579:Boolean = false;
      
      public function class_666(param1:Boolean = false, param2:Boolean = false, param3:Boolean = false, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false, param12:Boolean = false, param13:Boolean = false, param14:Boolean = false, param15:Boolean = false, param16:Boolean = false, param17:Boolean = false, param18:Boolean = false, param19:Boolean = false, param20:Boolean = false, param21:Boolean = false, param22:Boolean = false, param23:Boolean = false, param24:class_427 = null, param25:class_427 = null)
      {
         super();
         this.autoBoost = param1;
         this.var_133 = param2;
         this.var_2373 = param3;
         this.var_3435 = param4;
         this.var_2376 = param5;
         this.var_2194 = param6;
         this.var_4579 = param7;
         this.var_4279 = param8;
         this.var_3885 = param9;
         this.var_4719 = param10;
         this.var_4461 = param11;
         this.sound = param12;
         this.music = param13;
         this.var_3096 = param14;
         this.var_230 = param15;
         this.var_2803 = param16;
         this.displayChat = param17;
         this.var_3112 = param18;
         this.var_454 = param19;
         this.var_1664 = param20;
         this.var_1836 = param21;
         this.autochangeAmmo = param22;
         this.var_3046 = param23;
         if(param24 == null)
         {
            this.var_4850 = new class_427();
         }
         else
         {
            this.var_4850 = param24;
         }
         if(param25 == null)
         {
            this.var_1464 = new class_427();
         }
         else
         {
            this.var_1464 = param25;
         }
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 23;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.var_1664 = param1.readBoolean();
         this.var_3112 = param1.readBoolean();
         this.var_4850 = class_127.getInstance().createInstance(param1.readShort()) as class_427;
         this.var_4850.read(param1);
         this.var_4461 = param1.readBoolean();
         this.var_3046 = param1.readBoolean();
         this.displayChat = param1.readBoolean();
         this.sound = param1.readBoolean();
         this.var_454 = param1.readBoolean();
         this.var_2376 = param1.readBoolean();
         this.autochangeAmmo = param1.readBoolean();
         this.autoBoost = param1.readBoolean();
         this.var_2803 = param1.readBoolean();
         this.var_2373 = param1.readBoolean();
         this.var_4719 = param1.readBoolean();
         this.var_3096 = param1.readBoolean();
         this.var_1464 = class_127.getInstance().createInstance(param1.readShort()) as class_427;
         this.var_1464.read(param1);
         this.var_3885 = param1.readBoolean();
         this.var_3435 = param1.readBoolean();
         this.var_2194 = param1.readBoolean();
         this.var_133 = param1.readBoolean();
         this.var_230 = param1.readBoolean();
         this.var_4279 = param1.readBoolean();
         this.var_1836 = param1.readBoolean();
         this.music = param1.readBoolean();
         this.var_4579 = param1.readBoolean();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeBoolean(this.var_1664);
         param1.writeBoolean(this.var_3112);
         this.var_4850.write(param1);
         param1.writeBoolean(this.var_4461);
         param1.writeBoolean(this.var_3046);
         param1.writeBoolean(this.displayChat);
         param1.writeBoolean(this.sound);
         param1.writeBoolean(this.var_454);
         param1.writeBoolean(this.var_2376);
         param1.writeBoolean(this.autochangeAmmo);
         param1.writeBoolean(this.autoBoost);
         param1.writeBoolean(this.var_2803);
         param1.writeBoolean(this.var_2373);
         param1.writeBoolean(this.var_4719);
         param1.writeBoolean(this.var_3096);
         this.var_1464.write(param1);
         param1.writeBoolean(this.var_3885);
         param1.writeBoolean(this.var_3435);
         param1.writeBoolean(this.var_2194);
         param1.writeBoolean(this.var_133);
         param1.writeBoolean(this.var_230);
         param1.writeBoolean(this.var_4279);
         param1.writeBoolean(this.var_1836);
         param1.writeBoolean(this.music);
         param1.writeBoolean(this.var_4579);
      }
   }
}
