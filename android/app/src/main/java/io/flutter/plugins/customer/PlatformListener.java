package io.flutter.plugins.customer;

import android.util.Log;

import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.PluginRegistry;

public class PlatformListener implements EventChannel.StreamHandler {

    private static final String TAG = "PlatformListener";

    static String CHANNEL_NAME = "flypple/platform_event";

    TimerTask mTimerTask;

    public static void registerWith(PluginRegistry.Registrar registrar) {
        final EventChannel eventChannel = new EventChannel(registrar.messenger(), CHANNEL_NAME);
        eventChannel.setStreamHandler(new PlatformListener());
    }

    @Override
    public void onListen(Object o, EventChannel.EventSink eventSink) {
        Log.e(TAG, "onListen: Flutter开始监听本地指令了：" + o);
        mTimerTask = new TimerTask(eventSink);
        new Thread(mTimerTask).start();
    }

    @Override
    public void onCancel(Object o) {

        Log.e(TAG, "onCancel: Flutter取消了对本地的监听");
        if (mTimerTask != null) {
            mTimerTask.stop();
            mTimerTask = null;
        }
    }

    class TimerTask implements Runnable {

        private EventChannel.EventSink mEventSink;

        TimerTask(EventChannel.EventSink eventSink) {

            mEventSink = eventSink;
        }

        boolean cannel = false;
        int num = 0;

        @Override
        public void run() {
            while (!cannel && mEventSink != null) {
                mEventSink.success(num ++);
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
            release();
        }

        private void release() {
            if (mEventSink != null) {
                mEventSink.endOfStream();
                mEventSink = null;
            }
        }

        public void stop() {
            cannel = true;
        }
    }
}
