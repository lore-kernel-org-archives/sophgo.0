Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688598;
	b=bjoKiumqlrnWnMwVXD6ILB28VZLSp2IFMbchE1mbuDBMj93OJjsdWJWfpYCfYNECak+8
	 s313G3d1krwdb2SAWAnI4dgsGp4zGSEJVv4e0m4v+XK5PhcSSxVT2/AUBtZlk6IzTP1nY
	 KBfOgX+6BFPfgDqVNym+CrO9tVj8YSuaAggONmoOLluzBFKN4VOHLMQ6TNmfBrCg8QD2R
	 fkd17TxPVJtdtEdvcwYlflw6RzamOSFK+ggoOWb4OCbgGIUp+cyd3BRJGxZ0JmS5g+eap
	 xP5mk1SfW48yVCBwAO0eMwyWWfZjslhzPKtnxAyWKBefj5HCIXsoUUzCqE64aFmLnXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=H6N0X50m/DSlTn3HtbgXOmagDGxOT5v+Biy9jycT3iw=;
	b=zhvsLTpmUM/X+WY57I/3+laH0H10osjFSlSeu3CNR8LP5FHyLvIzmRscHIP+DPW1qQVL
	 m9ZoVGNW81t/eVHDL0n07E8u5etnKIjnmwYBo9yjOLOc7WqAMlCxqtQLlnhvWd4G8iq46
	 2huiKC7KhyCZf0T+dsPU8FmnfMGPAt8tzmxSt2Qetww0EG1/V+ZH0AWT/u8/K59kMe+UY
	 eL9UHB+AFdfmFbz8Iyrbdw5BoT7Z4nnaYUO6nMbyfVA7Ly+c0KSZ46IuBUWpX2tUWhacB
	 FOtHZKOUIggz6zo7KX9NusbdMlmNmcVPz9qqpOADB4KI91/JtQjaKgSpp6aWd2lR+4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gt0MBEOQ;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14EC606A31C
	for <sophgo@lists.linux.dev>; Thu, 26 Nov 2026 10:23:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B14EC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gt0MBEOQ
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b413f6dda6so859217a91.2
        for <sophgo@lists.linux.dev>; Thu, 26 Nov 2026 02:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795688597; x=1796293397; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H6N0X50m/DSlTn3HtbgXOmagDGxOT5v+Biy9jycT3iw=;
        b=gt0MBEOQpfBsE9oZm+zphgHhb+neaNrNrUWUljcMK54S4z6v+IKPXc2MbfLpMyB5uM
         EsHcSMo/thLRCyLsVxgtUfGdHQq7JFar4IA82ZIUK1QGEQYqNrCnQigEVCtE2qpYCRDu
         o8BvIsMPZoypl73QofHLTQPc31oDgfbQYv4HHb8LAuefQh3kRBBysXTfCLX0y/Hhmq/m
         0zApLVBKhOVhZNEgn4AickTJDa3yqAkl7sfVPfY/z9AZULnfCVMigP9LW8xT3bt318b6
         1zmg9VbcmIz6D4XS62Sve6WlaI2f4/aRTEHNcWClt7g8FPGukXGIPIXtQT07tFyuuBBV
         2XSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688597; x=1796293397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H6N0X50m/DSlTn3HtbgXOmagDGxOT5v+Biy9jycT3iw=;
        b=mGFQ7uo0vEjxgBOZ9RGPYKws8oZAKnHeDoHbyQIhYmKb45bm7rAFr6rYSewaDSpH4P
         IMncBT0ovTi+NBh1+D6j0Ajc7qom7A3wIIYIvygEtaA1GjW1lw9jdTbJcN7DPVM6c+Ae
         Jf0VRT+DiwR+Ilvik+MaJLEmP4/Aus5G9n26UOveaha+yai5pPyGzsmi0aE7/s3ljwxU
         gQJ17goQ4qfySbvU5I2t1X368+21W+ToEVWfEGvLFMkm1yuObAxq7Oqu+UZr2IgRqpfr
         xuNIxnprMeyD71aTLkyOZdNGdvnnNCfeQ8liXjNYUCSSWWOuzELvj5nJf8yQKR9WpxLz
         h2UA==
X-Forwarded-Encrypted: i=1; AL+hErGUs0T6VMr5K/dNgbwK/rt2WCCsnGrdFu40Vcu11rjTszjmjCxsCBIYtaTrs1QDdoL5qXot3Hs=@lists.linux.dev
X-Gm-Message-State: APuU4Z8KfWI8IH7VtWw4YZmszovB3F4LQTh9HpPuRJLPuxrSbZe3vwT2
	/n7y17fEs7aQGqwWKFW92kEIE8V+lB69tROxOtFRo+KVr2LlLqAyYvgf
