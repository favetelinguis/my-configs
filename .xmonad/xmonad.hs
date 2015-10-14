-- xmonad --recompile && xmonad --restart

import XMonad
import XMonad.Config.Desktop

baseConfig = desktopConfig

main = do
    xmonad $ defaultConfig
       { terminal = myTerminal
       , modMask = myModMask
       }

myTerminal = "termite"
myModMask = mod4Mask --Win key or super_l
