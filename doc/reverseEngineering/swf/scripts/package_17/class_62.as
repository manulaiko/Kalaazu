package package_17 {

import net.bigpoint.darkorbit.mvc.common.AssetNotifications;
import net.bigpoint.darkorbit.mvc.common.ConnectionNotifications;
import net.bigpoint.darkorbit.mvc.common.JavaScriptCallNotification;
import net.bigpoint.darkorbit.mvc.common.KeyboardNotifications;
import net.bigpoint.darkorbit.mvc.common.controller.assets.InitUnloadFinisherCommand;
import net.bigpoint.darkorbit.mvc.common.controller.javaScript.AddJavaScriptDelayedCallbackCommand;
import net.bigpoint.darkorbit.mvc.common.controller.javaScript.FullScreenChangeCompleteCommand;
import net.bigpoint.darkorbit.mvc.common.controller.javaScript.JavaScriptCommand;
import net.bigpoint.darkorbit.mvc.common.controller.key.LockKeyboardCommand;
import net.bigpoint.darkorbit.mvc.common.controller.key.UnlockKeyboardCommand;
import net.bigpoint.darkorbit.mvc.common.controller.net.NetControllerPrepCommand;
import net.bigpoint.darkorbit.mvc.common.controller.screen.FullScreenOffCommand;
import net.bigpoint.darkorbit.mvc.common.controller.screen.ScreenViewportResizedCommand;
import net.bigpoint.darkorbit.mvc.common.sounds.SoundNotifications;
import net.bigpoint.darkorbit.mvc.common.sounds.controller.PlaySoundTriggerModuleCommand;
import net.bigpoint.darkorbit.mvc.common.view.ScreenNotifications;
import net.bigpoint.darkorbit.mvc.mapElements.assets.MapAssetNotification;
import net.bigpoint.darkorbit.mvc.mapElements.common.controller.AbortLaserAttackCommand;
import net.bigpoint.darkorbit.mvc.mapElements.common.controller.DeselectTargetCommand;

import org.puremvc.as3.multicore.interfaces.IFacade;
import org.puremvc.as3.multicore.patterns.facade.Facade;

import package_13.class_51;

import package_16.class_56;

import package_34.HintsNotifications;

import package_41.GameNotifications;

import package_82.class_242;

import package_83.TDMStatusNotification;

import package_85.class_244;

import package_86.class_246;

import package_87.class_247;

import package_88.class_248;

import package_89.class_249;
import package_89.class_253;

import package_90.class_250;

import package_91.class_251;

import package_92.TDMResultWindowNotifications;

import package_93.class_252;

import package_94.class_254;

import package_95.class_255;

import package_96.class_256;

import package_97.class_257;

import package_98.MapNotification;

public class class_62 extends Facade implements IFacade {

    public static const const_3290: String = "Game";


    public function class_62() {
        super(const_3290);
    }

    public static function getInstance(): class_62 {
        if (true) {
            instanceMap[const_3290] = new class_62();
        }
        return class_62(instanceMap[const_3290]);
    }

    override protected function initializeController(): void {
        super.initializeController();
        registerCommand(class_56.const_452, class_255);
        registerCommand(GameNotifications.HERO_INIT, class_249);
        registerCommand(GameNotifications.CONNECTION_LOST, class_253);
        registerCommand(KeyboardNotifications.LOCK_KEYBOARD, LockKeyboardCommand);
        registerCommand(KeyboardNotifications.UNLOCK_KEYBOARD, UnlockKeyboardCommand);
        registerCommand(class_257.READY, class_242);
        registerCommand(JavaScriptCallNotification.ADD_DELAYED_CALLBACK, AddJavaScriptDelayedCallbackCommand);
        registerCommand(JavaScriptCallNotification.CALL_JAVA_SCRIPT, JavaScriptCommand);
        registerCommand(ConnectionNotifications.INIT, class_247);
        registerCommand(ConnectionNotifications.READY, NetControllerPrepCommand);
        registerCommand(MapNotification.NEW_MAP_INIT_FINISHED, class_246);
        registerCommand(MapAssetNotification.DESELECT_TARGET, DeselectTargetCommand);
        registerCommand(MapAssetNotification.ABORT_LASER_ATTACK, AbortLaserAttackCommand);
        registerCommand(AssetNotifications.UNLOAD_FINISHER_PROXY_READY, InitUnloadFinisherCommand);
        registerCommand(ScreenNotifications.FULLSCREEN_CHANGE, FullScreenOffCommand);
        registerCommand(ScreenNotifications.FULLSCREEN_CHANGE_COMPLETE, FullScreenChangeCompleteCommand);
        registerCommand(ScreenNotifications.SCREEN_VIEWPORT_RESIZED, ScreenViewportResizedCommand);
        registerCommand(TDMResultWindowNotifications.SHOW, class_256);
        registerCommand(TDMStatusNotification.UPDATE, class_251);
        registerCommand(class_244.INIT, class_250);
        registerCommand(HintsNotifications.const_3028, class_248);
        registerCommand(SoundNotifications.PLAY_SOUND_TRIGGER_MODULE, PlaySoundTriggerModuleCommand);
        registerCommand(class_252.SHOW, class_254);
    }

    public function method_5032(param1: class_51): void {
        sendNotification(class_56.const_452, param1);
    }

    public function method_2407(param1: String, param2: Object = null, param3: String = null): void {
        sendNotification(param1, param2, param3);
    }
}
}
