Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920265;
	b=hUZNOzAnxhPb6DnNC1nG5cxifWjF+wu9/gv+Iwjgf7sEcgWIQe0rugp87b2/iXmC6TkB
	 M2xhOBGuoLJHmqQO+KTKIbr8RvqzTs6kAHRlut7Kt/VNfwBzmdJS6AEPEtaMIdSG2QGJh
	 g1zaca5l58SoJ2cwMzL02/6udtz0KUCOgo7STpORtiq4hPlu5RqEeHOYOhkht5DmrU5Ds
	 qONNrqLSdEmz7nDz2WbWwp8x0c3fzE9iBn6mRWEkTl8bx1BtevGcZ6JaOEwUNZG9fKxAf
	 DnKn4kFI3RA/kILNd4eACeEosrLpgXYFceCnxPqLkFTdQHNcZFIGZrxTSF5LwjuChPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=NQrUEKIgQADfS/33YKuEWTwKC79jGZABfGIvj6qgGpc=;
	b=rHgwbvb6Wcb6ryTjkc6rHE4xvqc2kHqIsXkkdNQeXeqo6oOelrxV9QsQ5dmtlW/S4UUC
	 SMJL8Kkaj1CjvE89El3zhElqw9rBUTizY01VxV524gZzG4JXyGMxQsdaGC2eb7Q/OEZny
	 PE4AJQHVwirlZZbczJPXUYpFqdTqPF05kHTAzf6CkV1eouDGeAEV2q7q/yOtb3MNTb0lp
	 VynXIVcUEZ1/wVlN/xkzWkk29aLVAiWQrDC2qkF/iBDpkmyLaR0F74Bg6jrIIiadfMBYU
	 SvDWCH+mRslU5wZNE+/darHNL/1M9QBykMGSWzDJQXBV7xXQC688jccFv0Ax1vCjv/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=eL+iJxQI;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C776A606A884
	for <sophgo@lists.linux.dev>; Tue, 17 Nov 2026 12:57:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C776A606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=eL+iJxQI
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-381f65e4e4bso403773eec.0
        for <sophgo@lists.linux.dev>; Tue, 17 Nov 2026 04:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794920264; x=1795525064; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NQrUEKIgQADfS/33YKuEWTwKC79jGZABfGIvj6qgGpc=;
        b=eL+iJxQI4kjHxfLVjwLlP7PR6b2VGSR0dR9QWisAOrD7RJu0J8XgVRkl6+hsDuDuoV
         alJSTtkvVgeb7LKIbRA+4ivM3xPqQ90ppAMs0zE809CygZXnehW4UUPyJc9JjeDh7F0d
         lYAGvBv8CEpSfa8MWzU1tq0cZyzDIBiHO5wLXes+tbb7eVntZRFItCSkHnboqCNGX89R
         dvyA1i9g/LiqHzNydwB6fbQxb/F9xxIxlScFACDuWcQEehLzmT+oAwBUET52F+uYsNah
         GOJbYz63S8H8S5AUFFDSYfQXuEOAF6au+h2kZ5Y5ChvYDg+f6Dl1TG2azLkykkEQ/6BB
         YOhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920264; x=1795525064;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NQrUEKIgQADfS/33YKuEWTwKC79jGZABfGIvj6qgGpc=;
        b=rgLQPR7KKMXNixC5kfnd4BIGA+PhnN1yiiTjS6E0hw3sVJGmWbr13a6YVRyA+I/cVN
         m7jeSWUA68QvDnFOnigNsBInOHZT93J4mJolGb1er/Npv/FmACCq4Z+JPUTON2H+MAvD
         CvlC+bT+Ig8OzzXOywWldxtGVEROcTpYruXxa1mr1MPnucySAppquNvZ+86uALH6idtk
         pdR2nKZZbRW0a9jtdcPbc7/u249O4gBMzBt3f3CNoL+g3lmG8GXmSqXHuC0mTt0HSbwi
         PwqyKuqqXoKWbo0GD38rR83fVN2Foq5MaHikB73H7uc+JrYryJzQufHaiZ8K0obxizF8
         BQGA==
