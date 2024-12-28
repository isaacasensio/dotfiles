# Setup Yabai

## Disable SIP

If you would like to have transparency enabled, you need to partially disable SIP, so follow these steps:

https://github.com/koekeishiya/yabai/wiki/Disabling-System-Integrity-Protection#how-do-i-disable-system-integrity-protection

## Configure the scripting addition

We need to configure the scripting addition so that we can modify the Dock.app

Run the following script:

```bash
./scripting-addition.sh
```

Restart yabai

```bash
yabai --restart-service
```

## Configure new applications to get transparency

Get the application name by running the following command. 

```bash
yabai -m query --windows | jq -r '.[].app'
````

Go to the `yabairc` file and add the application name to the `apps_transparent` variable.
