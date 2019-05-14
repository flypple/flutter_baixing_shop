package io.flutter.plugins.customer;

import android.content.Context;
import android.widget.Toast;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;

public class AndroidToast implements MethodChannel.MethodCallHandler {

    /**
     * 通道名称————dart类中的名称相同，无法实现方法调用。
     */
    private static final String CHANNEL_NAMA = "flypple/AndroidToast";

    private Context mContext;
    private Toast mToast;

    private AndroidToast(Context context) {
        mContext = context;
    }

    public static void registerWith(PluginRegistry.Registrar registrar) {
        final MethodChannel methodChannel = new MethodChannel(registrar.messenger(), CHANNEL_NAMA);
        methodChannel.setMethodCallHandler(new AndroidToast(registrar.context()));
    }

    @Override
    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
        switch (call.method) {
            case "showToast":
                Object argument = call.argument("text");
                if (argument == null) {
                    return;
                }
                String text = argument.toString();
                if (mToast != null) {
                    mToast.cancel();
                }
                mToast = Toast.makeText(mContext, text, Toast.LENGTH_SHORT);
                mToast.show();
                result.success(true);
                break;
            case "cancel":
                if (mToast != null) {
                    mToast.cancel();
                }
                result.success(true);
                break;
            default:
                result.notImplemented();
                break;
        }

    }
}
