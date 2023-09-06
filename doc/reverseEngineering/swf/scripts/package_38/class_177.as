package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_177 implements ICommand
   {
      
      public static const ID:int = 32621;
       
      
      public var playCombatMusic:Boolean = false;
      
      public var var_946:int = 0;
      
      public var music:int = 0;
      
      public var sound:int = 0;
      
      public function class_177(param1:int = 0, param2:int = 0, param3:int = 0, param4:Boolean = false)
      {
         super();
         this.sound = param1;
         this.music = param2;
         this.var_946 = param3;
         this.playCombatMusic = param4;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 13;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.playCombatMusic = param1.readBoolean();
         param1.readShort();
         this.var_946 = param1.readInt();
         this.var_946 = Number(this.var_946) << 2 | Number(this.var_946) >>> 30;
         this.music = param1.readInt();
         this.music = Number(this.music) << 1 | Number(this.music) >>> 31;
         this.sound = param1.readInt();
         this.sound = Number(this.sound) << 10 | Number(this.sound) >>> 22;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeBoolean(this.playCombatMusic);
         param1.writeShort(-7493);
         param1.writeInt(Number(this.var_946) >>> 2 | Number(this.var_946) << 30);
         param1.writeInt(Number(this.music) >>> 1 | Number(this.music) << 31);
         param1.writeInt(Number(this.sound) >>> 10 | Number(this.sound) << 22);
      }
   }
}
