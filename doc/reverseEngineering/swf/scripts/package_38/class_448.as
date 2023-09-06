package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_448 implements ICommand
   {
      
      public static const ID:int = 21137;
       
      
      public var qualityEffect:int = 0;
      
      public var qualityPresetting:int = 0;
      
      public var qualityBackground:int = 0;
      
      public var qualityAttack:int = 0;
      
      public var qualityCustomized:Boolean = false;
      
      public var var_1922:Boolean = false;
      
      public var qualityShip:int = 0;
      
      public var qualityExplosion:int = 0;
      
      public var qualityEngine:int = 0;
      
      public var var_1652:int = 0;
      
      public var var_3831:int = 0;
      
      public function class_448(param1:Boolean = false, param2:int = 0, param3:int = 0, param4:int = 0, param5:Boolean = false, param6:int = 0, param7:int = 0, param8:int = 0, param9:int = 0, param10:int = 0, param11:int = 0)
      {
         super();
         this.var_1922 = param1;
         this.qualityAttack = param2;
         this.qualityBackground = param3;
         this.qualityPresetting = param4;
         this.qualityCustomized = param5;
         this.var_1652 = param6;
         this.qualityShip = param7;
         this.qualityEngine = param8;
         this.qualityExplosion = param9;
         this.var_3831 = param10;
         this.qualityEffect = param11;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 20;
      }
      
      public function read(param1:IDataInput) : void
      {
         param1.readShort();
         this.qualityEffect = param1.readShort();
         this.qualityPresetting = param1.readShort();
         this.qualityBackground = param1.readShort();
         this.qualityAttack = param1.readShort();
         this.qualityCustomized = param1.readBoolean();
         this.var_1922 = param1.readBoolean();
         this.qualityShip = param1.readShort();
         this.qualityExplosion = param1.readShort();
         this.qualityEngine = param1.readShort();
         this.var_1652 = param1.readShort();
         param1.readShort();
         this.var_3831 = param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeShort(15684);
         param1.writeShort(this.qualityEffect);
         param1.writeShort(this.qualityPresetting);
         param1.writeShort(this.qualityBackground);
         param1.writeShort(this.qualityAttack);
         param1.writeBoolean(this.qualityCustomized);
         param1.writeBoolean(this.var_1922);
         param1.writeShort(this.qualityShip);
         param1.writeShort(this.qualityExplosion);
         param1.writeShort(this.qualityEngine);
         param1.writeShort(this.var_1652);
         param1.writeShort(8709);
         param1.writeShort(this.var_3831);
      }
   }
}
