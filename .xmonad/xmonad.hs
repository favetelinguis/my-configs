-- xmonad --recompile && xmonad --restart

import XMonad

main = 
    xmonad defaultConfig
       { terminal = "termite" }

