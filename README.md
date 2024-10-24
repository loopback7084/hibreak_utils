# hibreak_utils
A small batch of scripts for working with the hibreak firmware

```
#include <stddisclaimer.h>

* I'm not responsible for bricked devices, dead SD cards, thermonuclear war, or you getting fired because the alarm app failed (like it did for me...).
* YOU are choosing to make these modifications, and if you point the finger at me for messing up your device, I will laugh at you.
* Your warranty will be void if you tamper with any part of your device / software.
```

unpack:- extracts the key images from the packed super

mountall:- mounts the key partitions

safe_debloat:- removes a subset of junk, fixup hosts file to nerf telemetry

unmountall:- unmounts and fixes up partition images

repack:- recreates a mtk-flashable super
