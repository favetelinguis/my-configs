-- xmonad --recompile && xmonad --restart

import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.SetWMName -- make xmonad work with java swing, might not be needed

baseConfig = desktopConfig

main = do
    xmonad $ defaultConfig
       { terminal = myTerminal
       , modMask = myModMask
       , startupHook = setWMName "LG3D" --make xmonad wokr with java swing
       }

myTerminal = "termite"
myModMask = mod4Mask --Win key or super_l
