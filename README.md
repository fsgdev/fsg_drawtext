![fsg_drawtext](https://github.com/user-attachments/assets/7005c01a-7770-4ad1-ac93-75e0e7e921b0)
# fsg_drawtext

## Description
I decided to recreate the Draw Text that is used in GTA.World and would like to credit them for the idea, I just threw something very basic together for FiveM.

## Preview
[Streamable - fsg_drawtext](https://streamable.com/utked0)

## Usage
### Client-side event:
```
TriggerEvent("fsg_drawtext:displayText", "You have ~r~locked~w~ your vehicle.", 500)
```

### Client-side export:
```
exports.fsg_drawtext:displayText("You have ~r~locked~w~ your vehicle.", 500)
```

### Server-side event:
```
TriggerClientEvent("fsg_drawtext:displayText", source, "You have ~r~locked~w~ your vehicle.", 500)
```

## Links
Discord: https://discord.gg/NCZzpR3MRN
