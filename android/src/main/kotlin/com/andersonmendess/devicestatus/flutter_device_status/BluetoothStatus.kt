package com.andersonmendess.devicestatus.flutter_device_status

import android.bluetooth.BluetoothAdapter
import android.bluetooth.BluetoothHeadset

class BluetoothStatus {
    private var mBluetoothAdapter: BluetoothAdapter? = null

    init {
        mBluetoothAdapter = BluetoothAdapter.getDefaultAdapter()
    }

    fun isSupported(): Boolean {
        return mBluetoothAdapter != null;
    }

    fun isOn() : Boolean {
        return mBluetoothAdapter!!.isEnabled;
    }

    fun turnOn(): Boolean {
        return mBluetoothAdapter!!.enable();
    }

    fun isConnected(): Boolean {
        return (mBluetoothAdapter != null && mBluetoothAdapter!!.isEnabled
                && mBluetoothAdapter!!.getProfileConnectionState(BluetoothHeadset.HEADSET) == BluetoothHeadset.STATE_CONNECTED)
    }
}