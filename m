Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795001601;
	b=hMHfRmHys8rnb66K+HWE2jV35nr+Xme9SHLR4NxZvRHaCZMNFZ1qsNH4/I44hDLY1zDr
	 oVtyMESoqvLJeVW+tZzehzcMP+AQukC8Rg4b82v4pqKp0LaNWm8U7MGUg1tD7rsR2zUgd
	 3Fi5nnVLjIVXfvVoZ5KJqSFo4JN8SzXftiTxpm0hb9fALXloJucd2noLcWfpoYfulMXhf
	 TDuds1ubR1hqLKK7LPVx1yAywyzS1wUTAtcCR5h529zcQprY/Wrxy/ihsGId7qQe8vzZR
	 o1E2qqWxgOHzCbhTGWgTvBal9cnfX+AO4PZFhUJmukFMov4dMzbB1vKbXLz1QwqXWOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795001601;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=7UG0JPbjn6aH3NrcP1EtB4S7cbz2TK8S8J6WbkM9l3c=;
	b=ICLDsugmBW0x5vCZBMi+6Be9uoWc/BE5jn85GNAaPEIJzbGBmgU6bWZ+/c2LXjyI0ZD9
	 w2b/JAz66TLq8/8Hw2eM9RExdpalt9I/uw2z8gEaQ6CD7+jC4JNp2T1RkR6LtVYWHR8Zt
	 f0yDGr9XEqVSIiToVu3pUMXHB8O/uTQGdwFvCm17B7yPTUcX9p4FknMY0JC3DHgVx0L9M
	 qCikHbuvg6QO4T3RSIVVAusWCiNSoBCvGWOjhxWRVE6tivNMPa90PZlwCuimBruT6Hvc1
	 v2ve2MK+7HapnnV2o95jwTkksX5+KsKjA2r5pN7wBmXWbZF539XI1C72hJMRX0HEZig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NAjGcZ5q;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21499606A320
	for <sophgo@lists.linux.dev>; Wed, 18 Nov 2026 11:33:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21499606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NAjGcZ5q
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so467182a12.1
        for <sophgo@lists.linux.dev>; Wed, 18 Nov 2026 03:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795001600; x=1795606400; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7UG0JPbjn6aH3NrcP1EtB4S7cbz2TK8S8J6WbkM9l3c=;
        b=NAjGcZ5qFCpyDWBoW2PJg3fZ9JE3kcxexB/A2cZUOfLZJt53RpSHNzcuchCyRwsoIb
         ans6ccQDicIfQx5qW/lEb4Yrq70QL0oDgNjkp1wYSBMQFQh4vwnWiaII/OdlCG/MTQUC
         JUAmb4KZ5lWODL1v+vvYW6R3pvUD5HDb8okMM2kJcvV4qmMtkyd2VWN84iT1o5dvfc1v
         4xoCb7aU6yYrVNrwQ09USkGw7aZcaK3PaTOknXDwL0kTv9FeVjAt5PeeH6EfKwHUy9Ve
         KUeG5+8ZgAst/lQTGOa7iSxk8bceHMu8Cy+QxeXbbXuHwqMchsaW8MkXed3VcjtlnbZV
         SLwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795001600; x=1795606400;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7UG0JPbjn6aH3NrcP1EtB4S7cbz2TK8S8J6WbkM9l3c=;
        b=B8RZqxcYkQtXQm1+7D4dXFw7AlYtN1vvM3d88SgBzJAYUXaMuWe+5Gx9cWdgh0i5P2
         ZQXF9fYurrg7yHpircwx9oG5x8SB9CbVgY+8lGlnxyvM1jAAbilgtfMXwaDlRUSq1b4t
         cHkAMqL+CXadxYUMXcuwYRJgZod+Teq8kXkhwimSWRZOGJlVQxWiIBydwPmxObORB/Pt
         xYavFIuatZarNm94IRByPfiVP4ItzhRpCXTw+Hk6kNqilUiz3obIObL+Sdf+tjCUjEnd
         gdcfHWke6nEv9Yc16wlhuHHR1H3joU47x6CPNdgVC6OfsYiRIgC0iLnfZrP1jRYHIFAZ
         4NnA==
X-Forwarded-Encrypted: i=1; AL+hErFzSYGLS1fo6JXKj2u1pFj9Di2/9hTr+0cFWqslceb6BM64Se3dOdGy97+uknJ1RO7UcEPxPec=@lists.linux.dev
X-Gm-Message-State: APuU4Z+avs8enuHDzvNDyE7OjTcAZvyyMN+X6jlYfvfJmPCF01SVUR3q
	S2ISBt84rDcn7dY4xUQ1+AJRtebFYd2zqiCAXPLQTs0UPrZSnNVBTom+
