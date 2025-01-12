import fs from "fs";
import { KarabinerRules } from "./types";
import { createHyperSubLayers, app, open } from "./utils";

const rules: KarabinerRules[] = [
  // Define the Hyper key itself
  {
    description: "Hyper Key (⌃⌥⇧⌘)",
    manipulators: [
      {
        description: "Caps Lock -> Hyper Key",
        from: {
          key_code: "caps_lock",
        },
        to: [
          {
            key_code: "left_shift",
            modifiers: ["left_command", "left_control", "left_option"],
          },
        ],
        to_if_alone: [
          {
            key_code: "escape",
          },
        ],
        type: "basic",
      },
      //      {
      //        type: "basic",
      //        description: "Disable CMD + Tab to force Hyper Key usage",
      //        from: {
      //          key_code: "tab",
      //          modifiers: {
      //            mandatory: ["left_command"],
      //          },
      //        },
      //        to: [
      //          {
      //            key_code: "tab",
      //          },
      //        ],
      //      },
    ],
  },

  // I couldn't get this work with the magic mouse because it only detects button1 in the karabiner event viewer
  // You need to enable pro mode in karabiner for the work with the apple mouse
  // It works with the logitech mouse tough
  // {
  //   description: "Simultaneous Left and Right Click to Cmd+Shift+S",
  //   manipulators: [
  //     {
  //       type: "basic",
  //       parameters: {
  //         "basic.simultaneous_threshold_milliseconds": 500
  //       },
  //       from: {
  //         simultaneous: [
  //           { "pointing_button": "button1" },
  //           { "pointing_button": "button2" }
  //         ],
  //         simultaneous_options: {
  //           detect_key_down_uninterruptedly: true,
  //           key_down_order: "strict",
  //           key_up_order: "strict",
  //           key_up_when: "all"
  //         }
  //       },
  //       to: [
  //         {
  //           key_code: "s",
  //           modifiers: ["left_command", "left_shift"]
  //         },
  //       ],
  //     },
  //   ],
  // },

  ...createHyperSubLayers({
    // I use spacebar as the app launcher
    spacebar: {
      o: app("Obsidian"),
      semicolon: app("ChatGPT"),
      quote: app("System Settings"),
      c: app("Visual Studio Code"),
      b: app("Firefox"),
      f: app("Finder"),
      w: app("WezTerm"),
      g: app("Ghostty"),

      // Below I'm just leaving comments of the shortcuts I specifically use on
      // apps in case I need to configure them on a new computer
      // hyper+w - paste activate
      // hyper+1 - paste stack
      // hyper+2 - betterdisplay fav res 1
      // hyper+3 - betterdisplay fav res 2
    },

    // s = "System" or "Service"
    s: {
      j: {
        to: [
          {
            key_code: "volume_decrement",
          },
        ],
      },
      k: {
        to: [
          {
            key_code: "volume_increment",
          },
        ],
      },
      // Move to left tab in browsers
      h: {
        to: [
          {
            key_code: "open_bracket",
            modifiers: ["left_command", "left_shift"],
          },
        ],
      },
      // Move to right tab in browsers
      l: {
        to: [
          {
            key_code: "close_bracket",
            modifiers: ["left_command", "left_shift"],
          },
        ],
      },
      u: {
        to: [
          {
            key_code: "display_brightness_decrement",
          },
        ],
      },
      i: {
        to: [
          {
            key_code: "display_brightness_increment",
          },
        ],
      },
      // Previous song
      y: {
        to: [
          {
            key_code: "rewind",
          },
        ],
      },
      // Next song
      o: {
        to: [
          {
            key_code: "fastforward",
          },
        ],
      },
      p: {
        to: [
          {
            key_code: "play_or_pause",
          },
        ],
      },
      // Lock screen
      d: {
        to: [
          {
            key_code: "q",
            modifiers: ["right_control", "right_command"],
          },
        ],
      },
      // Close browser tab
      e: {
        to: [
          {
            key_code: "w",
            modifiers: ["left_command"],
          },
        ],
      },
      // BetterTouchTool, connect airpods via bluetooth
      n: open(
        "btt://execute_assigned_actions_for_trigger/?uuid=9A1CFA49-416C-480E-9430-184D2DAEE1CA"
      ),
      // Change audio source to airpods
      m: {
        to: [
          {
            shell_command: `/opt/homebrew/bin/SwitchAudioSource -s "AirPods Pro"; /opt/homebrew/bin/SwitchAudioSource -t input -s "AirPods Pro"`,
          },
        ],
      },
      // Restart yabai
      0: open(
        "btt://execute_assigned_actions_for_trigger/?uuid=5EC0D2D3-869C-4284-B063-B53A17BF7C4C"
      ),
      // Start video recording
      8: open(
        "btt://execute_assigned_actions_for_trigger/?uuid=24E07831-252B-4EB6-B6C4-5E1CDB742BF9"
      ),
      // Stop video recording
      9: open(
        "btt://execute_assigned_actions_for_trigger/?uuid=762AF6E2-41EE-4B74-A2D3-9B96C3D777B5"
      ),
      // comma: {
      //   to: [
      //     {
      //       shell_command: `/opt/homebrew/bin/SwitchAudioSource -s "LG TV"; /opt/homebrew/bin/SwitchAudioSource -t input -s "C922 Pro Stream Webcam"`,
      //     },
      //   ],
      // },
      // Change audio source to mac mini
      comma: {
        to: [
          {
            shell_command: `/opt/homebrew/bin/SwitchAudioSource -s "Mac mini Speakers"; /opt/homebrew/bin/SwitchAudioSource -t input -s "C922 Pro Stream Webcam"`,
          },
        ],
      },
      // Change audio source to macbook pro Speakers
      period: {
        to: [
          {
            shell_command: `/opt/homebrew/bin/SwitchAudioSource -s "MacBook Pro Speakers"; /opt/homebrew/bin/SwitchAudioSource -t input -s "MacBook Pro Microphone"`,
          },
        ],
      },
      // n: open(
      //   "raycast://extensions/VladCuciureanu/toothpick/connect-favorite-device-1"
      // ),
    },

    // For betterTouchTool
    d: {
      // Select text from alacritty
      j: open(
        "btt://execute_assigned_actions_for_trigger/?uuid=5A708885-4D65-465C-B87A-996BA6C23B86"
      ),
      // Paste alacritty text and go down
      k: open(
        "btt://execute_assigned_actions_for_trigger/?uuid=CBAA9D60-831D-4315-A6B8-195B8F179C26"
      ),
      // Paste kodekloud text and go down
      l: open(
        "btt://execute_assigned_actions_for_trigger/?uuid=3FD931CD-45A8-4AAF-8D73-A9C0E5C41A60"
      ),
      // Reboot router
      u: open(
        "btt://execute_assigned_actions_for_trigger/?uuid=EA461EE0-4C15-4113-93B6-07C12086FF1F"
      ),
    },

     // t = "tmux" - I use these to navigate to my different tmux sessions
    // video that explains how this works using prime's tmux-sessionizer script
    // https://youtu.be/MCbEPylDEWU
    t: {
      // home
      h: open(
        "btt://execute_assigned_actions_for_trigger/?uuid=F431526A-E836-451C-BD36-67AB7DF7CAC2"
      ),
      // dotfiles-latest
      j: open(
        "btt://execute_assigned_actions_for_trigger/?uuid=E2BEB425-38A3-46D8-AAF8-067CA979D4FB"
      ),
      // watusy
      k: open(
        "btt://execute_assigned_actions_for_trigger/?uuid=7B386F00-BDBD-448F-A413-E37952E219A7"
      ),
      // linkarzu.github.io
      l: open(
        "btt://execute_assigned_actions_for_trigger/?uuid=1893BEBE-DC99-41CC-9BE6-74B66E3BBB2C"
      ),
      // scripts
      semicolon: open(
        "btt://execute_assigned_actions_for_trigger/?uuid=9E98F83C-C4C4-4B9B-AFF7-03AAAF2939A5"
      ),
      // containerdata
      y: open(
        "btt://execute_assigned_actions_for_trigger/?uuid=27E17BF8-1B16-41BF-A7C1-3DAF6B706340"
      ),
      // containerdata_nfs
      p: open(
        "btt://execute_assigned_actions_for_trigger/?uuid=55A10BEE-B776-4D93-B5ED-024A58595D93"
      ),
      // obsidian_main
      u: open(
        "btt://execute_assigned_actions_for_trigger/?uuid=2FF1FD5D-72C2-42CA-B6AD-05A4DC3CEE0C"
      ),
      // php
      i: open(
        "btt://execute_assigned_actions_for_trigger/?uuid=03F1E256-FF80-43BA-873C-195628FA5996"
      ),
      // containerdata-public
      o: open(
        "btt://execute_assigned_actions_for_trigger/?uuid=13ED33CA-99DF-4782-BDA6-E01BF3FF0DCC"
      ),
      // Find
      n: open(
        "btt://execute_assigned_actions_for_trigger/?uuid=92398D5C-B95F-4E31-9CB9-1E3E732AF1C0"
      ),
      // Find goto
      m: open(
        "btt://execute_assigned_actions_for_trigger/?uuid=88FB8FF9-6237-45FE-8717-675540891749"
      ),
      // daily note
      r: open(
        "btt://execute_assigned_actions_for_trigger/?uuid=9B82DF9D-2DE2-4872-903A-D3C17EE9D555"
      ),
      // // I tried to replace BetterTouchTool by directly calling the script,
      // // but couldn't make it work
      // r: {
      //   to: [
      //     {
      //       shell_command: `~/github/dotfiles-latest/scripts/macos/mac/300-dailyNote.sh`,
      //     },
      //   ],
      // },
      // open karabiner rules.ts file
      e: open(
        "btt://execute_assigned_actions_for_trigger/?uuid=3DEAE844-CD5B-4695-A58D-AC7CFA935D46"
      ),
      // Golang dir
      open_bracket: open(
        "btt://execute_assigned_actions_for_trigger/?uuid=70963A3C-7982-4BB4-A8E0-5181EC216383"
      ),
    },

    // shift+arrows to select stuff
    f: {
      h: {
        to: [{ key_code: "left_arrow", modifiers: ["left_shift"] }],
      },
      j: {
        to: [{ key_code: "down_arrow", modifiers: ["left_shift"] }],
      },
      k: {
        to: [{ key_code: "up_arrow", modifiers: ["left_shift"] }],
      },
      l: {
        to: [{ key_code: "right_arrow", modifiers: ["left_shift"] }],
      },
      y: {
        to: [
          { key_code: "left_arrow", modifiers: ["left_shift", "left_option"] },
        ],
      },
      u: {
        to: [
          { key_code: "down_arrow", modifiers: ["left_shift", "left_option"] },
        ],
      },
      i: {
        to: [
          { key_code: "up_arrow", modifiers: ["left_shift", "left_option"] },
        ],
      },
      o: {
        to: [
          { key_code: "right_arrow", modifiers: ["left_shift", "left_option"] },
        ],
      },
      // // Magicmove via homerow.app
      // m: {
      //   to: [{ key_code: "f", modifiers: ["right_control"] }],
      // },
      // // Scroll mode via homerow.app
      // s: {
      //   to: [{ key_code: "j", modifiers: ["right_control"] }],
      // },
    },

    // copy, paste and other stuff
    right_command: {
      // I use this for fzf
      r: {
        to: [{ key_code: "r", modifiers: ["left_control"] }],
      },
      // Slack go to all unreads
      a: {
        to: [{ key_code: "a", modifiers: ["left_command", "left_shift"] }],
      },
      h: {
        to: [{ key_code: "delete_or_backspace" }],
      },
      l: {
        to: [{ key_code: "delete_forward" }],
      },
      // Switch between windows of same app, normally cmd+~
      spacebar: {
        to: [
          { key_code: "grave_accent_and_tilde", modifiers: ["left_command"] },
        ],
      },
    },

    // Vim nagivation
    // ALWAYS LEAVE THE ONES WITHOUT ANY SUBLAYERS AT THE BOTTOM
    h: {
      to: [{ key_code: "left_arrow" }],
    },
    j: {
      to: [{ key_code: "down_arrow" }],
    },
    k: {
      to: [{ key_code: "up_arrow" }],
    },
    l: {
      to: [{ key_code: "right_arrow" }],
    },
  }),
];

fs.writeFileSync(
  "karabiner.json",
  JSON.stringify(
    {
      global: {
        show_in_menu_bar: false,
      },
      profiles: [
        {
          name: "Default",
          complex_modifications: {
            rules,
          },
        },
      ],
    },
    null,
    2
  )
);
