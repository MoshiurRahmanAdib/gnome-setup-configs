#!/bin/sh
#
# Script for dark theme
# Requires: Gnome (gsettings), Kvantum (qkvantumctl), qt5ct, qt6ct, crudini

# ─── Variables ─────────────────────────────────────────────────────────────

GTK_THEME="adw-gtk3-dark"
KVANTUM_THEME="KvLibadwaitaDark"
ICON_THEME="MacAdib-dark"
CURSOR_THEME="GoogleDot-White"

# ─── GTK 3 & GTK 4 ─────────────────────────────────────────────────────────

	# Theme
	gsettings set org.gnome.desktop.interface gtk-theme "$GTK_THEME"
	crudini --set ~/.config/gtk-3.0/settings.ini Settings gtk-theme-name "$GTK_THEME" # GTK 3
	sed -i "s/^gtk-theme-name=\".*\"/gtk-theme-name=\"$GTK_THEME\"/" ~/.gtkrc-2.0 # GTK 2

	# Light/Dark
	gsettings set org.gnome.desktop.interface color-scheme prefer-dark # GTK 4
	crudini --set ~/.config/gtk-3.0/settings.ini Settings gtk-application-prefer-dark-theme true # GTK 3

	# Note: gtk-icon-theme-name and gtk-theme-name are the names of their directories, not the name property in their index.theme.

	# Icon
	gsettings set org.gnome.desktop.interface icon-theme "$ICON_THEME"
	crudini --set ~/.config/gtk-3.0/settings.ini Settings gtk-icon-theme-name "$ICON_THEME"
	sed -i "s/^gtk-icon-theme-name=\".*\"/gtk-icon-theme-name=\"$ICON_THEME\"/" ~/.gtkrc-2.0

	# Cursor
	gsettings set org.gnome.desktop.interface cursor-theme "$CURSOR_THEME"
	crudini --set ~/.config/gtk-3.0/settings.ini Settings gtk-cursor-theme-name "$CURSOR_THEME" # GTK 3
	sed -i "s/^gtk-cursor-theme-name=\".*\"/gtk-cursor-theme-name=\"$CURSOR_THEME\"/" ~/.gtkrc-2.0

# ─── Qt / Kvantum ───────────────────────────────────────────────────────────

	# Theme
	kvantummanager --set "$KVANTUM_THEME"

	# Icon
	crudini --set ~/.config/qt6ct/qt6ct.conf Appearance icon_theme "$ICON_THEME" # QT 6
	crudini --set ~/.config/qt5ct/qt5ct.conf Appearance icon_theme "$ICON_THEME" # QT 5
