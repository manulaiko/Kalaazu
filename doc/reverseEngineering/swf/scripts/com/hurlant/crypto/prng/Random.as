package com.hurlant.crypto.prng
{
   import com.hurlant.util.Memory;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.text.Font;
   import flash.utils.ByteArray;
   import flash.utils.getTimer;
   
   public class Random
   {
       
      
      private var psize:int;
      
      private var ready:Boolean = false;
      
      private var seeded:Boolean = false;
      
      private var state:IPRNG;
      
      private var pool:ByteArray;
      
      private var pptr:int;
      
      public function Random(param1:Class = null)
      {
         var _loc2_:* = 0;
         ready = false;
         seeded = false;
         super();
         if(param1 == null)
         {
            param1 = ARC4;
         }
         state = new param1() as IPRNG;
         psize = state.getPoolSize();
         pool = new ByteArray();
         pptr = 0;
         while(pptr < psize)
         {
            _loc2_ = 65536 * Math.random();
            var _loc3_:* = pptr++;
            pool[_loc3_] = _loc2_ >>> 8;
            var _loc4_:*;
            pool[_loc4_ = pptr++] = _loc2_ & 255;
         }
         pptr = 0;
         seed();
      }
      
      public function seed(param1:int = 0) : void
      {
         if(param1 == 0)
         {
            param1 = new Date().getTime();
         }
         var _loc2_:* = pptr++;
         pool[_loc2_] = 0 ^ param1 & 255;
         var _loc3_:* = pptr++;
         pool[_loc3_] = 0 ^ param1 >> 8 & 255;
         var _loc4_:*;
         pool[_loc4_ = pptr++] = 0 ^ param1 >> 16 & 255;
         var _loc5_:*;
         pool[_loc5_ = pptr++] = 0 ^ param1 >> 24 & 255;
         pptr %= psize;
         seeded = true;
      }
      
      public function toString() : String
      {
         return "random-" + state.toString();
      }
      
      public function dispose() : void
      {
         var _loc1_:Number = 0;
         _loc1_ = 0;
         while(_loc1_ < pool.length)
         {
            pool[_loc1_] = Math.random() * 256;
            _loc1_++;
         }
         pool.length = 0;
         pool = null;
         state.dispose();
         state = null;
         psize = 0;
         pptr = 0;
         Memory.gc();
      }
      
      public function autoSeed() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         _loc1_ = new ByteArray();
         _loc1_.writeUnsignedInt(System.totalMemory);
         _loc1_.writeUTF(Capabilities.serverString);
         _loc1_.writeUnsignedInt(getTimer());
         _loc1_.writeUnsignedInt(new Date().getTime());
         _loc2_ = Font.enumerateFonts(true);
         for each(_loc3_ in _loc2_)
         {
            _loc1_.writeUTF(_loc3_.fontName);
            _loc1_.writeUTF(_loc3_.fontStyle);
            _loc1_.writeUTF(_loc3_.fontType);
         }
         _loc1_.position = 0;
         while(_loc1_.bytesAvailable >= 4)
         {
            seed(_loc1_.readUnsignedInt());
         }
      }
      
      public function nextByte() : int
      {
         if(!ready)
         {
            if(!seeded)
            {
               autoSeed();
            }
            state.init(pool);
            pool.length = 0;
            pptr = 0;
            ready = true;
         }
         return state.next();
      }
      
      public function nextBytes(param1:ByteArray, param2:int) : void
      {
         while(param2--)
         {
            param1.writeByte(nextByte());
         }
      }
   }
}
