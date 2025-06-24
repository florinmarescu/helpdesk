-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 24, 2025 at 10:58 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `helpdesk`
--

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

CREATE TABLE `agents` (
  `agent_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `agents`
--

INSERT INTO `agents` (`agent_id`, `username`, `password`, `firstname`, `lastname`) VALUES
(1, 'mfr1tm', 'password', 'Florin', 'Marescu');

-- --------------------------------------------------------

--
-- Table structure for table `solutionarticles`
--

CREATE TABLE `solutionarticles` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `keywords` varchar(500) DEFAULT NULL,
  `content` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `solutionarticles`
--

INSERT INTO `solutionarticles` (`id`, `title`, `keywords`, `content`) VALUES
(3, 'How to Restart Windows Computer', 'windows, restart, reboot, computer, shut down, power, slow, frozen, not responding, hang, crash, force, hard', '           <h1>How to Restart Windows Computer</h1>\r\n\r\n            <h2>Normal Restart</h2>\r\n            <p>Follow these steps to restart your computer normally:</p>\r\n            <ol>\r\n            <li>Save all your work and close all programs</li>\r\n            <li>Click the Start button in the bottom left corner</li>\r\n            <li>Click the Power button</li>\r\n            <li>Select Restart</li>\r\n            <li>Wait for the computer to restart completely</li>\r\n            </ol>\r\n\r\n            <h2>Force Restart</h2>\r\n            <p>If your computer is frozen and not responding:</p>\r\n            <ol>\r\n            <li>Press and hold the power button for 10 seconds</li>\r\n            <li>Wait for the computer to turn off completely</li>\r\n            <li>Press the power button once to turn it back on</li>\r\n            <li>Wait for Windows to start up</li>\r\n            </ol>\r\n\r\n            <h2>Using Keyboard Shortcut</h2>\r\n            <p>Quick restart using keyboard:</p>\r\n            <ol>\r\n            <li>Press Ctrl + Alt + Delete</li>\r\n            <li>Click the Power button in the bottom right corner</li>\r\n            <li>Select Restart</li>\r\n            </ol>\r\n\r\n            <h2>Emergency reset</h2>\r\n            <p>Using the small hole on the back of a laptop</p>\r\n            <ol>\r\n            <li>Unplug the AC adapter and, if possible, remove the battery</li>\r\n            <li>Identify the reset hole</li>\r\n            <li>Use a paperclip or similar object to press the button</li>\r\n            <li>Wait a minute or so, then reconnect the power adapter and try to power on the laptop</li>\r\n            </ol>\r\n        </div>\r\n    </div>\r\n</body>\r\n</html>'),
(4, 'How to Take a Screenshot in Windows', 'screenshot, screen capture, print screen, snipping tool, windows, capture screen, save screenshot, picture of screen, screen shot, snap', '<h1>How to Take a Screenshot in Windows</h1>\n\n<h2>Method 1: Print Screen Key</h2>\n<p>Capture the entire screen:</p>\n<ol>\n<li>Press the Print Screen key on your keyboard</li>\n<li>Open Paint or Word</li>\n<li>Press Ctrl + V to paste the screenshot</li>\n<li>Save the file</li>\n</ol>\n\n<h2>Method 2: Alt + Print Screen</h2>\n<p>Capture only the active window:</p>\n<ol>\n<li>Click on the window you want to capture</li>\n<li>Press Alt + Print Screen</li>\n<li>Open Paint or Word</li>\n<li>Press Ctrl + V to paste</li>\n<li>Save the file</li>\n</ol>\n\n<h2>Method 3: Windows + Print Screen</h2>\n<p>Save screenshot directly to Pictures folder:</p>\n<ol>\n<li>Press Windows key + Print Screen</li>\n<li>Screen will briefly dim</li>\n<li>Screenshot is automatically saved to Pictures > Screenshots folder</li>\n</ol>\n\n<h2>Method 4: Snipping Tool</h2>\n<p>Select specific area to capture:</p>\n<ol>\n<li>Click Start menu</li>\n<li>Type \"Snipping Tool\" and open it</li>\n<li>Click New</li>\n<li>Drag to select the area you want</li>\n<li>Save the screenshot</li>\n</ol>\n\n<h2>Method 5: Windows + Shift + S</h2>\n<p>Quick area selection:</p>\n<ol>\n<li>Press Windows + Shift + S</li>\n<li>Screen will dim and cursor changes</li>\n<li>Drag to select area</li>\n<li>Screenshot copies to clipboard</li>\n<li>Paste into any program with Ctrl + V</li>\n</ol>\n\n<h2>Where Screenshots are Saved</h2>\n<p>Screenshots are saved in different locations:</p>\n<ul>\n<li>Print Screen: Clipboard only, must paste somewhere</li>\n<li>Windows + Print Screen: Pictures > Screenshots folder</li>\n<li>Snipping Tool: Choose location when saving</li>\n<li>Windows + Shift + S: Clipboard only</li>\n</ul>\n'),
(5, 'How to Change Your Status in Teams', 'teams, status, available, busy, away, do not disturb, offline, presence, microsoft teams, change status, set status', '<h1>How to Change Your Status in Teams</h1>\n\n<h2>Change Status from Main Window</h2>\n<p>Update your status from the Teams main screen:</p>\n<ol>\n<li>Open Microsoft Teams</li>\n<li>Click on your profile picture in the top right corner</li>\n<li>Select your desired status from the dropdown menu</li>\n<li>Your status will update immediately</li>\n</ol>\n\n<h2>Available Status Options</h2>\n<p>Teams offers these status options:</p>\n<ul>\n<li>Available - You are online and ready to chat</li>\n<li>Busy - You are working but may respond to urgent messages</li>\n<li>Do not disturb - You do not want to be interrupted</li>\n<li>Be right back - You are temporarily away</li>\n<li>Away - You are away from your computer</li>\n<li>Offline - You appear offline to others</li>\n</ul>\n\n<h2>Set Custom Status Message</h2>\n<p>Add a custom message to your status:</p>\n<ol>\n<li>Click your profile picture</li>\n<li>Click \"Set status message\"</li>\n<li>Type your custom message</li>\n<li>Choose how long to show the message</li>\n<li>Click Done</li>\n</ol>\n\n<h2>Automatic Status Changes</h2>\n<p>Teams automatically changes your status based on:</p>\n<ul>\n<li>Calendar meetings - Shows as Busy during scheduled meetings</li>\n<li>Computer activity - Shows as Away after 5 minutes of inactivity</li>\n<li>Mobile app - Syncs status between devices</li>\n</ul>\n\n<h2>Reset to Available</h2>\n<p>To reset your status to Available:</p>\n<ol>\n<li>Click your profile picture</li>\n<li>Select \"Available\" from the dropdown</li>\n<li>Any custom message will be cleared</li>\n</ol>\n'),
(6, 'How to Mute and Unmute in Teams', 'teams, mute, unmute, microphone, audio, meeting, call, mic, microsoft teams, sound, mute button, audio controls', '<h1>How to Mute and Unmute in Teams</h1>\n\n<h2>Mute During a Meeting</h2>\n<p>Turn off your microphone during a Teams meeting:</p>\n<ol>\n<li>Look at the bottom of the meeting window</li>\n<li>Click the microphone button to mute</li>\n<li>The button will turn red with a line through it</li>\n<li>Others will not hear you speak</li>\n</ol>\n\n<h2>Unmute During a Meeting</h2>\n<p>Turn your microphone back on:</p>\n<ol>\n<li>Click the red microphone button</li>\n<li>The button will turn back to normal</li>\n<li>You can now speak and others will hear you</li>\n<li>Test by saying hello</li>\n</ol>\n\n<h2>Keyboard Shortcuts</h2>\n<p>Quick mute and unmute using keyboard:</p>\n<ul>\n<li>Ctrl + Shift + M - Toggle mute/unmute</li>\n<li>Ctrl + Spacebar - Push to talk (hold to speak, release to mute)</li>\n</ul>\n\n<h2>Mute Before Joining Meeting</h2>\n<p>Start muted when you join:</p>\n<ol>\n<li>Before clicking Join, check the microphone button</li>\n<li>If it shows a line through it, you will join muted</li>\n<li>If not, click it to mute before joining</li>\n<li>Click Join now to enter the meeting muted</li>\n</ol>\n\n<h2>When Others Mute You</h2>\n<p>If a meeting organizer mutes you:</p>\n<ul>\n<li>You will see a notification that you have been muted</li>\n<li>You can unmute yourself unless the organizer has disabled this</li>\n<li>Click the microphone button to try to unmute</li>\n</ul>\n\n<h2>Audio Settings</h2>\n<p>Check your microphone settings:</p>\n<ol>\n<li>Click the three dots menu in the meeting</li>\n<li>Select Device settings</li>\n<li>Choose your microphone from the dropdown</li>\n<li>Test your microphone volume</li>\n</ol>\n'),
(7, 'How to Clear Outlook Cache', 'outlook, cache, clear cache, outlook slow, performance, autocomplete, reset outlook, outlook problems, email cache, roamcache', '<h1>How to Clear Outlook Cache</h1>\n\n<h2>When to Clear Outlook Cache</h2>\n<p>Clear cache when you experience:</p>\n<ul>\n<li>Outlook running slowly</li>\n<li>Emails not loading properly</li>\n<li>Autocomplete showing old email addresses</li>\n<li>Outlook freezing or crashing</li>\n<li>Sync issues with emails</li>\n</ul>\n\n<h2>Clear Autocomplete Cache</h2>\n<p>Remove old email addresses from autocomplete:</p>\n<ol>\n<li>Open Outlook</li>\n<li>Click File menu</li>\n<li>Select Options</li>\n<li>Click Mail in the left panel</li>\n<li>Click Empty Auto-Complete List</li>\n<li>Click Yes to confirm</li>\n<li>Click OK</li>\n</ol>\n\n<h2>Clear Outlook Data Cache</h2>\n<p>Clear the main Outlook cache files:</p>\n<ol>\n<li>Close Outlook completely</li>\n<li>Press Windows + R to open Run dialog</li>\n<li>Type: %localappdata%MicrosoftOutlook</li>\n<li>Press Enter</li>\n<li>Delete the RoamCache folder</li>\n<li>Restart Outlook</li>\n</ol>\n\n<h2>Clear Offline Cache</h2>\n<p>Reset offline email cache:</p>\n<ol>\n<li>Open Outlook</li>\n<li>Click File menu</li>\n<li>Select Account Settings > Account Settings</li>\n<li>Select your email account</li>\n<li>Click Change</li>\n<li>Click More Settings</li>\n<li>Go to Advanced tab</li>\n<li>Click Outlook Data File Settings</li>\n<li>Click Compact Now</li>\n</ol>\n\n<h2>Safe Mode Cache Clear</h2>\n<p>Clear cache using Outlook safe mode:</p>\n<ol>\n<li>Press Windows + R</li>\n<li>Type: outlook /safe</li>\n<li>Press Enter</li>\n<li>Outlook opens in safe mode</li>\n<li>Close Outlook and restart normally</li>\n</ol>\n'),
(8, 'How to Create Outlook Profile', 'outlook, profile, new profile, email account, outlook profile, setup outlook, email configuration, outlook account, mail profile', '<h1>How to Create Outlook Profile</h1>\n\n<h2>When to Create New Profile</h2>\n<p>Create a new profile when:</p>\n<ul>\n<li>Setting up Outlook for the first time</li>\n<li>Adding a second email account</li>\n<li>Fixing corrupted profile issues</li>\n<li>Separating work and personal emails</li>\n<li>Troubleshooting email problems</li>\n</ul>\n\n<h2>Create Profile via Control Panel</h2>\n<p>Set up new profile through Windows settings:</p>\n<ol>\n<li>Close Outlook completely</li>\n<li>Open Control Panel</li>\n<li>Search for and click Mail</li>\n<li>Click Show Profiles</li>\n<li>Click Add button</li>\n<li>Enter a name for the new profile</li>\n<li>Click OK</li>\n<li>Follow the email setup wizard</li>\n</ol>\n\n<h2>Add Email Account to Profile</h2>\n<p>Configure email account in the new profile:</p>\n<ol>\n<li>Enter your email address</li>\n<li>Click Connect</li>\n<li>Enter your password</li>\n<li>Wait for automatic configuration</li>\n<li>Click Done when setup is complete</li>\n</ol>\n\n<h2>Set Default Profile</h2>\n<p>Choose which profile to use by default:</p>\n<ol>\n<li>In the Mail setup dialog</li>\n<li>Select \"Always use this profile\"</li>\n<li>Choose your preferred profile from dropdown</li>\n<li>Click OK</li>\n<li>Restart Outlook</li>\n</ol>\n\n<h2>Switch Between Profiles</h2>\n<p>Change to a different profile:</p>\n<ol>\n<li>Close Outlook</li>\n<li>Hold Ctrl while starting Outlook</li>\n<li>Select the profile you want to use</li>\n<li>Click OK</li>\n<li>Outlook opens with selected profile</li>\n</ol>\n\n<h2>Delete Old Profile</h2>\n<p>Remove profiles you no longer need:</p>\n<ol>\n<li>Open Control Panel > Mail</li>\n<li>Click Show Profiles</li>\n<li>Select the profile to delete</li>\n<li>Click Remove</li>\n<li>Click Yes to confirm</li>\n</ol>\n'),
(9, 'How to Connect to Cisco Secure Client', 'vpn, cisco, secure client, connect vpn, cisco vpn, remote access, anyconnect, network connection, vpn login', '<h1>How to Connect to Cisco Secure Client</h1>\n\n<h2>Open Cisco Secure Client</h2>\n<p>Start the VPN connection:</p>\n<ol>\n<li>Double-click the Cisco Secure Client icon on your desktop</li>\n<li>Or click the Start menu and search for \"Cisco Secure Client\"</li>\n<li>The application window will open</li>\n</ol>\n\n<h2>Connect to VPN</h2>\n<p>Establish VPN connection to company network:</p>\n<ol>\n<li>Enter the VPN server address (provided by IT)</li>\n<li>Click Connect</li>\n<li>Enter your username</li>\n<li>Enter your password</li>\n<li>Click OK or press Enter</li>\n<li>Wait for connection to establish</li>\n</ol>\n\n<h2>Connection Successful</h2>\n<p>When connected you will see:</p>\n<ul>\n<li>Green checkmark or \"Connected\" status</li>\n<li>VPN icon in system tray (bottom right)</li>\n<li>Connection time and data transfer information</li>\n</ul>\n\n<h2>If Connection Fails</h2>\n<p>Try these basic steps:</p>\n<ol>\n<li>Check your internet connection</li>\n<li>Verify username and password are correct</li>\n<li>Contact IT support for server address</li>\n<li>Restart the application and try again</li>\n</ol>\n'),
(10, 'How to Check VPN Connection Status', 'vpn, status, cisco, secure client, connected, disconnected, vpn check, connection status, network status, vpn icon', '<h1>How to Check VPN Connection Status</h1>\n\n<h2>Check System Tray Icon</h2>\n<p>Quick status check from taskbar:</p>\n<ol>\n<li>Look at the bottom right corner of your screen</li>\n<li>Find the Cisco Secure Client icon</li>\n<li>Green icon means connected</li>\n<li>Gray or red icon means disconnected</li>\n</ol>\n\n<h2>Check in Application</h2>\n<p>View detailed status in the app:</p>\n<ol>\n<li>Open Cisco Secure Client</li>\n<li>Look at the main window</li>\n<li>Connected shows green with checkmark</li>\n<li>Disconnected shows gray with \"Connect\" button</li>\n</ol>\n\n<h2>View Connection Details</h2>\n<p>See connection information:</p>\n<ol>\n<li>Open Cisco Secure Client</li>\n<li>If connected, you will see:</li>\n<li>Server name you are connected to</li>\n<li>Connection time duration</li>\n<li>Data sent and received</li>\n</ol>\n\n<h2>Test Network Access</h2>\n<p>Verify VPN is working properly:</p>\n<ol>\n<li>Try accessing company websites or servers</li>\n<li>Check if internal company resources load</li>\n<li>If you cannot access company resources, VPN may not be working</li>\n</ol>\n\n<h2>Disconnect from VPN</h2>\n<p>Turn off VPN connection when finished:</p>\n<ol>\n<li>Open Cisco Secure Client</li>\n<li>Click Disconnect button</li>\n<li>Confirm disconnection</li>\n<li>Icon will turn gray</li>\n</ol>\n'),
(11, 'How to Save Excel File', 'excel, save, save file, save as, microsoft office, spreadsheet, workbook, xlsx, file save, backup', '<h1>How to Save Excel File</h1>\n\n<h2>Save Current File</h2>\n<p>Save changes to existing file:</p>\n<ol>\n<li>Press Ctrl + S on keyboard</li>\n<li>Or click File menu</li>\n<li>Click Save</li>\n<li>File is saved automatically</li>\n</ol>\n\n<h2>Save New File</h2>\n<p>Save file for the first time:</p>\n<ol>\n<li>Click File menu</li>\n<li>Click Save As</li>\n<li>Choose where to save (Desktop, Documents, etc.)</li>\n<li>Type a name for your file</li>\n<li>Click Save</li>\n</ol>\n\n<h2>Save with Different Name</h2>\n<p>Create a copy with new name:</p>\n<ol>\n<li>Click File menu</li>\n<li>Click Save As</li>\n<li>Type a new file name</li>\n<li>Click Save</li>\n<li>Original file remains unchanged</li>\n</ol>\n\n<h2>AutoSave Feature</h2>\n<p>Excel automatically saves your work:</p>\n<ul>\n<li>AutoSave saves every few minutes</li>\n<li>Look for \"AutoSaved\" message at top</li>\n<li>Still save manually with Ctrl + S for safety</li>\n</ul>\n\n<h2>Save in Different Format</h2>\n<p>Save as different file type:</p>\n<ol>\n<li>Click File > Save As</li>\n<li>Click the file type dropdown</li>\n<li>Choose format (Excel, CSV, PDF, etc.)</li>\n<li>Click Save</li>\n</ol>\n'),
(12, 'How to Change Font in Word', 'word, font, text, formatting, microsoft office, change font, font size, font style, text formatting, document', '<h1>How to Change Font in Word</h1>\n\n<h2>Change Font for Selected Text</h2>\n<p>Change font for specific text:</p>\n<ol>\n<li>Select the text you want to change</li>\n<li>Click the font dropdown arrow in the toolbar</li>\n<li>Choose a new font from the list</li>\n<li>Text changes immediately</li>\n</ol>\n\n<h2>Change Font Size</h2>\n<p>Make text larger or smaller:</p>\n<ol>\n<li>Select the text</li>\n<li>Click the font size dropdown</li>\n<li>Choose a number (12 is normal, 18 is large)</li>\n<li>Or type a custom size number</li>\n</ol>\n\n<h2>Change Font for Entire Document</h2>\n<p>Change all text in document:</p>\n<ol>\n<li>Press Ctrl + A to select all text</li>\n<li>Choose new font from dropdown</li>\n<li>All text changes to new font</li>\n</ol>\n\n<h2>Common Font Options</h2>\n<p>Popular fonts to choose from:</p>\n<ul>\n<li>Times New Roman - Traditional, formal</li>\n<li>Arial - Clean, easy to read</li>\n<li>Calibri - Modern default font</li>\n<li>Comic Sans - Casual, informal</li>\n</ul>\n\n<h2>Quick Font Shortcuts</h2>\n<p>Keyboard shortcuts for formatting:</p>\n<ul>\n<li>Ctrl + B - Make text bold</li>\n<li>Ctrl + I - Make text italic</li>\n<li>Ctrl + U - Underline text</li>\n</ul>\n\n<h2>Set Default Font</h2>\n<p>Change default font for new documents:</p>\n<ol>\n<li>Click Home tab</li>\n<li>Click small arrow in Font section</li>\n<li>Choose font and size</li>\n<li>Click Set As Default</li>\n<li>Click All documents based on Normal template</li>\n</ol>\n'),
(13, 'How to Reset Default Settings on Mobile', 'mobile, reset, default settings, factory reset, phone settings, android, iphone, reset phone, restore settings, mobile reset', '<h1>How to Reset Default Settings on Mobile</h1>\n\n<h2>Before You Reset</h2>\n<p>Important steps before resetting:</p>\n<ul>\n<li>Backup your important photos and files</li>\n<li>Write down important phone numbers</li>\n<li>Remember your email passwords</li>\n<li>Note down WiFi passwords you use</li>\n</ul>\n\n<h2>Reset Android Phone</h2>\n<p>Reset settings on Android device:</p>\n<ol>\n<li>Open Settings app</li>\n<li>Scroll down and tap System</li>\n<li>Tap Reset options</li>\n<li>Tap Factory data reset</li>\n<li>Tap Reset phone</li>\n<li>Enter your PIN or password</li>\n<li>Tap Erase everything</li>\n</ol>\n\n<h2>Reset iPhone</h2>\n<p>Reset settings on iPhone:</p>\n<ol>\n<li>Open Settings app</li>\n<li>Tap General</li>\n<li>Scroll down and tap Transfer or Reset iPhone</li>\n<li>Tap Reset</li>\n<li>Choose Reset All Settings or Erase All Content and Settings</li>\n<li>Enter your passcode</li>\n<li>Confirm the reset</li>\n</ol>\n\n<h2>What Gets Reset</h2>\n<p>Factory reset will remove:</p>\n<ul>\n<li>All apps you downloaded</li>\n<li>Photos and videos</li>\n<li>Text messages</li>\n<li>WiFi passwords</li>\n<li>Personal settings and preferences</li>\n</ul>\n\n<h2>After Reset</h2>\n<p>Setting up your phone again:</p>\n<ol>\n<li>Phone will restart and show setup screen</li>\n<li>Connect to WiFi network</li>\n<li>Sign in with your Apple ID or Google account</li>\n<li>Restore from backup if available</li>\n<li>Download your apps again</li>\n</ol>\n'),
(14, 'How to Find Serial Number of Mobile', 'mobile, serial number, IMEI, phone number, device info, android, iphone, model number, device serial, phone info', '<h1>How to Find Serial Number of Mobile</h1>\n\n<h2>Find Serial on Android</h2>\n<p>Get device information on Android phone:</p>\n<ol>\n<li>Open Settings app</li>\n<li>Scroll down and tap About phone</li>\n<li>Look for Serial number or Device information</li>\n<li>You will see serial number, IMEI, and model</li>\n</ol>\n\n<h2>Find Serial on iPhone</h2>\n<p>Get device information on iPhone:</p>\n<ol>\n<li>Open Settings app</li>\n<li>Tap General</li>\n<li>Tap About</li>\n<li>Scroll down to see Serial Number</li>\n<li>Also shows Model, IMEI, and other info</li>\n</ol>\n\n<h2>Using Phone Dialer</h2>\n<p>Quick way to get IMEI number:</p>\n<ol>\n<li>Open Phone app</li>\n<li>Dial *#06#</li>\n<li>IMEI number appears on screen</li>\n<li>Write down the number</li>\n</ol>\n\n<h2>Check Physical Device</h2>\n<p>Find numbers printed on phone:</p>\n<ul>\n<li>Remove back cover or SIM tray</li>\n<li>Look for small printed numbers</li>\n<li>Serial number may be under battery</li>\n<li>Check original phone box for sticker</li>\n</ul>\n\n<h2>What Numbers Mean</h2>\n<p>Different types of device numbers:</p>\n<ul>\n<li>Serial Number - Unique device identifier</li>\n<li>IMEI - International Mobile Equipment Identity</li>\n<li>Model Number - Phone model and version</li>\n<li>Build Number - Software version info</li>\n</ul>\n\n<h2>When You Need These Numbers</h2>\n<p>Serial numbers are needed for:</p>\n<ul>\n<li>Warranty claims and repairs</li>\n<li>Insurance claims</li>\n<li>Reporting stolen phone</li>\n<li>Technical support calls</li>\n<li>Company device registration</li>\n</ul>\n');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `ticket_id` int(11) NOT NULL,
  `customer_firstname` varchar(50) NOT NULL,
  `customer_lastname` varchar(50) NOT NULL,
  `customer_phone` varchar(20) NOT NULL,
  `customer_mobile` varchar(20) DEFAULT NULL,
  `customer_email` varchar(100) NOT NULL,
  `ticket_type` enum('failure','request') NOT NULL,
  `ticket_status` enum('open','in_progress','resolved') DEFAULT 'open',
  `priority` enum('low','medium','high','critical') DEFAULT 'medium',
  `created` datetime DEFAULT current_timestamp(),
  `title` varchar(255) NOT NULL,
  `script` mediumtext DEFAULT NULL,
  `agent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`ticket_id`, `customer_firstname`, `customer_lastname`, `customer_phone`, `customer_mobile`, `customer_email`, `ticket_type`, `ticket_status`, `priority`, `created`, `title`, `script`, `agent_id`) VALUES