X-Forwarded-Encrypted: i=1; AL+hErGyQGUyyEmOxunW7VAdwlXGCWIVDrBcfOJ7/h4l1LuaVZhcnrBIOw2qACa3qn0bKxM2TOuXqBA=@lists.linux.dev
X-Gm-Message-State: APuU4Z8wzPl5pfIoFCoI7BxndB0Q8y+UXs1HPYAK9YzUtweBsKNEZNHf
	1/oi12F1Qddfitq3jRmZopNirbllMfv3vI/M0K6bMAikZg0pjwLiJTMZpAn2Ch2sRVE=
X-Gm-Gg: AZFdTZfCGEPenOvm3Qk+q+xKvagBxPUz3n/nRpUbAel8nOHl84hYNHBWHK7jMmNqaeU
	Yb2WRFKS5qR4RgJO/RHxFHvY32QFBQEjLm4pLhdgMnADACkwyJjIcpavcrpagaOAxkn66qeuJfg
	BBual57TfO+s9hJfsYWDfp0PxJUtLmitj4jBW+OQH3n2WgRqfbULdAoVYM6TNc7p7ru5oQ3C0Bx
	xWw270Yt7bXk+sfHlFYMXzLbz2KeAqg7uooQYf120JVbnbesxgTKPlK5MFakVDFmPN7/Ls+rxY5
	p5q3l2c96lIUxez2GgIsunpR+IhUpnToOsTpWi4QHx9FZLB8n2yfTAeGZeUe/fciDPsgSgKws4H
	/JFRRyg3bCdbVvKsy6uh37//ral9fdG9hDD7r+18MP7RKx842WS3ZA5Aqv3SrKvt2mEw742/PYA
	WrSrcd6R7DU2p9i7vdi3Pg+pbe8pmWZqhvQJiSuUwuVoFNRsT2Xf2VRkwug9Ryi8dPAgVAXxE+T
	I+RoG/+Rgh7wKCk60zIMzQZUx5ML3PMStNZ68OsYLl2XzvJA9FlT4t++79aWr/BVzkJAgqrVQem
	q2tMwAIsZ7A5aDTr+Kh8iXUbq/wncaifrwjkplb15hx/PBFqNoOmC5cuKhuTV0Odsn/W
X-Received: by 2002:a05:693c:8114:b0:36e:a321:5353 with SMTP id 5a478bee46e88-37963371e09mr14353939eec.2.1794920263680;
        Tue, 17 Nov 2026 04:57:43 -0800 (PST)
