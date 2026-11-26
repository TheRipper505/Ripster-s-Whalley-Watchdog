<p align="center">
  <img src="./Ripsters_Whalley_Watchdog_Logo.png" alt="Ripster's Whalley Watchdog" width="300">
</p>

# Ripster’s Whalley Watchdog

**Version 1.1 · November 2026**  
**Free. Independent. Automatic.**

Ripster’s Whalley Watchdog monitors WhalleyBot V3 every minute and automatically restarts it after two consecutive offline readings. It runs independently on Cloudflare Workers and D1, designed to operate within Cloudflare’s free tier. No additional computer, paid hosting, local software installation or modifications to your SCUM server are required.

## Features

- Continuous monitoring with automatic recovery, a two-minute recovery cooldown and a maximum of three recovery attempts per hour.
- Optional Discord integration with a single branded status card that updates in place.
- Observed availability, outage and recovery counts for the last 24 hours, 7 days, 30 days and lifetime, plus monitoring coverage and recovery durations.
- Private administrator incident logging, with optional role mentions when human intervention is required. Successful automatic recoveries are logged without pinging administrators.
- Monitoring-only operation when automatic recovery is disabled.

## Getting started

You need an existing WhalleyBot V3 instance, its panel login credentials and a free Cloudflare account. Discord webhooks are required only if you choose to enable Discord reporting.

1. Download the ZIP from the [latest GitHub release](https://github.com/TheRipper505/Ripster-s-Whalley-Watchdog/releases/latest) and extract it.
2. Open the included Implementation Guide PDF and follow the instructions.
3. Copy the database SQL from `Appendix-B-database.sql` and the complete Worker code from `Appendix-A-worker.txt` into Cloudflare as directed.

No programming experience is required. Do not execute the appendix files locally. They're for your Cloudflare.

## Security and privacy

- The complete, unobfuscated Worker source is available for independent review. The Watchdog communicates with the WhalleyBot panel and, if configured, Discord webhooks. Discord retrieves the branding image from the public GitHub repository.
- Store panel credentials and webhook URLs as Cloudflare secrets. Never share these values or runtime D1 records, which may contain session cookies and CSRF tokens.
- Disable public Worker URLs. Use separate Discord webhook destinations for public status reporting and private administrator notifications.
- Compare the downloaded ZIP’s SHA-256 hash with the checksum published alongside the release. A matching checksum verifies file integrity, not software safety or authorship.
- Report suspected security vulnerabilities privately to the project maintainer. Do not include credentials or production database contents in public reports. Rotate exposed credentials and webhooks promptly.

## Validation and limitations

Live monitoring, automatic recovery, persistent Discord status updates, administrator incident logging, monitoring-only displays, escalated role mentions, and notification retry failures have been fully live-tested and are currently running on SCUM-related discord servers. Notification retries are bounded (up to 100 queued notices) and may produce duplicate messages.

The Watchdog monitors process state, not internal responsiveness. Availability statistics are based on known observations, not a guarantee of continuous uptime. Cloudflare’s account-wide free-tier quotas apply; sustained resource usage and long-term session renewal have not yet been established. Changes to the WhalleyBot panel may require updates to the Worker.

## Project information

This is an independent community contribution, unaffiliated with the developers of WhalleyBot or Cloudflare. Released under the MIT License; see the included `LICENSE` file. Version history is maintained in [GitHub Releases](https://github.com/TheRipper505/Ripster-s-Whalley-Watchdog/releases).

Created by Ripster505 for Prophets Roleplay, 2026.

[Project repository](https://github.com/TheRipper505/Ripster-s-Whalley-Watchdog) · [Get WhalleyBot](https://whalleybot.com/) · [Prophets Roleplay](https://discord.gg/RYZVBy9bVQ)