(1, 'Ioan', 'Babeu', '0256001100', '0711010101', 'ioan.babeu@email.com', 'failure', 'resolved', 'medium', '2025-06-12 12:18:30', 'not responding', 'PROBLEM DESCRIPTION\nWhat specific issue are you experiencing?\nA: pc is dead\n\nWhen did this problem first occur?\nA: \n\nSYSTEM INFORMATION\nWhat device are you using? (Desktop/Laptop/Handheld)\nA: \n\nOperating system? (Windows 10/11, macOS, etc.)\nA: \n\nERROR DETAILS\nAre you receiving any error messages?\nA: \n\n[] Can you reproduce the problem consistently?\n\nTROUBLESHOOTING APPLIED:\nA: \n\nIMPACT:\nIs this preventing you from working?\nA: \n\nHow many users are affected?\nA: \n\nPREFERRED FORM OF CONTACT:\n[] Email \n[] Phone \n[] Mobile \n[] Other: \n\nTICKET RESOLUTION:', 1),
(2, 'Ioan', 'Babeu', '0256001100', '0711010101', 'ioan.babeu@email.com', 'failure', 'open', 'low', '2025-06-12 12:46:52', 'test ticket', 'PROBLEM DESCRIPTION\nWhat specific issue are you experiencing?\nA: a problem occured\n\nWhen did this problem first occur?\nA: now\n\nSYSTEM INFORMATION\nWhat device are you using? (Desktop/Laptop/Handheld)\nA: laptop\n\nOperating system? (Windows 10/11, macOS, etc.)\nA: windows 11\n\nERROR DETAILS\nAre you receiving any error messages?\nA: \n\n[x] Can you reproduce the problem consistently?\n\nTROUBLESHOOTING APPLIED:\nA: none this is a test\n\nIMPACT:\nIs this preventing you from working?\nA: not really\n\nHow many users are affected?\nA: everyone\n\nPREFERRED FORM OF CONTACT:\n[] Email \n[x] Phone \n[] Mobile \n[] Other: \n\nTICKET RESOLUTION:', 1),
(3, 'Ioan', 'Babeu', '0256001100', '0711010101', 'ioan.babeu@email.com', 'failure', 'open', 'medium', '2025-06-12 12:48:06', 'test 2', 'PROBLEM DESCRIPTION\nWhat specific issue are you experiencing?\nA: \n\nWhen did this problem first occur?\nA: \n\nSYSTEM INFORMATION\nWhat device are you using? (Desktop/Laptop/Handheld)\nA: \n\nOperating system? (Windows 10/11, macOS, etc.)\nA: \n\nERROR DETAILS\nAre you receiving any error messages?\nA: \n\n[] Can you reproduce the problem consistently?\n\nTROUBLESHOOTING APPLIED:\nA: \n\nIMPACT:\nIs this preventing you from working?\nA: \n\nHow many users are affected?\nA: \n\nPREFERRED FORM OF CONTACT:\n[] Email \n[] Phone \n[] Mobile \n[] Other: \n\nTICKET RESOLUTION:', 1),
(4, 'Ioan', 'Babeu', '0256001100', '0711010101', 'ioan.babeu@email.com', 'failure', 'open', 'medium', '2025-06-12 13:09:25', 'test test test', 'PROBLEM DESCRIPTION\nWhat specific issue are you experiencing?\nA: \n\nWhen did this problem first occur?\nA: \n\nSYSTEM INFORMATION\nWhat device are you using? (Desktop/Laptop/Handheld)\nA: \n\nOperating system? (Windows 10/11, macOS, etc.)\nA: \n\nERROR DETAILS\nAre you receiving any error messages?\nA: \n\n[] Can you reproduce the problem consistently?\n\nTROUBLESHOOTING APPLIED:\nA: \n\nIMPACT:\nIs this preventing you from working?\nA: \n\nHow many users are affected?\nA: \n\nPREFERRED FORM OF CONTACT:\n[] Email \n[] Phone \n[] Mobile \n[] Other: \n\nTICKET RESOLUTION:', 1),
(5, 'Ioan', 'Babeu', '0256001100', '0711010101', 'ioan.babeu@email.com', 'failure', 'resolved', '', '2025-06-12 13:17:42', 'new ticket', 'PROBLEM DESCRIPTION\nWhat specific issue are you experiencing?\nA: \n\nWhen did this problem first occur?\nA: \n\nSYSTEM INFORMATION\nWhat device are you using? (Desktop/Laptop/Handheld)\nA: \n\nOperating system? (Windows 10/11, macOS, etc.)\nA: \n\nERROR DETAILS\nAre you receiving any error messages?\nA: \n\n[] Can you reproduce the problem consistently?\n\nTROUBLESHOOTING APPLIED:\nA: \n\nIMPACT:\nIs this preventing you from working?\nA: \n\nHow many users are affected?\nA: \n\nPREFERRED FORM OF CONTACT:\n[] Email \n[] Phone \n[] Mobile \n[] Other: \n\nTICKET RESOLUTION:', 1),
(6, 'Ioan', 'Babeu', '0256001100', '0711010101', 'ioan.babeu@email.com', 'failure', 'resolved', '', '2025-06-12 13:32:09', 'new ticket', 'PROBLEM DESCRIPTION\nWhat specific issue are you experiencing?\nA: \n\nWhen did this problem first occur?\nA: \n\nSYSTEM INFORMATION\nWhat device are you using? (Desktop/Laptop/Handheld)\nA: \n\nOperating system? (Windows 10/11, macOS, etc.)\nA: \n\nERROR DETAILS\nAre you receiving any error messages?\nA: \n\n[] Can you reproduce the problem consistently?\n\nTROUBLESHOOTING APPLIED:\nA: \n\nIMPACT:\nIs this preventing you from working?\nA: \n\nHow many users are affected?\nA: \n\nPREFERRED FORM OF CONTACT:\n[] Email \n[] Phone \n[] Mobile \n[] Other: \n\nTICKET RESOLUTION:', 1),
(7, 'Ioan', 'Babeu', '0256001100', '0711010101', 'ioan.babeu@email.com', 'failure', 'resolved', '', '2025-06-12 13:32:20', 'new ticket', 'PROBLEM DESCRIPTION\nWhat specific issue are you experiencing?\nA: \n\nWhen did this problem first occur?\nA: \n\nSYSTEM INFORMATION\nWhat device are you using? (Desktop/Laptop/Handheld)\nA: \n\nOperating system? (Windows 10/11, macOS, etc.)\nA: \n\nERROR DETAILS\nAre you receiving any error messages?\nA: \n\n[] Can you reproduce the problem consistently?\n\nTROUBLESHOOTING APPLIED:\nA: \n\nIMPACT:\nIs this preventing you from working?\nA: \n\nHow many users are affected?\nA: \n\nPREFERRED FORM OF CONTACT:\n[] Email \n[] Phone \n[] Mobile \n[] Other: \n\nTICKET RESOLUTION:', 1),
(8, 'Ioan', 'Babeu', '0256001100', '0711010101', 'ioan.babeu@email.com', 'failure', 'resolved', 'medium', '2025-06-12 13:32:29', 'new ticket', 'PROBLEM DESCRIPTION\nWhat specific issue are you experiencing?\nA: asdada\n\nWhen did this problem first occur?\nA: asdad\n\nSYSTEM INFORMATION\nWhat device are you using? (Desktop/Laptop/Handheld)\nA: \n\nOperating system? (Windows 10/11, macOS, etc.)\nA: \n\nERROR DETAILS\nAre you receiving any error messages?\nA: \n\n[] Can you reproduce the problem consistently?\n\nTROUBLESHOOTING APPLIED:\nA: \n\nIMPACT:\nIs this preventing you from working?\nA: \n\nHow many users are affected?\nA: \n\nPREFERRED FORM OF CONTACT:\n[] Email \n[] Phone \n[] Mobile \n[] Other: \n\nTICKET RESOLUTION:', 1),
(9, 'Ioan', 'Babeu', '0256001100', '0711010101', 'ioan.babeu@email.com', 'failure', '', 'medium', '2025-06-12 13:32:41', 'new ticket', 'PROBLEM DESCRIPTION\nWhat specific issue are you experiencing?\nA: asdada\n\nWhen did this problem first occur?\nA: asdad\n\nSYSTEM INFORMATION\nWhat device are you using? (Desktop/Laptop/Handheld)\nA: \n\nOperating system? (Windows 10/11, macOS, etc.)\nA: \n\nERROR DETAILS\nAre you receiving any error messages?\nA: \n\n[] Can you reproduce the problem consistently?\n\nTROUBLESHOOTING APPLIED:\nA: \n\nIMPACT:\nIs this preventing you from working?\nA: \n\nHow many users are affected?\nA: \n\nPREFERRED FORM OF CONTACT:\n[] Email \n[] Phone \n[] Mobile \n[] Other: \n\nTICKET RESOLUTION:', 1),
(10, 'Ioan', 'Babeu', '0256001100', '0711010101', 'ioan.babeu@email.com', 'failure', 'resolved', 'high', '2025-06-12 13:33:14', 'new ticket', 'PROBLEM DESCRIPTION\nWhat specific issue are you experiencing?\nA: asdada\n\nWhen did this problem first occur?\nA: asdad\n\nSYSTEM INFORMATION\nWhat device are you using? (Desktop/Laptop/Handheld)\nA: \n\nOperating system? (Windows 10/11, macOS, etc.)\nA: \n\nERROR DETAILS\nAre you receiving any error messages?\nA: \n\n[] Can you reproduce the problem consistently?\n\nTROUBLESHOOTING APPLIED:\nA: \n\nIMPACT:\nIs this preventing you from working?\nA: \n\nHow many users are affected?\nA: \n\nPREFERRED FORM OF CONTACT:\n[] Email \n[] Phone \n[] Mobile \n[] Other: \n\nTICKET RESOLUTION:', 1),
(11, 'Ioan', 'Babeu', '0256001100', '0711010101', 'ioan.babeu@email.com', 'request', 'open', 'low', '2025-06-12 13:36:04', 'new ticket test', 'PROBLEM DESCRIPTION\nWhat specific issue are you experiencing?\nA: 1111111111\n\nWhen did this problem first occur?\nA: 1111111\n\nSYSTEM INFORMATION\nWhat device are you using? (Desktop/Laptop/Handheld)\nA: \n\nOperating system? (Windows 10/11, macOS, etc.)\nA: \n\nERROR DETAILS\nAre you receiving any error messages?\nA: \n\n[] Can you reproduce the problem consistently?\n\nTROUBLESHOOTING APPLIED:\nA: \n\nIMPACT:\nIs this preventing you from working?\nA: \n\nHow many users are affected?\nA: \n\nPREFERRED FORM OF CONTACT:\n[] Email \n[] Phone \n[] Mobile \n[] Other: \n\nTICKET RESOLUTION:', 1),
(12, 'Ioan', 'Babeu', '0256001100', '0711010101', 'ioan.babeu@email.com', 'request', 'open', 'low', '2025-06-12 13:36:21', 'new ticket test', 'PROBLEM DESCRIPTION\nWhat specific issue are you experiencing?\nA: 1111111111\n\nWhen did this problem first occur?\nA: 1111111\n\nSYSTEM INFORMATION\nWhat device are you using? (Desktop/Laptop/Handheld)\nA: \n\nOperating system? (Windows 10/11, macOS, etc.)\nA: \n\nERROR DETAILS\nAre you receiving any error messages?\nA: \n\n[] Can you reproduce the problem consistently?\n\nTROUBLESHOOTING APPLIED:\nA: \n\nIMPACT:\nIs this preventing you from working?\nA: \n\nHow many users are affected?\nA: \n\nPREFERRED FORM OF CONTACT:\n[] Email \n[] Phone \n[] Mobile \n[] Other: \n\nTICKET RESOLUTION:', 1),
(13, 'Ioan', 'Babeu', '0256001100', '0711010101', 'ioan.babeu@email.com', 'request', '', 'low', '2025-06-12 13:38:31', 'new ticket test', 'PROBLEM DESCRIPTION\nWhat specific issue are you experiencing?\nA: 1111111111\n\nWhen did this problem first occur?\nA: 1111111\n\nSYSTEM INFORMATION\nWhat device are you using? (Desktop/Laptop/Handheld)\nA: \n\nOperating system? (Windows 10/11, macOS, etc.)\nA: \n\nERROR DETAILS\nAre you receiving any error messages?\nA: \n\n[] Can you reproduce the problem consistently?\n\nTROUBLESHOOTING APPLIED:\nA: \n\nIMPACT:\nIs this preventing you from working?\nA: \n\nHow many users are affected?\nA: \n\nPREFERRED FORM OF CONTACT:\n[] Email \n[] Phone \n[] Mobile \n[] Other: \n\nTICKET RESOLUTION:', 1),
(14, 'Ioan', 'Babeu', '0256001100', '0711010101', 'ioan.babeu@email.com', 'request', 'open', 'low', '2025-06-12 13:53:41', 'new ticket test', 'PROBLEM DESCRIPTION\nWhat specific issue are you experiencing?\nA: 1111111111\n\nWhen did this problem first occur?\nA: 1111111\n\nSYSTEM INFORMATION\nWhat device are you using? (Desktop/Laptop/Handheld)\nA: \n\nOperating system? (Windows 10/11, macOS, etc.)\nA: \n\nERROR DETAILS\nAre you receiving any error messages?\nA: \n\n[] Can you reproduce the problem consistently?\n\nTROUBLESHOOTING APPLIED:\nA: \n\nIMPACT:\nIs this preventing you from working?\nA: \n\nHow many users are affected?\nA: \n\nPREFERRED FORM OF CONTACT:\n[] Email \n[] Phone \n[] Mobile \n[] Other: \n\nTICKET RESOLUTION:', 1),
(15, 'Ioan', 'Babeu', '0256001100', '0711010101', 'ioan.babeu@email.com', 'failure', 'resolved', 'medium', '2025-06-12 13:54:13', 'new ticket', 'PROBLEM DESCRIPTION\nWhat specific issue are you experiencing?\nA: asdada\n\nWhen did this problem first occur?\nA: asdad\n\nSYSTEM INFORMATION\nWhat device are you using? (Desktop/Laptop/Handheld)\nA: \n\nOperating system? (Windows 10/11, macOS, etc.)\nA: \n\nERROR DETAILS\nAre you receiving any error messages?\nA: \n\n[] Can you reproduce the problem consistently?\n\nTROUBLESHOOTING APPLIED:\nA: \n\nIMPACT:\nIs this preventing you from working?\nA: \n\nHow many users are affected?\nA: \n\nPREFERRED FORM OF CONTACT:\n[] Email \n[] Phone \n[] Mobile \n[] Other: \n\nTICKET RESOLUTION:', 1),
(16, 'Ioan', 'Babeu', '0256001100', '0711010101', 'ioan.babeu@email.com', 'failure', 'resolved', 'medium', '2025-06-12 14:08:31', 'new ticket', 'PROBLEM DESCRIPTION\nWhat specific issue are you experiencing?\nA: asdada\n\nWhen did this problem first occur?\nA: asdad\n\nSYSTEM INFORMATION\nWhat device are you using? (Desktop/Laptop/Handheld)\nA: \n\nOperating system? (Windows 10/11, macOS, etc.)\nA: \n\nERROR DETAILS\nAre you receiving any error messages?\nA: \n\n[] Can you reproduce the problem consistently?\n\nTROUBLESHOOTING APPLIED:\nA: \n\nIMPACT:\nIs this preventing you from working?\nA: \n\nHow many users are affected?\nA: \n\nPREFERRED FORM OF CONTACT:\n[] Email \n[] Phone \n[] Mobile \n[] Other: \n\nTICKET RESOLUTION:', 1),
(17, 'Ioan', 'Babeu', '0256001100', '0711010101', 'ioan.babeu@email.com', 'failure', 'resolved', 'high', '2025-06-12 14:08:56', 'new ticket', 'PROBLEM DESCRIPTION\nWhat specific issue are you experiencing?\nA: asdada\n\nWhen did this problem first occur?\nA: asdad\n\nSYSTEM INFORMATION\nWhat device are you using? (Desktop/Laptop/Handheld)\nA: \n\nOperating system? (Windows 10/11, macOS, etc.)\nA: \n\nERROR DETAILS\nAre you receiving any error messages?\nA: \n\n[] Can you reproduce the problem consistently?\n\nTROUBLESHOOTING APPLIED:\nA: \n\nIMPACT:\nIs this preventing you from working?\nA: \n\nHow many users are affected?\nA: \n\nPREFERRED FORM OF CONTACT:\n[] Email \n[] Phone \n[] Mobile \n[] Other: \n\nTICKET RESOLUTION:', 1),
(18, '', '', '', '', '', 'failure', 'resolved', 'high', '2025-06-12 14:14:13', 'A NEW ISSUE', 'PROBLEM DESCRIPTION\nWhat specific issue are you experiencing?\nA: LAPTOP KAPUT\n\nWhen did this problem first occur?\nA: LAPTOP KAPUT\n\nSYSTEM INFORMATION\nWhat device are you using? (Desktop/Laptop/Handheld)\nA: LAPTOP KAPUT\n\nOperating system? (Windows 10/11, macOS, etc.)\nA: LAPTOP KAPUT\n\nERROR DETAILS\nAre you receiving any error messages?\nA: LAPTOP KAPUT\n\n[] Can you reproduce the problem consistently?\n\nTROUBLESHOOTING APPLIED:\nA: LAPTOP KAPUT\n\nIMPACT:\nIs this preventing you from working?\nA: LAPTOP KAPUT\n\nHow many users are affected?\nA: LAPTOP KAPUT\n\nPREFERRED FORM OF CONTACT:\n[] Email \n[] Phone \n[] Mobile \n[] Other: \n\nTICKET RESOLUTION: TBD', 1),
(19, 'Ioan', 'Babeu', '0256001100', '0711010101', 'ioan.babeu@email.com', 'failure', 'resolved', 'high', '2025-06-12 14:37:23', 'last test', 'PROBLEM DESCRIPTION\nWhat specific issue are you experiencing?\nA: \n\nWhen did this problem first occur?\nA: \n\nSYSTEM INFORMATION\nWhat device are you using? (Desktop/Laptop/Handheld)\nA: \n\nOperating system? (Windows 10/11, macOS, etc.)\nA: \n\nERROR DETAILS\nAre you receiving any error messages?\nA: \n\n[] Can you reproduce the problem consistently?\n\nTROUBLESHOOTING APPLIED:\nA: \n\nIMPACT:\nIs this preventing you from working?\nA: \n\nHow many users are affected?\nA: \n\nPREFERRED FORM OF CONTACT:\n[] Email \n[] Phone \n[] Mobile \n[] Other: \n\nTICKET RESOLUTION:', 1),
(20, 'Ioan', 'Babeu', '0256001100', '0711010101', 'ioan.babeu@email.com', 'failure', 'resolved', 'medium', '2025-06-16 13:05:12', 'test', 'PROBLEM DESCRIPTION\nWhat specific issue are you experiencing?\nA: \n\nWhen did this problem first occur?\nA: \n\nSYSTEM INFORMATION\nWhat device are you using? (Desktop/Laptop/Handheld)\nA: \n\nOperating system? (Windows 10/11, macOS, etc.)\nA: \n\nERROR DETAILS\nAre you receiving any error messages?\nA: \n\n[] Can you reproduce the problem consistently?\n\nTROUBLESHOOTING APPLIED:\nA: \n\nIMPACT:\nIs this preventing you from working?\nA: \n\nHow many users are affected?\nA: \n\nPREFERRED FORM OF CONTACT:\n[] Email \n[] Phone \n[] Mobile \n[] Other: \n\nTICKET RESOLUTION:', 1),
(21, 'Ioan', 'Babeu', '', '0711010101', 'ioan.babeu@email.com', 'failure', 'in_progress', 'high', '2025-06-23 13:00:19', 'a new problem', 'PROBLEM DESCRIPTION\nWhat specific issue are you experiencing?\nA: many\n\nWhen did this problem first occur?\nA: today\n\nSYSTEM INFORMATION\nWhat device are you using? (Desktop/Laptop/Handheld)\nA: desktop\n\nOperating system? (Windows 10/11, macOS, etc.)\nA: win10\n\nERROR DETAILS\nAre you receiving any error messages?\nA: yes\n\n[] Can you reproduce the problem consistently?\n\nTROUBLESHOOTING APPLIED:\nA: none\n\nIMPACT:\nIs this preventing you from working?\nA: yes\n\nHow many users are affected?\nA: just this one\n\nPREFERRED FORM OF CONTACT:\n[x] Email \n[x] Phone \n[x] Mobile \n[] Other: \n\nTICKET RESOLUTION:', 1),
(22, 'Ioan', 'Babeu', '0256001100', '0711010101', 'ioan.babeu@email.com', 'failure', 'resolved', 'high', '2025-06-23 13:01:03', 'a new problem', 'PROBLEM DESCRIPTION\nWhat specific issue are you experiencing?\nA: many\n\nWhen did this problem first occur?\nA: today\n\nSYSTEM INFORMATION\nWhat device are you using? (Desktop/Laptop/Handheld)\nA: desktop\n\nOperating system? (Windows 10/11, macOS, etc.)\nA: win10\n\nERROR DETAILS\nAre you receiving any error messages?\nA: yes\n\n[] Can you reproduce the problem consistently?\n\nTROUBLESHOOTING APPLIED:\nA: none\n\nIMPACT:\nIs this preventing you from working?\nA: yes\n\nHow many users are affected?\nA: just this one\n\nPREFERRED FORM OF CONTACT:\n[x] Email \n[x] Phone \n[x] Mobile \n[] Other: \n\nTICKET RESOLUTION:', 1),
(23, 'Alexandra', 'Coman', '0211456111', '+40754212343', 'Alexandra.Comanh@fakemail.com', 'request', 'resolved', 'low', '2025-06-24 11:08:54', 'a new test problem', 'PROBLEM DESCRIPTION\nWhat specific issue are you experiencing?\nA: nothing really just a test\n\nWhen did this problem first occur?\nA: \n\nSYSTEM INFORMATION\nWhat device are you using? (Desktop/Laptop/Handheld)\nA: \n\nOperating system? (Windows 10/11, macOS, etc.)\nA: \n\nERROR DETAILS\nAre you receiving any error messages?\nA: \n\n[] Can you reproduce the problem consistently?\n\nTROUBLESHOOTING APPLIED:\nA: \n\nIMPACT:\nIs this preventing you from working?\nA: \n\nHow many users are affected?\nA: \n\nPREFERRED FORM OF CONTACT:\n[] Email \n[] Phone \n[] Mobile \n[] Other: \n\nTICKET RESOLUTION:', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `mobile` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `firstname`, `lastname`, `email`, `phone`, `mobile`) VALUES
(1, 'Ioan', 'Babeu', 'ioan.babeu@email.com', '0256001100', '0711010101'),
(2, 'Alexandra', 'Coman', 'Alexandra.Comanh@fakemail.com', '0211456111', '+40754212343');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`agent_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `solutionarticles`
--
ALTER TABLE `solutionarticles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `agent_id` (`agent_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agents`
--
ALTER TABLE `agents`
  MODIFY `agent_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `solutionarticles`
--
ALTER TABLE `solutionarticles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`agent_id`) REFERENCES `agents` (`agent_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
