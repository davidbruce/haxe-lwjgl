package lwjgl;

import org.lwjgl.glfw.GLFWFramebufferSizeCallback;
import org.lwjgl.glfw.GLFWKeyCallback;
import org.lwjgl.glfw.GLFWCursorPosCallback;
import org.lwjgl.glfw.GLFWScrollCallback;

typedef TKeyCb = (window: haxe.Int64, key: Int, scancode: Int, action: Int, mods: Int) -> Void;

class KeyCb extends GLFWKeyCallback {
    var keyCb: TKeyCb;
    public function new(keyCb: TKeyCb) {
        super();
        this.keyCb = keyCb;
    }
    @:override public function invoke(window: haxe.Int64, key: Int, scancode: Int, action: Int, mods: Int): Void {
        keyCb(window, key, scancode, action, mods);
    }
}

typedef TFramebufferSizeCb = (window: haxe.Int64, w: Int, h: Int) -> Void;

class FramebufferSizeCb extends GLFWFramebufferSizeCallback {
    var fbSizeCb: TFramebufferSizeCb;
    public function new(fbSizeCb: TFramebufferSizeCb) {
        super();
        this.fbSizeCb = fbSizeCb;
    }
    @:override public function invoke(window: haxe.Int64, w: Int, h: Int) {
        fbSizeCb(window, w, h);
    }
}

typedef TCursorPosCb = (window: haxe.Int64, w: Float, h: Float) -> Void;

class CursorPosCb extends GLFWCursorPosCallback {
    var cursorPosCb: TCursorPosCb;
    public function new(cursorPosCb: TCursorPosCb) {
        super();
        this.cursorPosCb = cursorPosCb;
    }
    @:override public function invoke(window: haxe.Int64, w: Float, h: Float) {
        cursorPosCb(window, w, h);
    }
}

typedef TScrollCb = (window: haxe.Int64, w: Float, h: Float) -> Void;

class ScrollCb extends GLFWScrollCallback {
    var scrollCb: TScrollCb;
    public function new(scrollCb: TScrollCb) {
        super();
        this.scrollCb = scrollCb;
    }
    @:override public function invoke(window: haxe.Int64, w: Float, h: Float) {
        scrollCb(window, w, h);
    }
}