X-Gm-Gg: AZFdTZdCaFE9LYGb67zL13VDrFucg+7IlxAkX/x/Ha5VM572Ecg4XPvPylV+v+S62P8
	z8I/pFFQYBa76+iFIVd0X84IrLBxbvFazcr5AnYAVqitE46v5fwtx79BvxzEQYDgelhJQJ5Jah3
	n9NZo5tfEwM+DYthqYa5qVeSWgAAA5t+HX8Zf8vj2LLKlfsBEn5WXuSEmAd5NGhaW/ZpBOW2Dxr
	B/AIH3BOjP+wKOTrOxpqrjBscvHH5YZe6MiKhBzOXtB1A6BE71ZlJgRtqsCGqgcAt8wgptTG2NQ
	DtvN/LVWwix3giQsHhW1bzowLtwvxjV0mxjYVEM1bNRGowpBipfHktTOFK/uWO8s/qSj40HF2vy
	144+7AzXnJkfTzEOdhMi/W5V8SUq+nX9Y12Y1t8KBhJljfwmuypzkBKJzymN9YLwSOxGGUfB/Gs
	lLSJRgo2dyjevlnVBPV79o9Lvark+0XM7Wt+fD5OIe5ZTmod3lmVqKB/n3PEQIxFeNBg0+LsGYc
	kTg2s7KfDtjv/9/va1WZlUES3IkDdn1/bpO+Lo0wxCHqoe2mgkNkiLc4U3HEBdD3S3vCbOgSjIH
	5vZrW8BLlTaqWxhdKVNlOVtN7V0sH2VWgmIDaC49tYx5QMDi
X-Received: by 2002:a17:90b:52c8:b0:3ad:6090:a189 with SMTP id 98e67ed59e1d1-3b3d07a545bmr2675748a91.45.1795001599893;
        Wed, 18 Nov 2026 03:33:19 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1c03e04sm3923274a91.15.2026.11.18.03.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:33:19 -0800 (PST)
Date: Wed, 18 Nov 2026 19:32:50 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen-Yu Yeh <chenyou910331@gmail.com>, 
	AnnanLiu <annan.liu.xdu@outlook.com>
Cc: Inochi Amaoto <inochiama@gmail.com>, Chen Wang <chen.wang@linux.dev>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, sophgo@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] riscv: dts: sophgo: add watchdog dt node for CV1800
Message-ID: <av2McZf10FiOKDcZ@inochi.infowork>
References: <DM6PR20MB2316366FC9ADCBC7B6E9C289AB7A2@DM6PR20MB2316.namprd20.prod.outlook.com>
 <20261113124748.339778-1-chenyou910331@gmail.com>
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Post: <mailto:sophgo@lists.linux.dev>
List-Help: <mailto:sophgo+help@lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sophgo+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113124748.339778-1-chenyou910331@gmail.com>

On Fri, Nov 13, 2026 at 08:47:47PM +0800, Chen-Yu Yeh wrote:
> On Thu, Jan 25, 2024 at 05:46:40PM +0800, AnnanLiu wrote:
> > Add the watchdog device tree node to cv1800 SoC.
> 
> Hi Annan, Inochi,
> 
> This patch was sent before the clock driver was merged, and I could not
> find a newer version on the lists. Mainline and the sophgo for-next
> branch still have no watchdog node for CV18XX/SG200X.
> 
> Annan, are you still working on this? If not, I would like to pick it
> up, with credit to your patch.
> 
> Inochi, before I start, is this plan fine?
> 
>  - Put the node in cv180x.dtsi and leave it enabled, since it does not
>    depend on the board.
>  - Use the clock controller instead of the stub clock. In the TRM clock
>    table, CLK_APB_WDT is the only clock for WDT0-2, fed by xtal without
>    a divider. The counter clock is selected by reg_wdt_clk_sel in
>    top_wdt_ctrl (top syscon, offset 0x1a8, xtal by default). Only the
>    RTC domain watchdog has a separate clk_wdt, in rtcsys_clk_en.
>    Should the node use <&clk CLK_APB_WDT> alone, or &osc as tclk and
>    CLK_APB_WDT as pclk?
>  - Keep the reset (RST_WDT) and the interrupt from this patch. The
>    vendor DT has the same interrupt (58) but no interrupt-parent for
>    it, and the TRM interrupt table names 58 "WatchDog1", so I will
>    check it with the pretimeout test.
>  - Test on a Milk-V Duo 256M (SG2002): timeout reset, pretimeout
>    interrupt and restart.
> 
> Regards,
> Chen-Yu

If you want to take this patch, you need to add all watchdog device
instead of the only one for RISC-V. There are three watchdog devices
for A53/C906 0/C906 1. IIRC only one can take effect at the same
time.

Regards,
Inochi
