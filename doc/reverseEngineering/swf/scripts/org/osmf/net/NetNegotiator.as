package org.osmf.net {

import flash.errors.IOError;
import flash.events.AsyncErrorEvent;
import flash.events.EventDispatcher;
import flash.events.NetStatusEvent;
import flash.events.SecurityErrorEvent;
import flash.events.TimerEvent;
import flash.net.NetConnection;
import flash.utils.Timer;

import org.osmf.events.MediaError;
import org.osmf.events.MediaErrorCodes;
import org.osmf.events.NetConnectionFactoryEvent;
import org.osmf.media.URLResource;

class NetNegotiator extends EventDispatcher {

    private static const DEFAULT_TIMEOUT: Number = 10000;

    private static const CONNECTION_ATTEMPT_INTERVAL: Number = 50;


    private var resource: URLResource;

    private var netConnectionURLs: Vector.<String>;

    private var netConnections: Vector.<NetConnection>;

    private var netConnectionArguments: Vector.<Object>;

    private var failedConnectionCount: int;

    private var timeOutTimer: Timer;

    private var connectionTimer: Timer;

    private var attemptIndex: int;

    private var mediaError: MediaError;

    function NetNegotiator() {
        super();
    }

    public function createNetConnection(param1: URLResource, param2: Vector.<String>, param3: Vector.<NetConnection>): void {
        this.resource = param1;
        this.netConnectionURLs = param2;
        this.netConnections = param3;
        var _loc4_: StreamingURLResource;
        if ((_loc4_ = param1 as StreamingURLResource) != null && _loc4_.connectionArguments != null && _loc4_.connectionArguments.length > 0) {
            this.netConnectionArguments = _loc4_.connectionArguments;
        }
        this.initializeConnectionAttempts();
        this.tryToConnect(null);
    }

    private function initializeConnectionAttempts(): void {
        this.timeOutTimer = new Timer(DEFAULT_TIMEOUT, 1);
        this.timeOutTimer.addEventListener(TimerEvent.TIMER_COMPLETE, this.masterTimeout);
        this.timeOutTimer.start();
        this.connectionTimer = new Timer(CONNECTION_ATTEMPT_INTERVAL);
        this.connectionTimer.addEventListener(TimerEvent.TIMER, this.tryToConnect);
        this.connectionTimer.start();
        this.failedConnectionCount = 0;
        this.attemptIndex = 0;
    }

    private function tryToConnect(param1: TimerEvent): void {
        var var_4599: String = null;
        var args: Array = null;
        var arg: Object = null;
        var var_2243: TimerEvent = param1;
        this.netConnections[this.attemptIndex].addEventListener(NetStatusEvent.NET_STATUS, this.onNetStatus, false, 0, true);
        this.netConnections[this.attemptIndex].addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.onNetSecurityError, false, 0, true);
        this.netConnections[this.attemptIndex].addEventListener(AsyncErrorEvent.ASYNC_ERROR, this.onAsyncError, false, 0, true);
        this.netConnections[this.attemptIndex].client = new NetClient();
        try {
            var_4599 = this.netConnectionURLs[this.attemptIndex];
            args = [var_4599];
            if (this.netConnectionArguments != null) {
                for each(arg in this.netConnectionArguments) {
                    args.push(arg);
                }
            }
            NetConnection(this.netConnections[this.attemptIndex]).connect.apply(this.netConnections[this.attemptIndex], args);
            ++this.attemptIndex;
            if (this.attemptIndex >= this.netConnectionURLs.length) {
                this.connectionTimer.stop();
            }
        } catch (ioError: IOError) {
            handleFailedConnectionSession(new MediaError(MediaErrorCodes.IO_ERROR, ioError.message), netConnectionURLs[attemptIndex]);
        } catch (argumentError: ArgumentError) {
            handleFailedConnectionSession(new MediaError(MediaErrorCodes.ARGUMENT_ERROR, argumentError.message), netConnectionURLs[attemptIndex]);
        } catch (securityError: SecurityError) {
            handleFailedConnectionSession(new MediaError(MediaErrorCodes.SECURITY_ERROR, securityError.message), netConnectionURLs[attemptIndex]);
        }
    }

    private function onNetStatus(param1: NetStatusEvent): void {
        switch (param1.info.code) {
            case NetConnectionCodes.CONNECT_INVALIDAPP:
                this.handleFailedConnectionSession(new MediaError(MediaErrorCodes.NETCONNECTION_APPLICATION_INVALID, param1.info.description), NetConnection(param1.target).uri);
                break;
            case NetConnectionCodes.CONNECT_REJECTED:
                this.handleFailedConnectionSession(new MediaError(MediaErrorCodes.NETCONNECTION_REJECTED, param1.info.description), NetConnection(param1.target).uri);
                break;
            case NetConnectionCodes.CONNECT_FAILED:
                ++this.failedConnectionCount;
                if (this.failedConnectionCount >= this.netConnectionURLs.length) {
                    this.handleFailedConnectionSession(new MediaError(MediaErrorCodes.NETCONNECTION_FAILED), NetConnection(param1.target).uri);
                    break;
                }
                break;
            case NetConnectionCodes.CONNECT_SUCCESS:
                this.shutDownUnsuccessfulConnections();
                dispatchEvent(new NetConnectionFactoryEvent(NetConnectionFactoryEvent.CREATION_COMPLETE, false, false, param1.currentTarget as NetConnection, this.resource));
        }
    }

    private function shutDownUnsuccessfulConnections(): void {
        var _loc2_: * = null;
        this.timeOutTimer.stop();
        this.connectionTimer.stop();
        var _loc1_: int = 0;
        while (_loc1_ < this.netConnections.length) {
            _loc2_ = this.netConnections[_loc1_];
            if (!_loc2_.connected) {
                _loc2_.removeEventListener(NetStatusEvent.NET_STATUS, this.onNetStatus);
                _loc2_.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, this.onNetSecurityError);
                _loc2_.removeEventListener(AsyncErrorEvent.ASYNC_ERROR, this.onAsyncError);
                _loc2_.close();
                delete this.netConnections[_loc1_];
            }
            _loc1_++;
        }
    }

    private function handleFailedConnectionSession(param1: MediaError, param2: String): void {
        this.shutDownUnsuccessfulConnections();
        dispatchEvent(new NetConnectionFactoryEvent(NetConnectionFactoryEvent.CREATION_ERROR, false, false, null, this.resource, param1));
    }

    private function onNetSecurityError(param1: SecurityErrorEvent): void {
        this.handleFailedConnectionSession(new MediaError(MediaErrorCodes.SECURITY_ERROR, param1.text), NetConnection(param1.target).uri);
    }

    private function onAsyncError(param1: AsyncErrorEvent): void {
        this.handleFailedConnectionSession(new MediaError(MediaErrorCodes.ASYNC_ERROR, param1.text), NetConnection(param1.target).uri);
    }

    private function masterTimeout(param1: TimerEvent): void {
        this.handleFailedConnectionSession(new MediaError(MediaErrorCodes.NETCONNECTION_TIMEOUT, "" + DEFAULT_TIMEOUT), "");
    }
}
}
