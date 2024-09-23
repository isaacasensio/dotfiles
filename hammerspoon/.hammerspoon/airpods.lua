local function airPods()
    local s = [[
  use framework "IOBluetooth"
  use scripting additions
  
  set AirPodsName to "AirPods"
  
  on getFirstMatchingDevice(deviceName)
      repeat with device in (current application's IOBluetoothDevice's pairedDevices() as list)
          log (device)
          if (device's nameOrAddress as string) contains deviceName then return device
      end repeat
  end getFirstMatchingDevice
  
  on toggleDevice(device)
      set quotedDeviceName to quoted form of (device's nameOrAddress as string)
      
      if not (device's isConnected as boolean) then
          device's openConnection()
      end if
      
      with timeout of 30 seconds
          set deviceValueInAudioSource to ""
          repeat while deviceValueInAudioSource = ""
              set deviceValueInAudioSource to do shell script "/usr/local/bin/SwitchAudioSource -a | grep -m1 AirPods"
          end repeat
          
          do shell script "/usr/local/bin/SwitchAudioSource -s \"" & deviceValueInAudioSource & "\""
          return "Connecting " & (device's nameOrAddress as string)
      end timeout
  end toggleDevice
  
  return toggleDevice(getFirstMatchingDevice(AirPodsName))
  
    ]]
  
    return hs.osascript.applescript(s)
  end
  
function toggleAirpods()
    local ok, output = airPods()
    if ok then
      hs.alert.show(output)
    else
      hs.alert.show("Couldn't connect to AirPods!")
    end
end