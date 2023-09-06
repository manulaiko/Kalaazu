package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_748 implements ICommand
   {
      
      public static const ENERGY_CHAIN_IMPULSE:uint = 1;
      
      public static const SPEED_LEECH:uint = 4;
      
      public static const SHIELD_BACKUP:uint = 3;
      
      public static const ENERGY_LEECH_ARRAY:uint = 0;
      
      public static const const_513:uint = 5;
      
      public static const ROCKET_PROBABILITY_MAXIMIZER:uint = 2;
      
      public static const CLINGING_IMPULSE_DRONE:uint = 6;
      
      public static const ID:int = 1038;
       
      
      public var var_2008:uint = 0;
      
      public function class_748(param1:uint = 0)
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
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeShort(this.var_2008);
      }
   }
}
