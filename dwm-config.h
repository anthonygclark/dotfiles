/* See LICENSE file for copyright and license details. */
#include <X11/XF86keysym.h> 

static const char *fonts[] = {
    "MISC Tamsyn:size=10",
	"monospace:size=10"
};

static const char dmenufont[]       = "MISC Tamsyn:size=10";
static const char normbordercolor[] = "#212121";
static const char normbgcolor[]     = "#121212";
static const char normfgcolor[]     = "#696969";
static const char selbordercolor[]  = "#696969";
static const char selbgcolor[]      = "#121212";
static const char selfgcolor[]      = "#e0e0e0";
static const unsigned int borderpx  = 1;       /* border pixel of windows */
static const unsigned int snap      = 32;      /* snap pixel */
static const int showbar            = True;     /* False means no bar */
static const int topbar             = True;     /* False means bottom bar */

/* tagging */
static const char *tags[] = { "www", "term", "term2", "code", "chat", "vm", "files", "misc" };

static const Rule rules[] = {
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Chromium",   NULL,       NULL,       1 << 0,            False,       -1 },
	{ "Firefox",    NULL,       NULL,       1 << 0,            False,       -1 },
	{ "Eclipse",    NULL,       NULL,       1 << 3,            False,       -1 },
	{ "Thunderbird",NULL,       NULL,       1 << 4,            False,       -1 },
	{ "Pidgin",     NULL,       NULL,       1 << 4,            True,        -1 },
	{ "Thunar",     NULL,       NULL,       1 << 6,            False,       -1 },
	{ "VirtualBox", NULL,       NULL,       1 << 5,            True,        -1 },
	{ "Gimp",       NULL,       NULL,       1 << 7,            True,        -1 },
	{ NULL,         NULL,       "File Operation Progress", 0,  True,        -1 }, /* Thunars progress bar */
};

/* layout(s) */
static const float mfact      = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster      = 1;    /* number of clients in master area */
static const int resizehints = False; /* True means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[T]",      tile },    /* first entry is default */
	{ "[F]",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod1Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2]              = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[]        = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbgcolor, "-sf", selfgcolor, NULL };
static const char *termcmd[]         = { "urxvt", NULL };
static const char *lockcmd[]         = { "slock", NULL };
static const char *fbrowsercmd[]     = { "thunar", NULL };
static const char *musicappcmd[]     = { "urxvt", "-e", "sh", "-c", "ncmpcpp", NULL };
static const char *media_stop[]      = { "media.sh" , "stop"   , NULL       } ;
static const char *media_playpause[] = { "media.sh" , "toggle" , NULL       } ;
static const char *media_next[]      = { "media.sh" , "next"   , NULL       } ;
static const char *media_prev[]      = { "media.sh" , "prev"   , NULL       } ;
static const char *vol_up[]          = { "vol.sh"   , "-i"     , "5" , NULL } ;
static const char *vol_down[]        = { "vol.sh"   , "-d"     , "5" , NULL } ;
static const char *vol_tog[]         = { "vol.sh"   , "-t"     , NULL       } ;
static const char *bright_up[]       = { "xbacklight", "-inc", "25%", NULL } ;
static const char *bright_down[]     = { "xbacklight", "-dec", "25%", NULL } ;

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ 0                , XF86XK_AudioStop         , spawn          , {.v = media_stop      }  } ,
	{ 0                , XF86XK_AudioPlay         , spawn          , {.v = media_playpause }  } ,
	{ 0                , XF86XK_AudioNext         , spawn          , {.v = media_next      }  } ,
	{ 0                , XF86XK_AudioPrev         , spawn          , {.v = media_prev      }  } ,
	{ 0                , XF86XK_AudioLowerVolume  , spawn          , {.v = vol_down        }  } ,
	{ 0                , XF86XK_AudioRaiseVolume  , spawn          , {.v = vol_up          }  } ,
	{ 0                , XF86XK_AudioMute         , spawn          , {.v = vol_tog         }  } ,
	{ 0                , XF86XK_AudioMedia        , spawn          , {.v = musicappcmd     }  } ,
	{ 0                , XF86XK_MonBrightnessUp   , spawn          , {.v = bright_up       }  } ,
	{ 0                , XF86XK_MonBrightnessDown , spawn          , {.v = bright_down     }  } ,
	{ MODKEY           , XK_p                     , spawn          , {.v = dmenucmd        }  } ,
	{ MODKEY|ShiftMask , XK_Return                , spawn          , {.v = termcmd         }  } ,
	{ MODKEY|ShiftMask , XK_l                     , spawn          , {.v = lockcmd         }  } ,
	{ MODKEY|ShiftMask , XK_f                     , spawn          , {.v = fbrowsercmd     }  } ,
	{ MODKEY           , XK_b                     , togglebar      , {0                    }  } ,
	{ MODKEY           , XK_j                     , focusstack     , {.i = +1              }  } ,
	{ MODKEY           , XK_k                     , focusstack     , {.i = -1              }  } ,
	{ MODKEY           , XK_i                     , incnmaster     , {.i = +1              }  } ,
	{ MODKEY           , XK_d                     , incnmaster     , {.i = -1              }  } ,
	{ MODKEY           , XK_h                     , setmfact       , {.f = -0.05           }  } ,
	{ MODKEY           , XK_l                     , setmfact       , {.f = +0.05           }  } ,
	{ MODKEY           , XK_Return                , zoom           , {0                    }  } ,
	{ MODKEY           , XK_Tab                   , view           , {0                    }  } ,
	{ MODKEY|ShiftMask , XK_c                     , killclient     , {0                    }  } ,
	{ MODKEY           , XK_t                     , setlayout      , {.v = &layouts[0]     }  } ,
	{ MODKEY           , XK_f                     , setlayout      , {.v = &layouts[1]     }  } ,
	{ MODKEY           , XK_m                     , setlayout      , {.v = &layouts[2]     }  } ,
	{ MODKEY           , XK_space                 , setlayout      , {0                    }  } ,
	{ MODKEY|ShiftMask , XK_space                 , togglefloating , {0                    }  } ,
	{ MODKEY           , XK_0                     , view           , {.ui = ~0             }  } ,
	{ MODKEY|ShiftMask , XK_0                     , tag            , {.ui = ~0             }  } ,
	{ MODKEY           , XK_comma                 , focusmon       , {.i = -1              }  } ,
	{ MODKEY           , XK_period                , focusmon       , {.i = +1              }  } ,
	{ MODKEY|ShiftMask , XK_comma                 , tagmon         , {.i = -1              }  } ,
	{ MODKEY|ShiftMask , XK_period                , tagmon         , {.i = +1              }  } ,
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0                    }  } ,
};

/* button definitions */
/* click can be ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};