Received: from [127.0.1.1] ([2804:14c:4c5:8bf0::a1aa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379559189e8sm44767034eec.11.2026.11.17.04.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:57:43 -0800 (PST)
From: Hiago De Franco <hfranco@baylibre.com>
Date: Tue, 17 Nov 2026 09:57:14 -0300
Subject: [PATCH 2/3] pwm: sophgo-sg2042: add support for CV1800B
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Post: <mailto:sophgo@lists.linux.dev>
List-Help: <mailto:sophgo+help@lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sophgo+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-milkv-duo-pwm-v1-2-3f1786ea57b7@baylibre.com>
References: <20261117-milkv-duo-pwm-v1-0-3f1786ea57b7@baylibre.com>
In-Reply-To: <20261117-milkv-duo-pwm-v1-0-3f1786ea57b7@baylibre.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Chen Wang <unicorn_wang@outlook.com>, linux-pwm@vger.kernel.org, 
 devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-Mailer: b4 0.16.0

The CV1800B SoC embeds four instances of a PWM controller derived from
the one found on the SG2042 and SG2044 SoCs. The register layout is
mostly the same, but there are some differences handled by this patch:

- PERIOD and HLPERIOD are 30 bits wide and PERIOD must be strictly
  greater than HLPERIOD. As a consequence, a 100% duty cycle cannot be
  represented and the period must be at least two input clock cycles.
- The meaning of the POLARITY bit is inverted compared to the SG2044:
  0 selects a low default level and 1 a high default level.
- A polarity change takes effect immediately, even while the channel is
  running.
- New values written to HLPERIOD/PERIOD while the channel is running are
  only latched after a 0 -> 1 -> 0 sequence on the PWMUPDATE bit.
- When the counter is stopped, the pin is parked at the level selected by
  POLARITY. Emitting the inactive level would require changing POLARITY,
  which would make the polarity read back from the hardware differ from the
  requested one, so the driver disables the output instead.

Add a dedicated set of pwm_ops for the CV1800B to take these differences
into account, and update the module description accordingly. Update the
Kconfig entry to describe all the SoCs supported by the driver,
including the already supported SG2044.

This was tested on Milk-V Duo with a logic analyzer (GP4/pwm1 ch1).

Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
---
 drivers/pwm/Kconfig             |   7 +-
 drivers/pwm/pwm-sophgo-sg2042.c | 201 ++++++++++++++++++++++++++++++++++++++--
 2 files changed, 199 insertions(+), 9 deletions(-)

diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index 729776086879..877d5bfa0bb0 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -671,11 +671,12 @@ config PWM_SL28CPLD
 	  will be called pwm-sl28cpld.
 
 config PWM_SOPHGO_SG2042
-	tristate "Sophgo SG2042 PWM support"
+	tristate "Sophgo SG2042/SG2044/CV1800B PWM support"
 	depends on ARCH_SOPHGO || COMPILE_TEST
 	help
-	  PWM driver for the PWM controller on Sophgo SG2042 SoC. The PWM
-	  controller supports outputing 4 channels of PWM waveforms.
+	  PWM driver for the PWM controller on Sophgo SG2042, SG2044 and
+	  CV1800B SoCs. Each controller supports 4 channels of PWM
+	  waveforms.
 
 	  To compile this driver as a module, choose M here: the module
 	  will be called pwm_sophgo_sg2042.
diff --git a/drivers/pwm/pwm-sophgo-sg2042.c b/drivers/pwm/pwm-sophgo-sg2042.c
index 0b6461172e6a..45eb1871a127 100644
--- a/drivers/pwm/pwm-sophgo-sg2042.c
+++ b/drivers/pwm/pwm-sophgo-sg2042.c
@@ -1,21 +1,30 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Sophgo SG2042 PWM Controller Driver
+ * Sophgo SG2042/SG2044/CV1800B PWM Controller Driver
  *
  * Copyright (C) 2024 Sophgo Technology Inc.
  * Copyright (C) 2024 Chen Wang <unicorn_wang@outlook.com>
  *
  * Limitations:
- * - After reset, the output of the PWM channel is always high.
+ * - After reset, the output of the SG2042 PWM channel is always high.
  *   The value of HLPERIOD/PERIOD is 0.
  * - When HLPERIOD or PERIOD is reconfigured, PWM will start to
  *   output waveforms with the new configuration after completing
  *   the running period.
- * - When PERIOD and HLPERIOD is set to 0, the PWM wave output will
+ * - When PERIOD and HLPERIOD is set to 0, the SG2042 PWM wave output will
  *   be stopped and the output is pulled to high.
- * - SG2044 supports both polarities, SG2042 only normal polarity.
- * See the datasheet [1] for more details.
+ * - SG2044 and CV1800B support both polarities, SG2042 only normal polarity.
+ * - On CV1800B the pin is parked at the level selected by POLARITY while the
+ *   counter is stopped. Emitting the inactive level would require changing
+ *   POLARITY, so the driver disables the output (input mode) instead.
+ * - On CV1800B a polarity change takes effect immediately, even while the
+ *   channel is running.
+ * - On CV1800B a 100% duty cycle is not representable. It is rounded down to
+ *   one input clock cycle less than the period.
+ * - On CV1800B the period must be at least 2 input clock cycles.
+ * See the datasheets [1] and [2] for more details.
  * [1]:https://github.com/sophgo/sophgo-doc/tree/main/SG2042/TRM
+ * [2]:https://github.com/sophgo/sophgo-doc/tree/main/SG200X/TRM
  */
 
 #include <linux/clk.h>
@@ -44,10 +53,14 @@
 
 #define SG2044_PWM_POLARITY		0x40
 #define SG2044_PWM_PWMSTART		0x44
+#define SG2044_PWM_PWMUPDATE		0x4c
 #define SG2044_PWM_OE			0xd0
 
 #define SG2042_PWM_CHANNELNUM	4
 
+#define CV1800B_PWM_MAX_PERIOD	GENMASK(29, 0)
+#define CV1800B_PWM_MIN_PERIOD	2
+
 /**
  * struct sg2042_pwm_ddata - private driver data
  * @base:		base address of mapped PWM registers
@@ -155,6 +168,14 @@ static void pwm_sg2044_set_outputen(struct sg2042_pwm_ddata *ddata, struct pwm_d
 	writel(pwmstart, ddata->base + SG2044_PWM_PWMSTART);
 }
 
+static bool pwm_sg2044_get_outputen(struct sg2042_pwm_ddata *ddata,
+				    struct pwm_device *pwm)
+{
+	u32 pwmstart = readl(ddata->base + SG2044_PWM_PWMSTART);
+
+	return !!(pwmstart & BIT(pwm->hwpwm));
+}
+
 static void pwm_sg2044_set_outputdir(struct sg2042_pwm_ddata *ddata, struct pwm_device *pwm,
 				     bool enabled)
 {
@@ -208,6 +229,171 @@ static int pwm_sg2044_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	return 0;
 }
 
+static int pwm_cv1800b_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
+				 struct pwm_state *state)
+{
+	struct sg2042_pwm_ddata *ddata = pwmchip_get_drvdata(chip);
+	unsigned int chan = pwm->hwpwm;
+	u32 hlperiod_ticks;
+	u32 period_ticks;
+	u32 pwm_polarity;
+
+	/* PWMSTART is set to 1 while the channel is running. */
+	state->enabled = pwm_sg2044_get_outputen(ddata, pwm);
+
+	period_ticks = readl(ddata->base + SG2042_PWM_PERIOD(chan));
+	hlperiod_ticks = readl(ddata->base + SG2042_PWM_HLPERIOD(chan));
+
+	if (!period_ticks) {
+		/*
+		 * No waveform is configured, so don't report a duty_cycle
+		 * larger than the period.
+		 */
+		state->enabled = false;
+		state->period = 0;
+		state->duty_cycle = 0;
+	} else {
+		if (hlperiod_ticks >= period_ticks)
+			hlperiod_ticks = period_ticks - 1;
+
+		state->period = DIV_ROUND_UP_ULL((u64)period_ticks * NSEC_PER_SEC,
+						 ddata->clk_rate_hz);
+		state->duty_cycle = DIV_ROUND_UP_ULL((u64)hlperiod_ticks * NSEC_PER_SEC,
+						     ddata->clk_rate_hz);
+	}
+
+	pwm_polarity = readl(ddata->base + SG2044_PWM_POLARITY);
+
+	/*
+	 * Without a configured waveform POLARITY has no meaning, so report the
+	 * neutral default instead of the register's reset value.
+	 */
+	if (period_ticks && !(pwm_polarity & BIT(chan)))
+		state->polarity = PWM_POLARITY_INVERSED;
+	else
+		state->polarity = PWM_POLARITY_NORMAL;
+
+	return 0;
+}
+
+static void pwm_cv1800b_set_pwmupdate(struct sg2042_pwm_ddata *ddata, struct pwm_device *pwm,
+				      bool enable)
+{
+	u32 pwm_update = readl(ddata->base + SG2044_PWM_PWMUPDATE);
+
+	if (enable)
+		pwm_update |= BIT(pwm->hwpwm);
+	else
+		pwm_update &= ~BIT(pwm->hwpwm);
+
+	writel(pwm_update, ddata->base + SG2044_PWM_PWMUPDATE);
+}
+
+static void pwm_cv1800b_set_polarity(struct sg2042_pwm_ddata *ddata, struct pwm_device *pwm,
+				     bool high)
+{
+	u32 pwm_polarity = readl(ddata->base + SG2044_PWM_POLARITY);
+
+	/*
+	 * POLARITY on CV1800B is the opposite of SG2044: 0 selects a low
+	 * default level (HLPERIOD counts low cycles), 1 selects a high
+	 * default level (HLPERIOD counts high cycles).
+	 */
+	if (high)
+		pwm_polarity |= BIT(pwm->hwpwm);
+	else
+		pwm_polarity &= ~BIT(pwm->hwpwm);
+
+	writel(pwm_polarity, ddata->base + SG2044_PWM_POLARITY);
+}
+
+static int pwm_cv1800b_set_dutycycle(struct pwm_chip *chip, struct pwm_device *pwm,
+				     const struct pwm_state *state)
+{
+	struct sg2042_pwm_ddata *ddata = pwmchip_get_drvdata(chip);
+	u32 hlperiod_ticks;
+	u32 period_ticks;
+	u64 ticks;
+
+	/*
+	 * Duration of High level (duty_cycle) = HLPERIOD x Period_of_input_clk
+	 * Duration of One Cycle (period) = PERIOD x Period_of_input_clk
+	 *
+	 * Different from sg2042, cv1800b has max of 30 bits and PERIOD must be
+	 * strictly greater than HLPERIOD. The shortest representable period is
+	 * two input clock cycles; reject anything shorter instead of rounding
+	 * it up.
+	 */
+	ticks = mul_u64_u64_div_u64(ddata->clk_rate_hz, state->period, NSEC_PER_SEC);
+	period_ticks = min_t(u64, ticks, CV1800B_PWM_MAX_PERIOD);
+	if (period_ticks < CV1800B_PWM_MIN_PERIOD)
+		return -EINVAL;
+
+	ticks = mul_u64_u64_div_u64(ddata->clk_rate_hz, state->duty_cycle, NSEC_PER_SEC);
+	hlperiod_ticks = min_t(u64, ticks, period_ticks - 1);
+
+	dev_dbg(pwmchip_parent(chip), "chan[%u]: ENABLE=%u, PERIOD=%u, HLPERIOD=%u, POLARITY=%u\n",
+		pwm->hwpwm, state->enabled, period_ticks, hlperiod_ticks, state->polarity);
+
+	pwm_sg2042_config(ddata, pwm->hwpwm, period_ticks, hlperiod_ticks);
+
+	return 0;
+}
+
+static int pwm_cv1800b_apply(struct pwm_chip *chip, struct pwm_device *pwm,
+			     const struct pwm_state *state)
+{
+	struct sg2042_pwm_ddata *ddata = pwmchip_get_drvdata(chip);
+	bool high = state->polarity == PWM_POLARITY_NORMAL;
+	bool running = pwm_sg2044_get_outputen(ddata, pwm);
+	int ret;
+
+	if (!state->enabled) {
+		/*
+		 * While the counter is stopped the pin is parked at the level
+		 * selected by POLARITY, i.e. at the level the waveform starts
+		 * with. Emitting the inactive level would require changing
+		 * POLARITY, which would make the polarity read back from the
+		 * hardware differ from the requested one. Disable the output
+		 * instead.
+		 */
+		pwm_sg2044_set_outputen(ddata, pwm, false);
+		pwm_sg2044_set_outputdir(ddata, pwm, false);
+
+		return 0;
+	}
+
+	ret = pwm_cv1800b_set_dutycycle(chip, pwm, state);
+	if (ret)
+		return ret;
+
+	pwm_cv1800b_set_polarity(ddata, pwm, high);
+
+	if (!running) {
+		pwm_cv1800b_set_pwmupdate(ddata, pwm, false);
+		pwm_sg2044_set_outputdir(ddata, pwm, true);
+		pwm_sg2044_set_outputen(ddata, pwm, true);
+
+		return 0;
+	}
+
+	/*
+	 * Write 1 and then 0 to PWMUPDATE[n] to latch new HLPERIOD/PERIOD
+	 * values while the channel is running.
+	 */
+	pwm_cv1800b_set_pwmupdate(ddata, pwm, true);
+	pwm_cv1800b_set_pwmupdate(ddata, pwm, false);
+
+	return 0;
+}
+
+static const struct sg2042_chip_data cv1800b_chip_data = {
+	.ops = {
+		.apply = pwm_cv1800b_apply,
+		.get_state = pwm_cv1800b_get_state,
+	},
+};
+
 static const struct sg2042_chip_data sg2042_chip_data = {
 	.ops = {
 		.apply = pwm_sg2042_apply,
@@ -224,6 +410,9 @@ static const struct sg2042_chip_data sg2044_chip_data = {
 
 static const struct of_device_id sg2042_pwm_ids[] = {
 	{
+		.compatible = "sophgo,cv1800b-pwm",
+		.data = &cv1800b_chip_data,
+	}, {
 		.compatible = "sophgo,sg2042-pwm",
 		.data = &sg2042_chip_data,
 	}, {
@@ -296,5 +485,5 @@ module_platform_driver(pwm_sg2042_driver);
 
 MODULE_AUTHOR("Chen Wang");
 MODULE_AUTHOR("Longbin Li <looong.bin@gmail.com>");
-MODULE_DESCRIPTION("Sophgo SG2042 PWM driver");
+MODULE_DESCRIPTION("Sophgo SG2042/SG2044/CV1800B PWM driver");
 MODULE_LICENSE("GPL");

-- 
2.53.0

