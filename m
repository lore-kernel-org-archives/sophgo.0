Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F336823F41A
	for <sophgo@lists.linux.dev>; Wed, 26 Nov 2025 17:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764178104; cv=none; b=daddppBOlRQwTt7uokNvRxgWuxSCpmNBZZ73PzY13jaNRW4VQY7Fm4VdCZODWRupinWCGpqPH3n35O1u2y/5r1Xephh7SUuCkR9DmUYltc22qFZtd8t5mSgoGZD5+eZZKCmEcZ5laPi8nC93EFGeIW3jVh423nvgyyW7y5TpZD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764178104; c=relaxed/simple;
	bh=lsSHuC069xpQipphElBW/HG7hp8LOPDCQOeided1vIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mRQIVI/VtqOMydosdYH1OqIQjnpWEx1bVgPm3zMyqIzUTzqOw9P2C6A8XnRat0845y14tZqNptrjkyUgWidtZYXxu9Y1Z+iVLarSNXrFdRGLtfwLwtXBYYVcUj1HxSNNn5lqNHNiYFLOP1VPIWXXd10CjHrVctT5qJRO9l9IZS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UDRYLfVX; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UDRYLfVX"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42b2dc17965so68527f8f.3
        for <sophgo@lists.linux.dev>; Wed, 26 Nov 2025 09:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764178099; x=1764782899; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5iIZajcwOeO3JlEw92TE30lt4StjWSsYhVcOwVzrTLk=;
        b=UDRYLfVXS3kWC0lYeYz3Gtu2YAYMtkysHJdcHgiWjaJGRFGfFC1UKdD1Uff82BRo/x
         pDnmJ7nzwU/MCwRmhHTdNYEwrgn+GNepM/0DwPgFc7fItpzO0J8273m55Lz2EOVxKMpb
         0nulaZb1vUfjIg6jFPRQTe2XA2hQBScEcebnm/tYTkfth0SfIDhN9bpQiWeU/uYo58bz
         ELxEGNEkIQTcKtTDxzD2QKcqQGh2gzzGQbb+/NrcpcghNSjOcc0rX4gKv93U9QDzj2fj
         gMs8FT1o2cMrNtr/S3j8QLVX2vqfMNag8QpsIMUvWl/r7A2WRmHzsrYGE0tHfKKkfyUZ
         h7UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764178099; x=1764782899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5iIZajcwOeO3JlEw92TE30lt4StjWSsYhVcOwVzrTLk=;
        b=bgYEah8t1BzoYH6RRmqdvBUFbMpf7KHOPWdCwqSOcF/2RCSv392OKP0yiQ8JiH4afw
         9rEy/+qcO9mJpYt90t8MO+/0Zo5gYKUR8mVMXlAr7HH6NGbeSpWvacyYlbwdEY10wf/Q
         FoArolwEkVU/innVXuB6IK32CzQ8vw2SJNSGGMG0pKRGevBaAC7JiYHDO+3mc4n8sCcS
         +HsxGyuokrdxRVTdZi6ih5RAXAyZkmsvkGyICgU80id1Bi4EG5bNbTxGT4uKvzOfvuFX
         8dP0MMgtfgS7HZ23z2L6t3hpT1tC0j6Mf3vEyczftai6mRPlhc5LmWkSP1lAK62GNgG7
         AePg==
X-Forwarded-Encrypted: i=1; AJvYcCU/nQ08agHyKZaDH4KW8Qpm2Chl+cLMlszTDajLslic6/zbuN83UdOpsaYirEjpfgdgjK9LWO8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7Kzeo8+B/8kJMGpeygI0jbDIG98+rr2waVF28Zc3hYNIKM6M4
	sl5AlVLuXIPC5B7U0cERDUBtw50wq4opS1JB0nleFHQZ4ZtbypuyBKqO
