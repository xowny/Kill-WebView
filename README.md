Kill WebView ⚔️

    "Revenge is a dish best served with free RAM."

Kill WebView is a lightweight script designed to temporarily suppress and block msedgewebview2.exe processes on Windows.

🛑 The Problem

You kill msedgewebview2.exe via Task Manager to save memory, but it resurrects immediately because of Windows "Watchdog" services (Widgets, Search, Teams, Discord).

🗡️ The Solution

This script doesn't just kill the process; it temporarily hijacks the execution intent.

    It DOES NOT delete files: The script does not uninstall or remove the Edge WebView2 runtime.

    It IS Reversible: You can unblock the process at any time with a single key press.

How it works:

    Block Mode: It uses the Windows Registry (Image File Execution Options) to re-route any attempt to launch WebView2 into a dummy process (systray.exe). The system thinks it launched, but no RAM is used.

    Unblock Mode: It removes the registry key, instantly restoring normal functionality for apps like Discord, Steam, or Weather.

🚀 How to Use

    Download Kill WebView.bat

    Double-click the file.

    Choose your option:

        [1] BLOCK: Kills active instances and prevents them from starting.

        [2] UNBLOCK: Allows WebView2 to run normally again.
