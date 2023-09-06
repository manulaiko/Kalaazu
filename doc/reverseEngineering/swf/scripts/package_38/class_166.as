package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_166 implements ICommand
   {
      
      public static const ID:int = 20038;
       
      
      public var var_3831:int = 0;
      
      public var qualityEffect:int = 0;
      
      public var qualityExplosion:int = 0;
      
      public var qualityBackground:int = 0;
      
      public var qualityCustomized:Boolean = false;
      
      public var qualityShip:int = 0;
      
      public var qualityEngine:int = 0;
      
      public var qualityPresetting:int = 0;
      
      public var qualityAttack:int = 0;
      
      public var var_1652:int = 0;
      
      public function class_166(param1:int = 0, param2:int = 0, param3:int = 0, param4:Boolean = false, param5:int = 0, param6:int = 0, param7:int = 0, param8:int = 0, param9:int = 0, param10:int = 0)
      {
         super();
         this.qualityAttack = param1;
         this.qualityBackground = param2;
         this.qualityPresetting = param3;
         this.qualityCustomized = param4;
         this.var_1652 = param5;
         this.qualityShip = param6;
         this.qualityEngine = param7;
         this.qualityExplosion = param8;
         this.var_3831 = param9;
         this.qualityEffect = param10;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 19;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.var_3831 = param1.readShort();
         this.qualityEffect = param1.readShort();
         this.qualityExplosion = param1.readShort();
         this.qualityBackground = param1.readShort();
         this.qualityCustomized = param1.readBoolean();
         this.qualityShip = param1.readShort();
         this.qualityEngine = param1.readShort();
         this.qualityPresetting = param1.readShort();
         this.qualityAttack = param1.readShort();
         this.var_1652 = param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeShort(this.var_3831);
         param1.writeShort(this.qualityEffect);
         param1.writeShort(this.qualityExplosion);
         param1.writeShort(this.qualityBackground);
         param1.writeBoolean(this.qualityCustomized);
         param1.writeShort(this.qualityShip);
         param1.writeShort(this.qualityEngine);
         param1.writeShort(this.qualityPresetting);
         param1.writeShort(this.qualityAttack);
         param1.writeShort(this.var_1652);
      }
   }
}