X-Gm-Gg: AZFdTZc/BpanxrqPww62hP3cR5nbh4bHec3nXpV4CDGk2Lwl2vxvtVMKtiZYjWefLPG
	y0HC1Zc4ha0/RL1OiAJodCW3WEIrV3/V4u59C+48tNM8BWwMpYMoaTbqdyNQXWhqeu1oRkSl0By
	t/RbIerf2T2iER3bP0Edc+6rLEsDfAKK4omZJG1n1t+Uz943DUrq4RNxMzJiQOcSR3qZmdM0L6N
	2nxot5toiDMg0EExPdis2vbOdWjR2zeTD5N0jNIj2HDx7ixI34I+8VwgAYpQ52FXYYkPEiLAQV5
	ed4mXpb5uYHhNxL7lhYX/Fke4EvrkK2yTk0T0udbvi/dOYcZNcQnebswcP+F0kB8oXEJ7q391gp
	gN8whA5RnebHEoe4GE/rhqM/XXy0QbOzbkDKdDDD57T7ZRgT+LgBvr7MIgX3ePcDrRoRKTDDskb
	oRPPVWUfMkHh7ywV45txaEUuOS9vZ+5eigqtdx//QSW5mSigVjEFJI0vpvEpGn7BI80cqYT6hrv
	SpXR808iyDRtRevUJZFciGwDZNWxGXlfkysyqR6LySe92tMjtM7pn74miw4iSgUWBDPid1HXFWB
	XUhdGeAPbHE4RCfpj/vi5MZI9Rh/+bR9FnF1WeJjnjNSIrlv5AbFmgK6VBxwqVqPyzBhYkRRmMW
	LZP4mryHI4E/7
X-Received: by 2002:a17:90b:498c:b0:3ac:73c7:9c07 with SMTP id 98e67ed59e1d1-3b41c55b914mr29450973a91.0.1795688596883;
        Thu, 26 Nov 2026 02:23:16 -0800 (PST)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc6130sm10758422a12.7.2026.11.26.02.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:23:16 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Vadim Yuzifovich <vadim@yuzi.co>
Cc: gregkh@linuxfoundation.org,
	thinhnguyen@synopsys.com,
	inochiama@gmail.com,
	linux-usb@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] usb: dwc2: gadget: descriptor DMA fixes for BNA, found on Sophgo SG2002
Date: Thu, 26 Nov 2026 18:23:06 +0800
Message-ID: <20261126102309.859777-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116070433.2813951-1-vadim@yuzi.co>
References: 
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Post: <mailto:sophgo@lists.linux.dev>
List-Help: <mailto:sophgo+help@lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sophgo+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Vadim,

I tested v2 on a Milk-V Duo 256M (SG2002), on top of 65e4fd942f72
(v7.4-rc3-406), with "p->g_dma = false;" removed from
dwc2_set_cv1800_params() and dr_mode set to "peripheral" in the board
DTS. The params file in debugfs shows g_dma 1 and g_dma_desc 1. The
gadget is a configfs composite of ECM, mass storage (a 16 MiB file) and
UAC1 with req_number 8, on an x86 host with xHCI, high speed.

Three kernels: A without the series, B with patches 1 and 2, C with all
three. On each:

- iperf3 over ECM, 60 s in each direction
- dd of the whole LUN with O_DIRECT, one write and 20 reads
- sg_turs -n 200000 on the LUN, while the board copies a 32 MiB file
  in tmpfs to /dev/null in a loop
- speaker-test playing a 440 Hz sine into UAC1 for 5 minutes. After
  30 s the board writes a 120-character KERN_ERR line to /dev/kmsg
  every 2 s, so each line goes out on the 115200 baud serial console,
  about 10 ms like the hold in your test.

                        A           B           C
  iperf3 in/out Mbit/s  138/94.9    149/97.9    142/95.9
  dd write/read MB/s    6.6/18.8    5.8/23.6    8.9/23.5
  sg_turs per second    3432        3279        3359
  UAC1 runs wedged      3 of 4      0 of 2      0 of 1

iperf3 is host to board / board to host. No retransmits, no sg_turs
errors and no dd errors on any kernel.

On A, two runs wedged within about 45 s of playback with the console
lines: speaker-test failed with -EBADFD and the host reset the port.
The third went through the 5 minutes and wedged when playback stopped.
The SET_INTERFACE to alt 0 timed out on the host (-110), and at the
port reset the board logged

  dwc2_hsotg_ep_stop_xfr: timeout GINTSTS.GOUTNAKEFF
  dwc2_hsotg_ep_stop_xfr: timeout DOEPCTL.EPDisable

after which the host could not enumerate the device again. Rebinding the
UDC on the board failed; only a reboot recovered it. This looks like
what you describe for patch 1, EP0 not answering after the stall, but I
cannot show the BNA itself: on A it is dev_dbg and my config has no
CONFIG_DYNAMIC_DEBUG, so the link to BNA is from the symptoms only.

On B and C no run wedged. After the console lines, arecord on the board
captured the sine, and after playback stopped the gadget was still
configured with no port reset.

On C I also ran everything together for 30 minutes: the sine, the
console lines, the copy loop, iperf3 -R for 1800 s and sg_turs
9 x 200000. iperf3 moved 11.0 GB at 52.3 Mbit/s on average with no
retransmits, sg_turs had no errors, and
the host logged no reset. Afterwards arecord on the board still
captured the sine.

The "BNA, DxEPINT" warning from patch 2 did not appear on B or C, and A
showed no bulk errors either. My copy loop is much lighter than your
H.264 encode, so patches 2 and 3 ran here without being exercised; for
those this shows only that nothing regressed. The UAC1 counts are also
small, 4, 2 and 1 runs plus the 30 minutes.

Tested-by: Chen-Yu Yeh <chenyou910331@gmail.com> # Milk-V Duo 256M

Thanks,
Chen-Yu