X-Gm-Gg: ASbGncsZuBOCkLNz4YTqwyw6lETbq/Ly1mZ3+1uyv70c7zZIFSunStzCifG+CqN0g5J
	0BIWsebVZmRZDZ0gxvi/0cOjI1prvXPF5mP7bDbFX7gZEVesnAL0/Kjm0f0xhPRpDRPGq2hFq7Z
	ldp4Qv2Mww0RJ4k9Aqydq18XdDpcQ799DKERFSMZFZiLHcRQjOm9BRX74rkSB0LMfsw3LMLdCsn
	mCg4sxG5KSspW4BJrRsesJJRyS8ngtgHsU+9YJ9faMRfVl1czM4BEgLMIrOg4wSnWZ7OKC92/u0
	Z7R8eisleE5hD+igfEcacheJas+WBcci2a1esL+gvj6FC8cEGSjtb1F5F42Gc50DHQKoOGpOaGO
	B9kUdI6fujOoV2zueVnKXMvgjHpNVJXqS7bOOQ3Fw+Le7n0kBNdmjB9XmR9eYklyyBoPCMimd6E
	Xzyd4JOEcG27bJhYqkEAaAkHbtbQsFxR72weDWHUErkY6TU+I/WCK7Prs=
X-Google-Smtp-Source: AGHT+IHkE1xTyUwd1e1nQxaACHjDh3t9YedvuMNt3v7wo3xJTnJ11as69WRfu3TcTpDawcaME3AxHA==
X-Received: by 2002:a05:6000:2881:b0:429:bc56:cd37 with SMTP id ffacd0b85a97d-42cc1ac9ce9mr21647296f8f.6.1764178099006;
        Wed, 26 Nov 2025 09:28:19 -0800 (PST)
Received: from dev-AI-Series.. (bba-86-96-93-57.alshamil.net.ae. [86.96.93.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f34fddsm42423862f8f.14.2025.11.26.09.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 09:28:18 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
To: inochiama@gmail.com
Cc: alex@ghiti.fr,
	alexander.sverdlin@gmail.com,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlan@gentoo.org,
	huangze@whut.edu.cn,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	looong.bin@gmail.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	sophgo@lists.linux.dev,
	thomas.bonnefille@bootlin.com,
	unicorn_wang@outlook.com,
	yu.yuan@sjtu.edu.cn,
	"Anton D. Stavinskii" <stavinsky@gmail.com>
Subject: [PATCH] riscv: dts: sophgo: cv180x: fix USB dwc2 FIFO sizes
Date: Wed, 26 Nov 2025 21:21:16 +0400
Message-ID: <20251126172115.1894190-2-stavinsky@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611082452.1218817-4-inochiama@gmail.com>
References: <20250611082452.1218817-4-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I've tested the current dwc2 FIFO configuration and found that USB
device mode breaks in ECM mode when transmitting frames larger than
128 bytes. For example, large ICMP packets or iperf3 traffic cause
the USB link to hang and eventually disconnect without any messages in
dmesg.

After switching to more conservative FIFO sizes, ECM becomes stable
and no longer drops the connection. iperf3 now shows ~130 Mbit/s RX
and ~100 Mbit/s TX on SG2002 (MilkV Duo 256M).

Fix the FIFO sizes accordingly.

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 1b2b1969a648..06b0ce5a2db7 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -438,8 +438,8 @@ usb: usb@4340000 {
 			clocks = <&clk CLK_AXI4_USB>, <&clk CLK_APB_USB>;
 			clock-names = "otg", "utmi";
 			g-np-tx-fifo-size = <32>;
-			g-rx-fifo-size = <536>;
-			g-tx-fifo-size = <768 512 512 384 128 128>;
+			g-rx-fifo-size = <1536>;
+			g-tx-fifo-size = <128 128 64 64 64 64 32 32>;
 			interrupts = <SOC_PERIPHERAL_IRQ(14) IRQ_TYPE_LEVEL_HIGH>;
 			phys = <&usbphy>;
 			phy-names = "usb2-phy";
-- 
2.43.0

