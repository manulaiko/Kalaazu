package net.bigpoint.darkorbit.net
{
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_9;
   import net.bigpoint.darkorbit.map.model.class_90;
   import net.bigpoint.darkorbit.map.model.ship.class_350;
   import net.bigpoint.darkorbit.map.model.ship.class_86;
   import net.bigpoint.darkorbit.settings.Settings;
   import package_125.class_352;
   import package_38.class_351;
   import package_75.class_349;
   
   public class class_101
   {
       
      
      private var main:class_9;
      
      public function class_101()
      {
         super();
      }
      
      public function method_3489(param1:class_9) : void
      {
         this.main = param1;
      }
      
      public function method_342(param1:int, param2:String, param3:int) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(param2 == class_352.ROCKET)
         {
            return;
         }
         if(false)
         {
            if((_loc4_ = this.main.name_47.map) != null)
            {
               if((_loc5_ = _loc4_.method_327(param1) as class_86) != null && !(_loc5_ is class_350))
               {
                  _loc4_.effects.method_5084(new class_349(_loc5_,0,param3));
               }
            }
         }
      }
      
      public function method_2185(param1:uint) : void
      {
         switch(param1)
         {
            case class_351.const_238:
               this.method_1150();
               break;
            case class_351.const_1285:
               this.method_3537();
               break;
            case class_351.const_655:
               this.method_5534();
               break;
            case class_351.const_418:
               this.method_646();
               break;
            case class_351.const_1130:
               this.method_4793();
               break;
            case class_351.const_1757:
               this.method_4319();
               break;
            case class_351.const_2577:
               this.method_2230();
               break;
            case class_351.const_640:
               this.method_2734();
         }
      }
      
      private function method_2734() : void
      {
         this.main.method_4489().writeToLog(class_88.getItem("log_msg_traininggrounds_cannot_deploy_mines"));
      }
      
      private function method_1150() : void
      {
         this.main.method_4489().writeToLog(class_88.getItem("fightcanceled"));
      }
      
      private function method_5534() : void
      {
         this.main.method_4489().writeToLog(class_88.getItem("peacearea"));
      }
      
      private function method_3537() : void
      {
         this.main.method_4489().writeToLog(class_88.getItem("attescape"));
      }
      
      private function method_646() : void
      {
         this.main.method_4489().writeToLog(class_88.getItem("fightcont"));
         var _loc1_:class_90 = this.main.name_47.map;
         if(_loc1_ != null)
         {
         }
      }
      
      private function method_4793() : void
      {
         this.main.method_4489().writeToLog(class_88.getItem("outofrange"));
         var _loc1_:class_90 = this.main.name_47.map;
         if(_loc1_ != null)
         {
         }
      }
      
      private function method_2230() : void
      {
         this.main.method_4489().writeToLog(class_88.getItem("log_msg_traininggrounds_cannot_attack"));
      }
      
      private function method_4319() : void
      {
         this.main.method_4489().writeToLog(class_88.getItem("log_msg_traininggrounds_cannot_be_attacked"));
      }
   }
}
