package org.osmf.utils
{
   public class URL
   {
       
      
      private var _rawUrl:String;
      
      private var _protocol:String;
      
      private var _userInfo:String;
      
      private var _host:String;
      
      private var _port:String;
      
      private var _path:String;
      
      private var _query:String;
      
      private var _fragment:String;
      
      public function URL(param1:String)
      {
         super();
         this._rawUrl = param1;
         this._protocol = "";
         this._userInfo = "";
         this._host = "";
         this._port = "";
         this._path = "";
         this._query = "";
         this._fragment = "";
         if(this._rawUrl != null && this._rawUrl.length > 0)
         {
            this.parseUrl();
         }
      }
      
      public function get rawUrl() : String
      {
         return this._rawUrl;
      }
      
      public function get protocol() : String
      {
         return this._protocol;
      }
      
      public function set protocol(param1:String) : void
      {
         if(param1 != null)
         {
            this._protocol = param1.replace(/:\/\/$/,"");
            this._protocol = this._protocol.toLowerCase();
         }
      }
      
      public function get userInfo() : String
      {
         return this._userInfo;
      }
      
      public function set userInfo(param1:String) : void
      {
         if(param1 != null)
         {
            this._userInfo = param1.replace(/@$/,"");
         }
      }
      
      public function get host() : String
      {
         return this._host;
      }
      
      public function set host(param1:String) : void
      {
         this._host = param1;
      }
      
      public function get port() : String
      {
         return this._port;
      }
      
      public function set port(param1:String) : void
      {
         if(param1 != null)
         {
            this._port = param1.replace(/(:)/,"");
         }
      }
      
      public function get path() : String
      {
         return this._path;
      }
      
      public function set path(param1:String) : void
      {
         if(param1 != null)
         {
            this._path = param1.replace(/^\//,"");
         }
      }
      
      public function get query() : String
      {
         return this._query;
      }
      
      public function set query(param1:String) : void
      {
         if(param1 != null)
         {
            this._query = param1.replace(/^\?/,"");
         }
      }
      
      public function get fragment() : String
      {
         return this._fragment;
      }
      
      public function set fragment(param1:String) : void
      {
         if(param1 != null)
         {
            this._fragment = param1.replace(/^#/,"");
         }
      }
      
      public function toString() : String
      {
         return this._rawUrl;
      }
      
      public function getParamValue(param1:String) : String
      {
         if(this._query == null)
         {
            return "";
         }
         var _loc2_:RegExp = new RegExp("[/?&]*" + param1 + "=([^&#]*)","i");
         var _loc3_:Array = this._query.match(_loc2_);
         return _loc3_ == null ? "" : _loc3_[1];
      }
      
      public function get absolute() : Boolean
      {
         return this.protocol != "";
      }
      
      public function get extension() : String
      {
         var _loc1_:int = this.path.lastIndexOf(".");
         if(_loc1_ != -1)
         {
            return this.path.substr(_loc1_ + 1);
         }
         return "";
      }
      
      private function parseUrl() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(this._rawUrl == null || this._rawUrl.length == 0)
         {
            return;
         }
         if(this._rawUrl.search(/:\//) == -1)
         {
            this.path = this._rawUrl;
         }
         else
         {
            _loc1_ = /^(rtmp|rtmp[tse]|rtmp\bte\b)(:\/[^\/])/i;
            _loc2_ = this._rawUrl.match(_loc1_);
            _loc3_ = this._rawUrl;
            if(_loc2_ != null)
            {
               _loc3_ = this._rawUrl.replace(/:\//,"://localhost/");
            }
            _loc4_ = /^([a-z+\w\+\.\-]+:\/\/)?([^\/?#]*)?(\/[^?#]*)?(\?[^#]*)?(\#.*)?/i;
            if((_loc5_ = _loc3_.match(_loc4_)) != null)
            {
               this.protocol = _loc5_[1];
               _loc6_ = _loc5_[2];
               this.path = _loc5_[3];
               this.query = _loc5_[4];
               this.fragment = _loc5_[5];
               _loc4_ = /^([!-~]+@)?([^\/?#:]*)(:[\d]*)?/i;
               if((_loc5_ = _loc6_.match(_loc4_)) != null)
               {
                  this.userInfo = _loc5_[1];
                  this.host = _loc5_[2];
                  this.port = _loc5_[3];
               }
            }
         }
      }
   }
}
